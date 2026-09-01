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

`check_all` now passes clean: the 21 findings it originally reported were
fixed in the sources (2026-09-01) — `beautiful_love.ly.tera` was brought up
to the house conventions (`\myMark "A"`, `\myEndLine`/`\myEndLineVolta*`
line breaks in the chords part instead of raw `\break` in the voice,
`} \alternative {` on one line, `\endBar`/`\endTune` instead of
`\bar "|."`, trailing whitespace stripped), four composer/poet fields
joined with "and" were changed to comma-separated
(`cocktails_for_two`, `im_sitting_on_top_of_the_world`,
`prelude_to_a_kiss`), and `robbins_nest`'s bare `\tempo 4 = 120` got its
piece name (`\tempo "Medium Swing" 4 = 120`). The books recompiled cleanly
after the changes.

One known finding remains in the opt-in checks:

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
2. Consider flipping `explicit.check_all` to `enabled = true` so it gates
   CI (long-standing wish in `doc/TODO.txt`) — it passes clean now.
3. ~~Delete the `Makefile` and the scripts it drove~~ — done (2026-09-01):
   the `Makefile`, `scripts/check.py`, `scripts/wrapper_mako.py`, and
   `scripts/wrapper_lilypond.py` are deleted; `scripts/build_on_docker.sh`,
   `README.md`, and `snippets/main.md.mako` now describe the rsconstruct
   workflow. The mako tree (`src/`, `include/*.mako`, `scripts/attr.py`,
   `scripts/convert_to_tera.py`) is kept: `convert_to_tera.py drivers` is
   the tool that regenerates the driver templates when a tune is added,
   and it partially evaluates `include/common.ly.mako` (where TONALITY
   still lives) to do so.

## Cold-build fix (2026-09-01)

CI was failing on cold runners: the tera drivers `load_toml` per-song
metadata from `out/derived/`, which only existed locally (written by a
manual `convert_to_tera.py drivers` run). The build now self-hosts it:
`[processor.generator.derive_metadata]` derives one
`out/derived/<book>/<song>.ly.toml` per song from the front matter of
`src.tera/<book>/<song>.ly.tera` (`scripts/derive_metadata.py`). The
derived files were renamed `.toml` → `.ly.toml` (and the driver templates
regenerated to match) so the generator's output naming lines up exactly —
that exact-path match is what orders derivation before the tera renders.
A from-scratch build (`out/` and cache wiped) passes: 651 products, 0
failures. This also means front-matter edits now propagate to the books
on every build instead of waiting for a manual drivers run.

## Mako removal and tree rename (2026-09-01)

The mako song tree is gone and the tera tree took its place:

- deleted: `src/` (the 195 `.ly.mako` songs), `include/` (`common.ly.mako`,
  `defs.ly.mako`), `scripts/convert_to_tera.py`, `scripts/attr.py`, and the
  `mako` dependency (removed from `pyproject.toml`, `uv.lock` refreshed).
- renamed: `src.tera/` → `src/`; every `src.tera/` reference in the song
  sources, driver templates, configs, checks, and docs now says `src/`.
- kept: `include/common.ly.mako`'s text lives on as
  `src/include/common.ly.weave` — the "weave master" that
  `scripts/drivers.py` (the mako-free descendant of `convert_to_tera.py`)
  partially evaluates to generate the driver templates, the per-song
  derived metadata, and `src/include/common.ly.tera`. It still uses
  mako-style syntax but is processed by our own evaluator; the mako
  package is not involved. TONALITY lives there.

Verified: the regenerated drivers are byte-identical to the previous
committed ones modulo the `src.tera/` → `src/` path change (all 195 song
drivers and 5 book drivers), `src/include/common.ly.tera` regenerates
byte-identically from the weave, a from-scratch cold build passes (639
products, 0 failures), `check_all` passes, and a per-song PDF still
engraves.

## Drivers generated at build time (2026-09-01)

The ~200 committed driver templates (tera.templates/out/tera/**) are gone
from git — they were pure duplication, deterministically derivable from
the song front matter plus the weave. The build now generates them:

- `[processor.generator.song_drivers]`: one driver per song, from the
  song's derived metadata toml (drivers depend only on front matter, not
  the tune body), into `out/drivers/out/tera/src/`.
- `[processor.explicit.<book>_driver]` (×5): one driver per book from a
  glob over the book's derived tomls, which grows across rsconstruct's
  discovery passes so cold builds see every song.
- the tera processor's `src_dirs` gained `out/drivers`, so the generated
  drivers render to the same `out/tera/` paths as before.
- `src/include/common.ly.tera` is now a first-class committed source: the
  weave's `defs` block (its duplicate) was excised.
- the engraving tonality moved to `TONALITY_PITCH`/`TONALITY_NAME` in
  `scripts/drivers.py` (the weave's TONALITY had been dead text since the
  tera port).
- `git holds exactly ONE file per song`; `tera.templates/` shrank to
  `docs/index.html.tera`; adding a tune is now "add the one file, build".

This needed two rsconstruct fixes (in ~/git/rsconstruct, to be released
before openbook is pushed, since CI downloads the latest release):
1. the tera dependency analyzer no longer hard-fails scanning a template
   that is itself a not-yet-built product output;
2. the tera processor skips not-yet-built templates when preloading the
   includable set (a render that really includes one is ordered behind
   its producer by the graph).

Verified: cold build from nothing is green (839 products, 0 failed), all
200 rendered .ly files byte-identical to the committed-drivers era, a
front-matter edit propagates toml → driver → render incrementally and
reconverges to zero rebuilds.
