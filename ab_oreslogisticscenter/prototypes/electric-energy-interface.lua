local OLC = "__ab_oreslogisticscenter__"

require("config")

local entity_names = get_entity_names()
local config = get_config()

local half_length = 7
local collision_len = 5

data:extend({
    {
        type = "electric-energy-interface",
        name = entity_names.electric_energy_interface,
        icon = OLC .. "/graphics/icons/logistics-center.png",
        icon_size = 32,
        flags = {"not-on-map"},
        minable = nil,
        max_health = 1,
        selectable_in_game = false,
        energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            input_flow_limit = config.electric_energy_interface_input_flow_limit .."W",
            buffer_capacity = config.electric_energy_interface_buffer_capacity .. "J",
        },
        energy_usage = "1MW",
        energy_production = "0MW",        
        collision_box = {{-collision_len, -collision_len}, {collision_len, collision_len}},
        selection_box = {{-half_length, -half_length}, {half_length, half_length}},
        collision_mask = {},
    }
})