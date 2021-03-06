sign_items = {}

sign_item =  {
    type = "item",
    name = "util-sign",
    icon = "__LogisticsSigns__/graphics/icons/sign-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "util-signs",
    order = "a[energy]-a[sign]",
    place_result = "util-sign",
    stack_size = 50
}
table.insert(sign_items, sign_item)

sign_large_item =  {
    type = "item",
    name = "util-sign-large",
    icon = "__LogisticsSigns__/graphics/icons/sign-large-metal-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "util-signs",
    order = "a[energy]-a[sign]",
    place_result = "util-sign-large",
    stack_size = 50
}
table.insert(sign_items, sign_large_item)

sign_small_item =  {
    type = "item",
    name = "util-sign-small",
    icon = "__LogisticsSigns__/graphics/icons/sign-small-icon.png",
    flags = {"goes-to-quickbar"},
    subgroup = "util-signs",
    order = "a[energy]-a[sign]",
    place_result = "util-sign-small",
    stack_size = 50
}
table.insert(sign_items, sign_small_item)

data:extend(sign_items)
