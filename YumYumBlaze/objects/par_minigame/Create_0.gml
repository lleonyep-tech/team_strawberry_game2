state = MG_STATE.PLAYING;
stage_time_total = 1;
stage_time_left = 0;
stage_speed_scores = [];

begin_stage = function(_seconds) {
    stage_time_total = _seconds;
    stage_time_left = _seconds;
};

end_stage = function() {
    array_push(stage_speed_scores, stage_time_left / stage_time_total);
};

on_stage_timeout = function() {
    end_stage();
};

speed_score = function() {
    var _n = array_length(stage_speed_scores);
    if (_n == 0) return 0;
    var _sum = 0;
    for (var i = 0; i < _n; i++) _sum += stage_speed_scores[i];
    return (_sum / _n) * MAX_DISH_SCORE;
};