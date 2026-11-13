	
	#macro GAME_W 1920
	#macro GAME_H 1080
	#macro WIN_THRESHOLD 30
	#macro MAX_DISH_SCORE 10

	enum MG_STATE { PLAYING, DONE }
	enum LEMON_STAGE { CUT, SUGAR, SHAKE, DONE }

	function GameState() constructor {
	    dishes = [];
	    cheats_enabled = true;
	    flow = [rm_title, rm_lemonade, rm_results];
	    flow_index = 0;

	    add_dish = function(_name, _taste, _speed, _accuracy) {
	        array_push(dishes, {
	            name: _name,
	            taste: round(_taste),
	            speed: round(_speed),
	            accuracy: round(_accuracy)
	        });
	    };

	    category_total = function(_category) {
	        var _sum = 0;
	        for (var i = 0; i < array_length(dishes); i++) {
	            _sum += dishes[i][$ _category];
	        }
	        return _sum;
	    };

	    total = function() {
	        return category_total("taste") + category_total("speed") + category_total("accuracy");
	    };

	    has_won = function() {
	        return total() > WIN_THRESHOLD;
	    };

	    next_room = function() {
	        flow_index = min(flow_index + 1, array_length(flow) - 1);
	        room_goto(flow[flow_index]);
	    };

	    goto_results = function() {
	        flow_index = array_length(flow) - 1;
	        room_goto(flow[flow_index]);
	    };

	    restart = function() {
	        dishes = [];
	        flow_index = 0;
	        room_goto(flow[0]);
	    };
	}

	function HoldMeter(_target_min, _target_max, _fill_per_sec) constructor {
	    target_min = _target_min;
	    target_max = _target_max;
	    fill_rate = _fill_per_sec;
	    value = 0;
	    armed = false;
	    holding = false;
	    finished = false;
	    result = 0;

	    finish = function() {
	        finished = true;
	        var _mid = (target_min + target_max) * 0.5;
	        var _half = (target_max - target_min) * 0.5;
	        var _off = max(0, abs(value - _mid) - _half);
	        result = clamp(MAX_DISH_SCORE * (1 - _off / 0.4), 0, MAX_DISH_SCORE);
	    };

	    update = function() {
	        if (finished) return;
	        var _held = mouse_check_button(mb_left);

	        if (!armed) {
	            if (!_held) armed = true;
	            return;
	        }
	        if (_held) {
	            holding = true;
	            value = min(value + fill_rate * delta_time / 1000000, 1);
	            if (value >= 1) finish();
	        } else if (holding) {
	            finish();
	        }
	    };

	    draw = function(_x, _y, _w, _h) {
	        draw_set_color(make_color_rgb(200, 80, 50));
	        draw_rectangle(_x, _y, _x + _w, _y + _h, false);
	        draw_set_color(c_lime);
	        draw_rectangle(_x + _w * target_min, _y, _x + _w * target_max, _y + _h, false);
	        draw_set_color(c_black);
	        var _mx = _x + _w * value;
	        draw_rectangle(_mx - 4, _y - 10, _mx + 4, _y + _h + 10, false);
	        draw_rectangle(_x, _y, _x + _w, _y + _h, true);
	        draw_set_color(c_white);
	    };
	}

	function Lemon(_x, _y) constructor {
	    x = _x;
	    y = _y;
	    home_x = _x;
	    home_y = _y;
	    radius = 60;
	    dragging = false;
	    on_board = false;
	    cuts = 0;
	    cuts_needed = 3;

	    contains = function(_px, _py) {
	        return point_distance(x, y, _px, _py) <= radius;
	    };
	}
