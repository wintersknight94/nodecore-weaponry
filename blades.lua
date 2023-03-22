-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------
local handle = "nc_lode_tool_handle.png"
local blade = modname.. "_blade.png"
--<>-----<> ================================================ <>-----<>--
-- ================================================================== --
 local function register_blade(temper, desc, str, dur, mat)
	minetest.register_tool(modname .. ":blade_" ..temper, {
		description = desc.. " Blade",
		inventory_image = handle.. "^(" ..mat.. "^[mask:" ..blade.. ")",
		groups = {
			flammable = 2,
			blade = 1,
		},
		tool_capabilities = nodecore.toolcaps({
			snappy = str,
			fleshy = str,
			uses = dur,
		}),
		tool_wears_to = "nc_lode:rod_" ..temper,
		sounds = nodecore.sounds("nc_lode_" ..temper)
	})
end
-- ================================================================== --
--<>-----<> ================================================ <>-----<>--
	register_blade("annealed",	"Annealed Lode",	3,	1,		"nc_lode_annealed.png")
	register_blade("tempered",	"Tempered Lode",	4,	1.25,	"nc_lode_tempered.png")
--<>-----<> ================================================ <>-----<>--
-- ================================================================== --

