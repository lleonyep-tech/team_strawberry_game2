draw_set_color(make_color_rgb(30, 30, 40));
draw_rectangle(0, 0, GAME_W, GAME_H, false);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(GAME_W * 0.5, 420, "YUM YUM BLAZE!");
draw_text(GAME_W * 0.5, 620, "Press X to Begin");
draw_set_halign(fa_left);