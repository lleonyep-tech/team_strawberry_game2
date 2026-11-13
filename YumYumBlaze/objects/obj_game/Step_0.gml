if (!global.game.cheats_enabled) exit;

if (keyboard_check_pressed(vk_f1)) {
    repeat (2) {
        global.game.add_dish("Cheat Dish", MAX_DISH_SCORE, MAX_DISH_SCORE, MAX_DISH_SCORE);
    }
    global.game.goto_results();
}

if (keyboard_check_pressed(vk_f2)) {
    with (par_minigame) stage_time_left += 15;
}