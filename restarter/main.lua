local logging = require("logging")
local logger = logging.getLogger("restarter")

local function on_enable()
end

local function on_disable()
end

local function menu()
end

local function on_game_load(args)
end

local function on_game_quit()
end

local function on_key_pressed(key)
    if key == "r" and G.STATE == G.STATES.GAME_OVER then
        if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
            G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
        end
        G:save_settings()
        G.SETTINGS.current_setup = 'New Run'
        G.GAME.viewed_back = nil
        G.run_setup_seed = G.GAME.seeded
        G.challenge_tab = G.GAME and G.GAME.challenge and G.GAME.challenge_tab or nil
        G.forced_seed, G.setup_seed = nil, nil
        if G.GAME.seeded then G.forced_seed = G.GAME.pseudorandom.seed end
        G.forced_stake = G.GAME.stake
        if G.STAGE == G.STAGES.RUN then G.FUNCS.start_setup_run() end
        G.forced_stake = nil
        G.challenge_tab = nil
        G.forced_seed = nil
        return true
    end
    return false
end

local function on_key_released(key)
end

local function on_mouse_pressed(button, x, y, touch)
end

local function on_mouse_released(button, x, y)
end

local function on_mousewheel(x, y)
end

local function on_pre_render()
end

local function on_post_render()
end

local function on_error(message)
end

local function on_pre_update(dt)
end

local function on_post_update(dt)
end

return {
    on_enable = on_enable,
    on_disable = on_disable,
    menu = menu,
    on_game_load = on_game_load,
    on_game_quit = on_game_quit,
    on_key_pressed = on_key_pressed,
    on_key_released = on_key_released,
    on_mouse_pressed = on_mouse_pressed,
    on_mouse_released = on_mouse_released,
    on_mousewheel = on_mousewheel,
    on_pre_render = on_pre_render,
    on_post_render = on_post_render,
    on_error = on_error,
    on_pre_update = on_pre_update,
    on_post_update = on_post_update,
}