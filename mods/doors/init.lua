local propagate = function(pos, direction, done)
   local done = done or {}
   local node = minetest.get_node(pos)
   local pos_str = minetest.pos_to_string(pos)
   local neighbors = find_neighbors(pos)
   minetest.swap_node(pos, {name="doors:door_" .. direction})
   done[pos_str] = true
   for _,pos in pairs(neighbors) do
      local next_node = minetest.get_node(pos)
      if(not done[pos_str] and node.name == next_node.name) then
         propagate(pos, direction, done)
      end
   end
end

local nop = function() end

doors = {
   on_open = function(pos, _) propagate(pos, "open") end,
   on_shut = function(pos, packet) propagate(pos, "shut") end,
}

minetest.register_node("doors:door_shut", {
                          tiles = {"door.png"},
                          paramtype = "light",
                          paramtype2 = "facedir",
                          drawtype = "nodebox",
                          node_box = {},
                          diginet = {
                             on_open = doors.on_open,
                             on_shut = nop,
                             on_toggle = doors.on_open,
                          }
})

minetest.register_node("doors:door_open", {
                          tiles = {"door.png"},
                          paramtype = "light",
                          paramtype2 = "facedir",
                          drawtype = "nodebox",
                          node_box = {type = "fixed",
                                      fixed = { { -0.50, - 0.50, -0.50,
                                                     -0.40, 0.50, 0.50}},
                                      },
                          diginet = {
                             on_open = nop,
                             on_shut = doors.on_shut,
                             on_toggle = doors.on_shut,
                          }
})
