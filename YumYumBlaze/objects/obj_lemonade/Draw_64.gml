event_inherited();   // timer

var _msg = "";
if (phase == LEMON_STAGE.CUT) {
    _msg = "Drag a lemon to the board, then right-click to cut it!   Cut: "
         + string(lemons_cut) + "/" + string(lemon_goal);
} else if (phase == LEMON_STAGE.SUGAR) {
    _msg = "Hold left click to pour sugar. Release in the green zone!";
} else if (phase == LEMON_STAGE.SHAKE) {
    _msg = "Hold left click to shake. Release in the green zone!";
} else if (phase == LEMON_STAGE.DONE) {
    _msg = "Lemonade complete!";
}

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(GAME_W * 0.5, 60, _msg);
draw_set_halign(fa_left);
draw_set_color(c_white);