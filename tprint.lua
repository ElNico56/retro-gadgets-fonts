local function Tprint (chip:VideoChip, pos:vec2, font:SpriteSheet, txt:string, width, height:number)
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
        chip:DrawSprite(pos + vec2(cur,0) + vec2(0,height*line), font, x, y, color.white, color.clear)
        cur += w
    end
end
return Tprint