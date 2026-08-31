# Makefile → rsconstruct migration status

Comparison of what the old `Makefile` built against what `rsconstruct build`
builds today (as of 2026-09-01). Bottom line: everything a plain `make`
actually produced is covered, linting is stronger, and the non-default
Makefile targets are now opt-in processors (see below) — the one remaining
gap is that the book outputs no longer land where the website expects them.

## Covered: the default `make all` outputs

The flags at the top of the Makefile enabled three things by default
(`DO_LY=1`, `DO_BOOKS_PDF=1`, `DO_LINT=1`):

| Makefile output | In rsconstruct? |
|---|---|
| Per-song `.ly` from mako (`DO_LY=1`) | Yes — tera renders `out/tera/src/<book>/<song>.ly` for every song |
| 5 book PDFs+PS via lilypond (`DO_BOOKS_PDF=1`) | Yes — the five `[processor.explicit.*]` entries build `openbook`, `israeli`, `drumming`, `rockbook`, `guitar_album` |
| pylint on scripts (`DO_LINT=1`) | Yes, and expanded — ruff, pylint, and mypy over `src`/`scripts`/`config`, plus shellcheck, luacheck, taplo, and actionlint |

## Gap: book output location vs. the website

The Makefile wrote the books to `docs/output/` (`OUTPUT := docs/output`),
which is exactly where `docs/index.html` links them (`output/openbook.pdf`,
`output/openbook.ps`, `output/openbook.ly`). rsconstruct builds them to
`out/tera/books/` instead, and nothing in `rsconstruct.toml` copies them
over. There is also no `[pages]` section, so CI's pages-deploy step skips.

The files currently in `docs/output/` are stale leftovers from the Makefile
era. If the website is still meant to serve fresh books, those links are
broken now. Fixing this means either publishing `out/tera/books/` into the
pages tree or adding a copy step plus a `[pages]` config.

## Opt-in processors (the non-default Makefile targets)

Every Makefile target that was not part of `make all` is now a processor
stanza in `rsconstruct.toml` with `enabled = false`. A disabled processor is
invisible to the normal build; activate one for a single run with rsconstruct's
`--iset` per-instance config override, which is applied after the config is
loaded and before discovery filters on `enabled`:

```sh
rsconstruct build --iset explicit.check_all.enabled=true
```

| Old target | Processor (iname) | Notes |
|---|---|---|
| `make check_all` + `scripts/check.py` | `explicit.check_all` | `scripts/check_all.py`, the old grep checks and check.py content checks ported from the mako tree to `src.tera/` |
| `make checkhtml` (`DO_CHECKHTML`) | `tidy`, `htmlhint` | validate `docs/index.html`; htmlhint must be installed |
| per-song PDF (`DO_PDF`) | `generator.songs_pdf` | one product per rendered song in `out/tera/src`, via `scripts/wrapper_lilypond_song.py`, into `out/songs/pdf/` |
| per-song PS (`DO_PS`) | `generator.songs_ps` | same, into `out/songs/ps/` |
| per-song MIDI (`DO_MIDI`) | `generator.songs_midi` | same, into `out/songs/midi/` |
| wav (`DO_WAV`) | `generator.midi2wav` | `scripts/wrapper_midi_audio.py` (timidity), consumes `out/songs/midi` |
| ogg (`DO_OGG`) | `generator.midi2ogg` | timidity -Ov |
| mp3 (`DO_MP3`) | `generator.midi2mp3` | timidity piped to lame; replaces the deleted midi2*.pl perl wrappers |
| `make real_books_archive.gi` | `explicit.real_books` | `scripts/download_real_books.py`, extracts to `real_books_archive.gi/` at the repo root |

Verified working: `check_all`, `tidy`, `songs_pdf`, `songs_ps`,
`songs_midi`, `midi2wav`, `midi2ogg`, `midi2mp3` (audio checked on one song
end to end). `real_books` and `htmlhint` are wired but were not exercised
(large download; htmlhint not installed locally).

Chaining note: the per-song and audio generators scan generated trees
(`out/tera/src`, `out/songs/midi`), so on a cold checkout run a plain
`rsconstruct build` first (and build midi before enabling the audio
processors).

Known findings the opt-in checks currently report (pre-existing content
issues, the reason `check_all` was never part of `all`):

- `check_all`: 21 errors — 16 in `src.tera/openbook/beautiful_love.ly.tera`
  (trailing whitespace, `\bar`/`\break` usage, `\alternative` layout, no
  `myMark`, no `myEndLineVolta`), four composer/poet fields joined with
  "and" instead of a comma (`cocktails_for_two`,
  `im_sitting_on_top_of_the_world`, `prelude_to_a_kiss`), and one unquoted
  `\tempo 4 = 120` in `robbins_nest`.
- `tidy`: warns on the proprietary `mozdisallowselectionprint` attribute on
  `<html>` in the generated `docs/index.html`.

## Not migrated

- **`make todo`** and **`make debug`** — informational conveniences
  (`git grep TODO out/` and `rsconstruct status`/`graph`/`product` cover
  them).
- **`make clean*`** — `rsconstruct clean` is the replacement.
- **`check_hardcoded_names`** (grep for "veltzer" across the repo) — was
  not part of `check_all` even in the Makefile and cannot pass as written
  (the name legitimately appears in config and credits).

## Suggested follow-ups

1. Decide how the built books reach the website (pages config or copy
   step), then remove the stale artifacts from `docs/output/`.
2. Fix the 21 `check_all` findings, then consider flipping
   `explicit.check_all` to `enabled = true` so it gates CI (long-standing
   wish in `doc/TODO.txt`).
3. Once nothing depends on it, delete the `Makefile`, the legacy mako tree
   scripts it drove (`scripts/check.py`, `scripts/wrapper_mako.py`,
   `scripts/wrapper_lilypond.py`), and the audio/MIDI documentation in
   `doc/generating_mp3.txt` that references the removed perl scripts.
