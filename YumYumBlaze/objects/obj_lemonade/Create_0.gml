event_inherited();

lemon_goal = 5;
lemons_cut = 0;
lemon = new Lemon(300, 800);
board = { x1: 760, y1: 520, x2: 1160, y2: 760 };

phase = LEMON_STAGE.CUT;
meter = undefined;
cut_score = 0;
sugar_score = 0;
shake_score = 0;

start_phase = function(_phase) {
    phase = _phase;
    if (phase == LEMON_STAGE.CUT) {
        begin_stage(25);
    } else if (phase == LEMON_STAGE.SUGAR) {
        begin_stage(15);
        meter = new HoldMeter(0.45, 0.60, 0.5);
    } else if (phase == LEMON_STAGE.SHAKE) {
        begin_stage(15);
        meter = new HoldMeter(0.55, 0.70, 0.35);
    } else if (phase == LEMON_STAGE.DONE) {
        finish_dish();
    }
};

complete_phase = function() {
    if (phase == LEMON_STAGE.CUT) {
        cut_score = min(lemons_cut / lemon_goal, 1) * MAX_DISH_SCORE;
    } else if (phase == LEMON_STAGE.SUGAR) {
        sugar_score = meter.result;
    } else if (phase == LEMON_STAGE.SHAKE) {
        shake_score = meter.result;
    }
    end_stage();
    start_phase(phase + 1);
};

on_stage_timeout = function() {
    // Score whatever the player had when time ran out
    if (meter != undefined && !meter.finished) meter.finish();
    complete_phase();
};

finish_dish = function() {
    state = MG_STATE.DONE;
    var _accuracy = (cut_score + shake_score) * 0.5;
    global.game.add_dish("Lemonade", sugar_score, speed_score(), _accuracy);
    alarm[0] = game_get_speed(gamespeed_fps) * 2;   // 2 sec pause, then Alarm 0 moves on
};

step_cutting = function() {
    var _mx = mouse_x;
    var _my = mouse_y;

    // Drag a lemon onto the board
    if (mouse_check_button_pressed(mb_left) && !lemon.on_board && lemon.contains(_mx, _my)) {
        lemon.dragging = true;
    }

    if (lemon.dragging) {
        lemon.x = _mx;
        lemon.y = _my;
        if (mouse_check_button_released(mb_left)) {
            lemon.dragging = false;
            if (point_in_rectangle(_mx, _my, board.x1, board.y1, board.x2, board.y2)) {
                lemon.on_board = true;
                lemon.x = (board.x1 + board.x2) * 0.5;
                lemon.y = (board.y1 + board.y2) * 0.5;
            } else {
                lemon.x = lemon.home_x;
                lemon.y = lemon.home_y;
            }
        }
    }

    // Right-click the lemon on the board to cut it
    if (mouse_check_button_pressed(mb_right) && lemon.on_board && lemon.contains(_mx, _my)) {
        lemon.cuts++;
        if (lemon.cuts >= lemon.cuts_needed) {
            lemons_cut++;
            lemon = new Lemon(300, 800);
            if (lemons_cut >= lemon_goal) complete_phase();
        }
    }
};

start_phase(LEMON_STAGE.CUT);