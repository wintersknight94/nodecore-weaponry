-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------
local handle = "nc_lode_tool_handle.png"
local blade = modname.. "_blade.png"
local knife = modname.. "_knife.png"
--<>-----<> ================================================ <>-----<>--
-- ================================================================== --
 local function register_blade(temper, desc, str, dur, mat)
 --<>----------------------------------------------------------------<>--
 	minetest.register_craftitem(modname .. ":blade_" ..temper, {
		description = desc.. " Blade",
		inventory_image = mat.. "^[mask:" ..blade,
		groups = {blade = 1, lodey = 1},
		stack_max = 1,
		sounds = nodecore.sounds("nc_optics_glassy")
	})
--<>----------------------------------------------------------------<>--
	minetest.register_tool(modname .. ":knife_" ..temper, {
		description = desc.. " Knife",
		inventory_image = handle.. "^(" ..mat.. "^[mask:" ..knife.. ")",
		groups = {
			flammable = 2,
			knife = 1,
			lodey = 1
		},
		tool_capabilities = nodecore.toolcaps({
			snappy = str,
			fleshy = str,
			uses = dur,
		}),
		tool_wears_to = "nc_lode:prill_" ..temper,
		sounds = nodecore.sounds("nc_lode_" ..temper)
	})
--<>-----<> ================================================ <>-----<>--
nodecore.register_craft({
	label = "assemble " ..temper.. " knife",
	normal = {y = 1},
	indexkeys = {modname .. ":blade_" ..temper},
	nodes = {
		{match = modname .. ":blade_" ..temper, replace = "air"},
		{y = -1, match = "nc_tree:stick", replace = "air"}
	},
	items = {
			{name = modname .. ":knife_" ..temper}
		}
})
--<>----------------------------------------------------------------<>--
end
-- ================================================================== --
--<>-----<> ================================================ <>-----<>--
	register_blade("annealed",	"Annealed Lode",	3,	1,		"nc_lode_annealed.png")
	register_blade("tempered",	"Tempered Lode",	4,	1.25,	"nc_lode_tempered.png")
--<>-----<> ================================================ <>-----<>--
-- ================================================================== --

