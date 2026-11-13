if (state == MG_STATE.PLAYING) {
    stage_time_left -= delta_time / 1000000;
    if (stage_time_left <= 0) {
        stage_time_left = 0;
        on_stage_timeout();
    }
}