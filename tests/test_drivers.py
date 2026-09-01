"""
Golden tests for the driver generator (scripts/drivers.py).

DriverEmitter is a whitespace-exact partial evaluator whose output feeds
every render in the build; a regression there silently changes all 200
outputs. These tests pin its behavior on the test song
(src/test/demo.ly.tera) against a checked-in expected driver, and check
the derived-metadata contract the templates rely on.

Regenerate the fixture deliberately after an intended weave/emitter
change:

    python -m scripts.drivers songs out/derived/test/demo.ly.toml \\
        tests/expected_demo_driver.ly.tera
"""

from pathlib import Path

from scripts.drivers import (
    GATTR_SINGLE,
    SINGLE_VARS,
    DriverEmitter,
    derived_content,
    driver_header,
    parse_song_meta,
    toml_to_song,
)

DEMO_SONG = Path("src/test/demo.ly.tera")
EXPECTED_DRIVER = Path("tests/expected_demo_driver.ly.tera")
WEAVE = Path("src/include/common.ly.weave")


def generate_demo_driver() -> str:
    """ produce the demo song's driver exactly as the build does """
    meta = parse_song_meta(DEMO_SONG)
    emitter = DriverEmitter(GATTR_SINGLE, [meta])
    body = emitter.run(WEAVE.read_text(encoding="utf-8"))
    return driver_header(SINGLE_VARS) + body


def test_demo_driver_matches_golden():
    """ the emitter's output for the demo song is byte-identical to the fixture """
    assert generate_demo_driver() == EXPECTED_DRIVER.read_text(encoding="utf-8")


def test_derived_content_contract():
    """ the derived toml carries the sections the driver templates load """
    meta = parse_song_meta(DEMO_SONG)
    content = derived_content(meta)
    assert "[attributes]" in content
    assert "[has]" in content
    assert "[computed]" in content
    assert "tocname = " in content
    assert "copyright = " in content


def test_toml_to_song_roundtrip():
    """ derived-toml paths map back to the song sources they came from """
    meta = parse_song_meta(DEMO_SONG)
    assert toml_to_song(meta.derived_toml) == DEMO_SONG
