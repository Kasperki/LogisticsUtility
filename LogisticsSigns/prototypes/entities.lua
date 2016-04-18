require("config")

sign_entities = {}

sign_entity = {
    type = "decorative",
    name = "util-sign",
    icon = "__LogisticsSigns__/graphics/icons/sign-icon.png",
    flags = {"placeable-neutral"},
    render_layer = "lower-object",
    minable =
    {
        mining_time = 1.5,
        result = "util-sign",
        count = 1
    },
    max_health = 40,
    collision_mask = { "item-layer", "object-layer", "player-layer", "water-tile"},
    collision_box = {{-0.9, -1.0}, {0.9, 0.5}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.5}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
    pictures =
    {
      filename = "__LogisticsSigns__/graphics/entity/sign.png",
      priority = "extra-high",
      width = 80,
      height = 60
    }
}
table.insert(sign_entities, sign_entity)

sign_large_metal_entity = {
    type = "decorative",
    name = "util-sign-large",
    icon = "__LogisticsSigns__/graphics/icons/sign-large-metal-icon.png",
    flags = {"placeable-neutral"},
    render_layer = "lower-object",
    minable =
    {
        mining_time = 2.5,
        result = "util-sign-large",
        count = 1
    },
    max_health = 60,
    collision_mask = { "item-layer", "object-layer", "player-layer", "water-tile"},
    collision_box = {{-2.1, -1.0}, {2.1, 0.5}},
    selection_box = {{-2.2, -1.0}, {2.2, 0.5}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 1.0 },
    pictures =
    {
      filename = "__LogisticsSigns__/graphics/entity/sign-large-metal.png",
      priority = "extra-high",
      width = 160,
      height = 60
    }
}

table.insert(sign_entities, sign_large_metal_entity)

sign_small_entity = {
   type = "decorative",
   name = "util-sign-small",
   icon = "__LogisticsSigns__/graphics/icons/sign-small-icon.png",
   flags = {"placeable-neutral"},
   render_layer = "lower-object",
   minable = {
      mining_time = 1,
      result = "util-sign-small",
      count = 1
   },
   max_health = 40,
   collision_mask = { "item-layer", "object-layer", "player-layer", "water-tile"},
   collision_box = {{-1.2, -1.0}, {0.2, 0.4}},
   selection_box = {{-1.3, -1.1}, {0.3, 0.4}},
   vehicle_impact_sound = { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
   pictures =
   {
  	 filename = "__LogisticsSigns__/graphics/entity/sign-small.png",
  	 priority = "extra-high",
  	 width = 40,
  	 height = 60,
  	 shift = {-0.5, 0.0}
   }
}
table.insert(sign_entities, sign_small_entity)

----- ASCII FONTS
for i = FIRSTASCII, LASTASCII do

	letter = {
		type = "decorative",
		name = "ascii" .. i,
		flags = {"placeable-off-grid", "not-on-map"},
		selectable_in_game = false,
		render_layer = "object",
		pictures =
		{
			filename = "__LogisticsSigns__/graphics/entity/fonts.png",
			priority = "medium",
			x = (i - FIRSTASCII) * FONT_WIDTH % FONTSHEET_WIDTH,
			y = math.floor((i - FIRSTASCII) * FONT_WIDTH / FONTSHEET_WIDTH) * FONT_HEIGHT,
			scale = FONT_SCALE,
			width = FONT_WIDTH,
			height = FONT_HEIGHT
		}
	}

	table.insert(sign_entities, letter)
end

--- ICONS
for i, icon in pairs(ICONS) do
  for _, fluid in pairs(data.raw[icon]) do

    notice_icon = {
        type = "decorative",
        name = "icon-notice-" .. fluid.name,
        flags = {"placeable-off-grid", "not-on-map"},
        selectable_in_game = false,
        render_layer = "object",
        pictures =
        {
          filename = fluid.icon,
          priority = "medium",
          width = 32,
          height = 32
        }
    }

    table.insert(sign_entities, notice_icon)
  end
end

data:extend(sign_entities)
