data:extend({
    {
  	 -- create new inventory tab and set icon
  	 type = "item-group",
  	 name = "util-mod",
  	 order = "z",
  	 inventory_order = "z",
  	 icon = "__LogisticsSigns__/graphics/utilities-subgroup.png",
	 icon_size = 64,
    },
    {
  	 -- row for signs
  	 type = "item-subgroup",
  	 name = "util-signs",
  	 group = "util-mod",
  	 order = "l",
    }
})
