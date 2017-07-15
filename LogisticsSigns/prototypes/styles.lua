local icons = {}
for i, icon in pairs(ICONS) do
	for _, object in pairs(data.raw[icon]) do
		local filename = object.icon
		if not filename and object.icons then
			for _, v in pairs(object.icons) do
				filename = v.icon
				break
			end
		end
		
		if filename then
			table.insert(icons, object.name)
			data.raw["gui-style"].default["icon-notice-" .. object.name] =
			{
				type = "button_style",
				parent = "button_style",
				width = 32,
				height = 32,
				top_padding = 1,
				right_padding = 1,
				bottom_padding = 1,
				left_padding = 1,
				font = "default-button",
				default_font_color = {r=0.92, g=0.92, b=0.92},
				default_graphical_set =
				{
					type = "monolith",
					monolith_image =
					{
						filename = filename,
						priority = "extra-high-no-scale",
						width = 32,
						height = 32,
						x = 0
					}
				},
				hovered_graphical_set =
				{
					type = "monolith",
					monolith_image =
					{
						filename = filename,
						priority = "extra-high-no-scale",
						width = 32,
						height = 32,
						x = 0
					}
				},
				clicked_graphical_set =
				{
					type = "monolith",
					monolith_image =
					{
						filename = filename,
						width = 32,
						height = 32,
						x = 0
					}
				}
			}
		end
	end
end

data:extend({{
	type = "item",
	name = "SIGNPOST_ICONS",
	icon = "__LogisticsSigns__/graphics/icons/sign-icon.png",
	stack_size = 1,
	flags = {"hidden"},
	order = "zzz",
	localised_description = {serpent.dump(icons)}
}})
