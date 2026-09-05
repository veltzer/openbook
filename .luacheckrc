-- config/*.lua define top-level globals that are read by the rsconstruct
-- tera template renderer (load_lua), not by other Lua code — so defining
-- them is intended (allow_defined_top) and "unused global" (131) is noise.
files["config"] = {
    allow_defined_top = true,
    ignore = { "131" },
}
