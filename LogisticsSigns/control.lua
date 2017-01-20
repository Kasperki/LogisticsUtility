require "util"
require "string"
require "config"

global.icons = nil

-- Init the sign table
function init()
  --Tracks the entities assigned to signs. So we can destroy them on mined event.
    global.signs = global.signs or {}
  --Tracks last build sign. So we can add other entities to same position.
    global.last_built=global.last_built or {}

    if global.icons == nil then
      global.icons = loadstring(game.entity_prototypes["SIGNPOST_ICONS"].order)()
    end
end
script.on_init(function() init() end)

-- When built sign create text string fot it
script.on_event(defines.events.on_built_entity, function(event)
  if event.created_entity.name == "util-sign" or event.created_entity.name == "util-sign-large" then
      global.last_built[event.player_index] = event.created_entity;
      create_gui(event.player_index);
  elseif event.created_entity.name == "util-sign-small" then
      global.last_built[event.player_index] = event.created_entity;
      create_guiIcons(event.player_index);
  end
end)

-- Destroy text string when the sign is destroyed
function on_destroyed(event)
	if event.entity.name == "util-sign" or event.entity.name == "util-sign-large" or  event.entity.name == "util-sign-small" then
        for i = 1, #global.signs do
            if event.entity == global.signs[i].sign then

              for j = 1, #global.signs[i].objects do
                if global.signs[i].objects[j].valid then global.signs[i].objects[j].destroy(); end
              end

              table.remove(global.signs, i);
              break;
            end
        end

        if gui ~= nil then
          gui.destroy();
          gui = nil;
        end
    end
end

script.on_event(defines.events.on_preplayer_mined_item, on_destroyed)
script.on_event(defines.events.on_robot_pre_mined, on_destroyed)
script.on_event(defines.events.on_entity_died, on_destroyed)

-- CREATE SIGNPOST GUI FOR WRITING TEXT
function create_gui(player_index)
    if game.players[player_index].gui.center.SignPosts then
        game.players[player_index].gui.center.SignPosts.destroy()
    end

    gui = game.players[player_index].gui.center.add{type="frame", name="SignPosts", caption={"sign-gui-title-text"}, direction="vertical"}
    gui.add{type='textfield',name='message'}
    gui.add{type="button", name="write", caption={"sign-gui-button-write"}}
end

-- CREATE GUI FOR SELECTING ICONS
function create_guiIcons(player_index)
    if game.players[player_index].gui.center.SignPosts then
        game.players[player_index].gui.center.SignPosts.destroy()
    end

    gui = game.players[player_index].gui.center.add{type="frame", name="SignPosts", caption={"sign-gui-title-icon"}, direction="horizontal"};
    guiTable = gui.add{type="table", name="icon-table", colspan = math.ceil(#global.icons / 10)};

    for _, icon in pairs(global.icons) do
      guiTable.add{type="button", name = "icon-notice-"..icon, style="icon-notice-"..icon};
    end
end

-- ON SIGNPOST GUI CLICK
script.on_event(defines.events.on_gui_click,
    function(event)
      if event.element.parent then
          if event.element.parent.name == 'SignPosts' then
            if event.element.name=="write" then --OnClicked Write create ascii text entities
                create_sign_text(event.element.parent.message.text, global.last_built[event.player_index].position, global.last_built[event.player_index]);
                event.element.parent.destroy();
                gui = nil;
                return;
            end
          end
          if event.element.parent.name == 'icon-table' then
            for _, icon in pairs(global.icons) do
              if event.element.name == "icon-notice-"..icon then
                create_sign_icon("icon-notice-"..icon, global.last_built[event.player_index].position, global.last_built[event.player_index])
                event.element.parent.parent.destroy();
                gui = nil;
                break;
              end
            end
        end
      end
  end)

--TODO MAKE TEXT TO BE CENTER?
--TODO CHECKBOX TO SHOW TEXT ON MAP?
--TODO Kerning fix matrix for each letter (spacing) so that the text looks more normal.
--Function that creates text string
 --str: string for text
 --pos: world position for the text
 --parent: the entity that owns this text
function create_sign_text(str, pos, parent)

  strings = {};

  startingHeight =  SIGN_PROPERTIES[parent.name].startingHeight;
  startingWidth = SIGN_PROPERTIES[parent.name].startingWidth;
  lettersPerLine = SIGN_PROPERTIES[parent.name].lettersPerLine;
  maxLength = SIGN_PROPERTIES[parent.name].maxLength;

  for i = 0, string.len(str) do
    if (i > maxLength) then break; end
    char = string.sub(str,i,i);

    if (string.byte(char) ~= nil and string.byte(char) >= FIRSTASCII and string.byte(char) <= LASTASCII) then
          index = i - 1;
          offsetY = math.floor(index / lettersPerLine) * SPACING_VERTICAL - startingHeight;
          offsetX = index % lettersPerLine * SPACING_HORIZONTAL - startingWidth;
		  
		  local letter_entity = parent.surface.create_entity{name = "ascii" .. string.byte(char), position = {pos.x + offsetX, pos.y + offsetY}};
		  letter_entity.destructible = false;
          table.insert(strings, letter_entity);
    end
      table.insert(global.signs, {sign = parent, objects = strings});
  end
end

--Creates icon for small sign
 --icon: icon entity name
 --pos: world position for the icon
 --parent: the entity that owns this icon
function create_sign_icon(icon, pos, parent)
   offsetX = 0;
   offsetY = 0.8;
   
   icon_entity = parent.surface.create_entity{ name = icon, position = {pos.x - offsetX, pos.y - offsetY} };
   icon_entity.destructible = false;
   table.insert(global.signs, {sign = parent, objects = {icon_entity}});
end
