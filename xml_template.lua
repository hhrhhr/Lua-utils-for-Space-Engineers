local color = {"blue", "green", "red", "white"}

local xml = {}

xml[1] = [[
<?xml version="1.0" encoding="UTF-8" ?>
<font
    xmlns="http://xna.microsoft.com/bitmapfont"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://xna.microsoft.com/bitmapfont bitmapfont.xsd"
    name="MinerWars-%s" base="%d" height="%d"
    face="MinerWars-%s" size="%d"
    >
<bitmaps>
]]

xml[2] = [[
<bitmap id="%d" name="MinerWars_%d-%s.png" size="%dx%d" />
]]

xml[3] = [[
</bitmaps>
<glyphs>
]]

xml[4] = [[
<glyph ch="%s" code="%s" bm="%d" origin="%d,%d" size="%dx%d" aw="%d" lsb="%d" />
]]

xml[5] = [[
</glyphs>
</font>
]]


local content = {}

content[1] = function(color, base, height, size)
    return string.format(xml[1], color, base, height, color, size)
end

content[2] = function(id, color, width, height)
    return string.format(xml[2], id, id, color, width, height)
end

content[3] = function()
    return xml[3]
end

content[4] = function(ch, code, page, x, y, width, height, xadvance, xoffset)
    return string.format(xml[4], ch, code, page, x, y, width, height, xadvance, xoffset)
end

content[5] = function()
    return xml[5]
end


function generate_xml(filename, config)
    local fn = filename .. "-" .. config.color .. ".xml"
    local w = assert(io.open(fn, "w+"))
    w:write(content[1](config.color, config.base, config.height, config.size))
    for k, v in ipairs(config.bitmap) do
        w:write(content[2](v, config.color, config.tex_width, config.tex_height))
    end
    w:write(content[3]())
    for k, v in ipairs(config.glyph) do
        w:write(content[4](v.ch, v.code, v.bm, v.x, v.y, v.sx, v.sy, v.aw, v.lsb))
    end
    w:write(content[5]())
    w:close()
end
