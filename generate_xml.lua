local font_desc = "MinerWars.fnt"
local xml_name = "MinerWars"


local function toutf8(code)
    local n, b = 1, 0
    local s = ""

    if     code < 128 then
        if     code == 0x22 then return "&quot;"
        elseif code == 0x26 then return "&amp;"
        elseif code == 0x3c then return "&lt;"
        elseif code == 0x3e then return "&gt;"
        else                     return string.char(code)
        end
    elseif code < 2048 then
        n, b = 2, 192
    elseif code < 65536 then
        n, b = 3, 224
    elseif code < 2097152 then
        n, b = 4, 240
    elseif code < 67108864 then
        n, b = 5, 248
    else
        n, b = 6, 252
    end
    for i = 2, n do
        local c = math.mod(code, 64)
        code = math.floor(code / 64)
        s = string.char(c + 128) .. s
    end

    s = string.char(code + b) .. s
    return s
end



local config = {}

local r = assert(io.open(font_desc))
local t = {}
for i = 1, 4 do
    local line = r:read("*l")
    for k, v in string.gmatch(line, "(%w+)=(%w+)") do
        t[k] = tonumber(v)
    end
end
t.char = {}
for i = 1, t.count do
    local g = {}
    local line = r:read("*l")
    for k, v in string.gmatch(line, "(%a+)=([-%d]+)") do
        g[k] = tonumber(v)
    end
    table.insert(t.char, g)
end
r:close()

config.base = t.base
config.height = t.lineHeight
config.size = t.size
config.id = t.pages-1
config.tex_width = t.scaleW
config.tex_height = t.scaleH

config.glyph = {}
for k, v in ipairs(t.char) do
    local g = {}
    g.ch = toutf8(v.id)
    g.code = string.format("%04x", v.id)
    g.bm = v.page
    g.x = v.x
    g.y = v.y
    g.sx = v.width
    g.sy = v.height
    g.aw = v.xadvance
    g.lsb = v.xoffset
    table.insert(config.glyph, g)
end



require("xml_template")

config.color = "blue"
generate_xml(xml_name, config)
config.color = "green"
generate_xml(xml_name, config)
config.color = "red"
generate_xml(xml_name, config)
config.color = "white"
generate_xml(xml_name, config)
