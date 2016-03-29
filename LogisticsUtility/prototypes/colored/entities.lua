require("prototypes.config")


belt_entities = {}

--Basic transport belt colored
for color,rgb in pairs(COLOR_TABLE) do
	belt = util.table.deepcopy(data.raw["transport-belt"]["basic-transport-belt"])
	belt.name = "basic-transport-belt-"..color
	belt.icon = "__LogisticsUtility__/graphics/icons/basic-transport-belt-"..color..".png"

	belt.belt_horizontal =
	{
	 layers =
	 {
	  {
	   filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
	   priority = "extra-high",
	   width = 40,
	   height = 40,
	   frame_count = 16
	  },
	  {
	    filename = "__LogisticsUtility__/graphics/entity/basic-transport-belt-tint.png",
	    width = 40,
	    height = 40,
	    frame_count = 16,
	    tint = rgb,
	  }
	 }
	}

  belt.belt_vertical =
	{
	 layers =
	 {
	  {
       filename = "__base__/graphics/entity/basic-transport-belt/basic-transport-belt.png",
       priority = "extra-high",
       width = 40,
       height = 40,
       frame_count = 16,
       y = 40
		 },
		 {
			 filename = "__LogisticsUtility__/graphics/entity/basic-transport-belt-tint.png",
			 width = 40,
			 height = 40,
			 frame_count = 16,
			 y = 40,
			 tint = rgb,
		 }
     }
	}

  belt.ending_side =  basic_belt_ending_side
	table.insert(belt_entities,belt)
end

--Fast transport belt colored
for color,rgb in pairs(COLOR_TABLE) do
	belt = util.table.deepcopy(data.raw["transport-belt"]["fast-transport-belt"])
	belt.name = "fast-transport-belt-"..color
	belt.icon = "__LogisticsUtility__/graphics/icons/fast-transport-belt-"..color..".png"

	belt.belt_horizontal =
	{
	 layers =
	 {
	  {
	   filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
	   priority = "extra-high",
	   width = 40,
	   height = 40,
	   frame_count = 32
	  },
	  {
	    filename = "__LogisticsUtility__/graphics/entity/fast-transport-belt-tint.png",
	    width = 40,
	    height = 40,
	    frame_count = 32,
	    tint = rgb,
	  }
	 }
	}

  belt.belt_vertical =
	{
	 layers =
	 {
	  {
       filename = "__base__/graphics/entity/fast-transport-belt/fast-transport-belt.png",
       priority = "extra-high",
       width = 40,
       height = 40,
       frame_count = 32,
       y = 40
      },
  	 {
	   filename = "__LogisticsUtility__/graphics/entity/fast-transport-belt-tint.png",
	   width = 40,
	   height = 40,
	   frame_count = 32,
	   y = 40,
	   tint = rgb,
	  }
     }
	}

  belt.ending_side = fast_belt_ending_side
	table.insert(belt_entities,belt)
end

--Express transport belt colored
for color,rgb in pairs(COLOR_TABLE) do
	belt = util.table.deepcopy(data.raw["transport-belt"]["express-transport-belt"])
	belt.name = "express-transport-belt-"..color
	belt.icon = "__LogisticsUtility__/graphics/icons/express-transport-belt-"..color..".png"

	belt.belt_horizontal =
	{
	 layers =
	 {
	  {
	   filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
	   priority = "extra-high",
	   width = 40,
	   height = 40,
	   frame_count = 32
	  },
	  {
	    filename = "__LogisticsUtility__/graphics/entity/fast-transport-belt-tint.png",
	    width = 40,
	    height = 40,
	    frame_count = 32,
	    tint = rgb,
	  }
	 }
	}

  belt.belt_vertical =
	{
	 layers =
	 {
	  {
       filename = "__base__/graphics/entity/express-transport-belt/express-transport-belt.png",
       priority = "extra-high",
       width = 40,
       height = 40,
       frame_count = 32,
       y = 40
      },
	  	 {
		   filename = "__LogisticsUtility__/graphics/entity/fast-transport-belt-tint.png",
		   width = 40,
		   height = 40,
		   frame_count = 32,
		   y = 40,
		   tint = rgb,
		  }
     }
	}
	table.insert(belt_entities,belt)
end

data:extend(belt_entities)
