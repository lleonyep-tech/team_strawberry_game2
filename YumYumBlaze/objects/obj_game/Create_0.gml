// Persistent + rm_title can be revisited, so only one controller may exist
if (instance_number(obj_game) > 1) {
    instance_destroy();
    exit;
}
persistent = true;
global.game = new GameState();
display_set_gui_size(GAME_W, GAME_H);