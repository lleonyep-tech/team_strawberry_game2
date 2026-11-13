draw_set_color(make_color_rgb(235, 220, 170));
draw_rectangle(0, 0, GAME_W, GAME_H, false);

if (phase == LEMON_STAGE.CUT) {
    draw_set_color(make_color_rgb(150, 100, 60));
    draw_rectangle(board.x1, board.y1, board.x2, board.y2, false);
    draw_set_color(merge_color(c_yellow, c_white, lemon.cuts / lemon.cuts_needed));
    draw_circle(lemon.x, lemon.y, lemon.radius, false);
} else if (phase == LEMON_STAGE.SUGAR || phase == LEMON_STAGE.SHAKE) {
    var _shake = 0;
    if (phase == LEMON_STAGE.SHAKE && meter.holding && !meter.finished) {
        _shake = irandom_range(-10, 10);
    }
    draw_set_color(c_white);
    draw_rectangle(860 + _shake, 300, 1060 + _shake, 700, false);
    draw_set_color(c_yellow);
    draw_rectangle(860 + _shake, 700 - meter.value * 400, 1060 + _shake, 700, false);
    meter.draw(660, 860, 600, 50);
}
draw_set_color(c_white);