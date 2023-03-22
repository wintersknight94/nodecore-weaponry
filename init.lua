 -- LUALOCALS < ---------------------------------------------------------
local include, minetest, nodecore
    = include, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
--<>-----<> ================================================ <>-----<>--

if minetest.settings:get_bool(modname.. ".blades", true) then
	include("blades")
end

if minetest.settings:get_bool(modname.. ".spears", false) then
	include("spears")
end

if minetest.settings:get_bool(modname.. ".azteca", true) then
	include("macuahuitl")
end

--<>-----<> ================================================ <>-----<>--

--include("shuriken")

--include("chakram")

--<>-----<> ================================================ <>-----<>--

--include("cannon")

--include("")
