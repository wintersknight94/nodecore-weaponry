-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore, math
    = minetest, nodecore, math
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------
--<>-----<> ================================================ <>-----<>--
-- ================================================================== --

local function register_macuahuitl(id, desc, tips, pwr, dur, mat, craft, snd)

local edge = modname.. "_macuahuitl_tip_" ..tips.. ".png"
local handle = modname.. "_macuahuitl_handle.png"

	minetest.register_tool(modname .. ":aztec_" ..id.. "_" ..tips, {
		description = desc.. " Macuahuitl",
		inventory_image = handle.. "^(" ..mat.. "^[mask:" ..edge.. ")",
		groups = {
			flammable = 2,
			macuahuitl = 1,
		},
		tool_capabilities = nodecore.toolcaps({
			snappy = pwr,
			fleshy = tips,
			uses = dur,
		}),
		tool_wears_to = modname .. ":aztec_" ..id.. "_" ..tips-1,
		sounds = nodecore.sounds(snd)
	})

nodecore.register_craft({
		label = "assemble " ..desc.. " macuahuitl",
		normal = {y = 1},
		indexkeys = {craft},
		nodes = {
			{match = craft, replace = "air"},
			{y = -1, match = "nc_woodwork:ladder", replace = "air"},
		},
		items = {
			{name = modname .. ":aztec_" ..id.. "_1"}
		}
	})

	for t = 1, 5 do
		nodecore.register_craft({
			label = "macuahuitl add " ..desc,
			action = "stackapply",
			wield = {name = craft},
			consumewield = 1,
			indexkeys = {modname.. ":aztec_" ..id.. "_" ..t},
			nodes = {
				{
					match = {
						name = modname.. ":aztec_" ..id.. "_" ..t,
						wear = 0.05
					},
					replace = "air"
				},
			},
			items = {
				{name = modname.. ":aztec_" ..id.. "_" ..t+1}
			}
		})
	end
	
end

-- ================================================================== --
for i = 1, 6 do
--<>-----<> ================================================ <>-----<>--

	register_macuahuitl("stone",		"Stone",		i,	2,	0.1,		"nc_terrain_stone.png",	"nc_stonework:chip",	"nc_tree_woody")
		minetest.register_alias(modname.. ":aztec_stone_0",	"")
	
	if minetest.get_modpath("wc_vulcan") then
		register_macuahuitl("obsidian", "Obsidian", i, 4, 0.01, "nc_optics_glass_frost.png^[colorize:BLACK:200", "wc_vulcan:shard", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_obsidian_0",	"")
	end
	
	if minetest.get_modpath("wc_naturae") then
		register_macuahuitl("shell", "Shell", i, 1, 0.2, "wc_naturae_shellstone.png", "wc_naturae:shell", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_shell_0",	"")
		register_macuahuitl("glass", "Glass", i, 2, 0.05, "nc_optics_glass_frost.png^[colorize:aliceblue:100", "wc_naturae:shard", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_glass_0",	"")
	end
	
	if minetest.get_modpath("wc_pottery") then
		register_macuahuitl("ceramic", "Ceramic", i, 3, 0.05, "wc_pottery_ceramic.png", "wc_pottery:chip", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_ceramic_0",	"")
	end
	
	if minetest.get_modpath("wc_fossil") then
		register_macuahuitl("amber", "Amber", i, 3, 0.05, "nc_optics_glass_frost.png^[colorize:GOLD:140", "wc_fossil:amber", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_amber_0",	"")
	end

	if minetest.get_modpath("wc_adamant") then
		register_macuahuitl("adamant", "Adamantine", i, 6, 0.5, "nc_terrain_stone.png^[colorize:CYAN:140", "wc_adamant:ore", "nc_optics_glassy")
			minetest.register_alias(modname.. ":aztec_adamant_0",	"")
	end
	
--<>-----<> ================================================ <>-----<>--
end
-- ================================================================== --



