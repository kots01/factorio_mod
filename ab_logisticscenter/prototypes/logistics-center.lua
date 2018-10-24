local OLC = "__ab_logisticscenter__"

require("config")

local entity_names = get_entity_names()
local config = get_config()

local transfer_rate = 10
local buffer_size = transfer_rate*16667

local function blank()
	return {
		filename = OLC .. "/graphics/nothing.png",
		priority = "high",
		width = 1,
		height = 1,
	}
end

local function ablank()
	return {
		filename = OLC .. "/graphics/nothing.png",
		priority = "high",
		width = 1,
		height = 1,
		frame_count = 1,
	}
end

local half_length = 1.5
local collision_len = 1.4

data:extend({
    {
        type = "constant-combinator",
        name = entity_names.logistics_center,
        icon = OLC .. "/graphics/icons/logistics-center.png",
        icon_size = 32,
        flags = {"placeable-neutral", "placeable-player", "player-creation"},
        minable = {hardness = 1, mining_time = 10, result = entity_names.logistics_center},
        collision_box = {{-collision_len, -collision_len}, {collision_len, collision_len}},
        selection_box = {{-half_length, -half_length}, {half_length, half_length}},
        max_health = 250,
        corpse = "big-remnants",
        dying_explosion = "medium-explosion",
        item_slot_count = config.lc_item_slot_count,
        sprites = {
			north = {
                filename = OLC .. "/graphics/entity/logistics-center.png",
				width = 113,
				height = 91,
				frame_count = 1,
				shift = {0.2, 0.15}
			},
			east = {
                filename = OLC .. "/graphics/entity/logistics-center.png",
				width = 113,
				height = 91,
				frame_count = 1,
				shift = {0.2, 0.15}
			},
			south = {
                filename = OLC .. "/graphics/entity/logistics-center.png",
				width = 113,
				height = 91,
				frame_count = 1,
				shift = {0.2, 0.15}
			},
			west = {
                filename = OLC .. "/graphics/entity/logistics-center.png",
				width = 113,
				height = 91,
				frame_count = 1,
				shift = {0.2, 0.15}
			}
		},

		activity_led_sprites = {
			north = {
				filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-N.png",
				width = 8,
				height = 6,
				frame_count = 1,
				shift = util.by_pixel(9, -12)
			},
			east = {
				filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-E.png",
				width = 8,
				height = 8,
				frame_count = 1,
				shift = util.by_pixel(8, 0)
			},
			south = {
				filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-S.png",
				width = 8,
				height = 8,
				frame_count = 1,
				shift = util.by_pixel(-9, 2)
			},
			west = {
				filename = "__base__/graphics/entity/combinator/activity-leds/constant-combinator-LED-W.png",
				width = 8,
				height = 8,
				frame_count = 1,
				shift = util.by_pixel(-7, -15)
			}
		},

		activity_led_light = {
			intensity = 0,
			size = 1,
		},

		activity_led_light_offsets = {
			{0.296875, -0.40625},
			{0.25, -0.03125},
			{-0.296875, -0.078125},
			{-0.21875, -0.46875}
		},

		circuit_wire_connection_points = {
			{
				shadow = {
					red = {0.15625, -0.28125},
					green = {0.65625, -0.25}
				},
				wire = {
					red = {-0.28125, -0.5625},
					green = {0.21875, -0.5625},
				}
			},
			{
				shadow = {
					red = {0.75, -0.15625},
					green = {0.75, 0.25},
				},
				wire = {
					red = {0.46875, -0.5},
					green = {0.46875, -0.09375},
				}
			},
			{
				shadow = {
					red = {0.75, 0.5625},
					green = {0.21875, 0.5625}
				},
				wire = {
					red = {0.28125, 0.15625},
					green = {-0.21875, 0.15625}
				}
			},
			{
				shadow = {
					red = {-0.03125, 0.28125},
					green = {-0.03125, -0.125},
				},
				wire = {
					red = {-0.46875, 0},
					green = {-0.46875, -0.40625},
				}
			}
		},
        circuit_wire_max_distance = 10,
        map_color = {r = 0, g = 1, b = 0},
        vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 }
    }
})

data:extend({
    {
        type = "recipe",
        name = entity_names.logistics_center,
        enabled = true,
        energy_required = 1,
        ingredients = {},
        result = entity_names.logistics_center
    }
})

data:extend({
    {
        type = "item",
        name = entity_names.logistics_center,
        stack_size = 1,
        icon = OLC .. "/graphics/icons/logistics-center.png",
        icon_size = 32,
        flags = {"goes-to-quickbar"},
        subgroup = "logistics",
        order = "g[l]",
        place_result = entity_names.logistics_center,
    }
})

data:extend(
    {
      {
        type = "recipe-category",
        name = "logistics"
      },
      {
        type = "item-subgroup",
        name = "logistics",
        group = "logistics",
        order = "e-f"
      }
    }
)
    