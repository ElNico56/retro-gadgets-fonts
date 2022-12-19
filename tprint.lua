local function Tprint (chip:VideoChip, pos:vec2, font:SpriteSheet, txt:string, width, height:number, scale:number)
    scale = scale or 1
    local line:number = 0
    local cur:number = 0
    for i=1,#txt do
        if txt:sub(i,i) == "\n" then line += 1 cur = -1 end
        local charID:number = txt:sub(i,i):byte()
        local x:number = charID%32
        local y:number = math.floor(charID/32)
        local w:number
        if type(width) == "number" then
            w = width
        elseif type(width) == "table" then
            w = width[charID] or width._
        else error("Width must be a number or table") end
        local basepos = pos + vec2(cur,0) + vec2(0,height*line)
        chip:RasterSprite(basepos, basepos + (vec2(w,0)*vec2(scale,1)), basepos + (vec2(w,height)*vec2(scale,scale)), basepos + (vec2(0,height)*vec2(1,scale)), font, x, y, color.white, color.clear)
        cur += w*scale
    end
end
return Tprint
