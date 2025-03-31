-- #title: map_methods
-- #author: trevor roddy | communication by any means
--
-- list of all callable functions at the bottom
-- provides methods for creating and reading from a tile map
require("love")

local function grid_from_noise(w,h,cutoff) -- returns table[h][w] of binary from noise 
    local grid = {}
    local baseX = 10000 * love.math.random()
    local baseY = 10000 * love.math.random()
    for y = 1, h do
        grid[y] = {}
        for x = 1, w do
            grid[y][x] = math.floor(cutoff +
                love.math.noise(baseX+.1*x, baseY+.2*y)) --use noise to create 0s and 1s
        end
    end
    return grid
end
local function pixels_to_tiles (coords,size) -- {x,y}, tilesize -> {x,y} (tilemap coordinates)
    local tx, ty = math.floor(coords.x/size)+1, math.floor(coords.y/size)+1
    return {x=tx, y=ty}
end
local function is_touching_wall(playerpos,_m)
    local c_tile = pixels_to_tiles(playerpos,_m.tilesize)
    return _m[c_tile.y] and _m[c_tile.y][c_tile.x] == 1
end
local function remove_tile(map, tilepos)
    local x, y = tilepos.x, tilepos.y
    if map[y] and map[y][x]==1 then
        map[y][x]=0
    end
end
-- local function render (map,playerpos) -- tilemap, starting tile x, y, cols to fetch, rows, tile size
--     local _m=map
--     local ptile= pixels_to_tiles(playerpos, _m.tilesize)
--     local x,y,w,h = 0,0,40,40
--     for i=x, x+w+1 do
--             for k=y, y+h+1 do
--                 local iswall = _m[k+(ptile.y-20)] and _m[k+(ptile.y-20)] and _m[k+(ptile.y-20)][i+(ptile.x-20)] == 1
--                 if iswall then
--                     -- PicoCols.blue()
--                     -- PicoCols.dark_blue()
--                     -- love.graphics.rectangle('fill', (i-x-1+(ptile.x-20))*size,
--                         -- (k-y-1+(ptile.y-20))*size, size, size)
--                 end
--             end
--         end
-- end
return{
    grid_from_noise = grid_from_noise,
    pixels_to_tiles = pixels_to_tiles,
    -- render = render,
    is_touching_wall = is_touching_wall,
    remove_tile = remove_tile,
}-- same as making an M table, adding M.functions and returning M.
