event_inherited();   // ticks the stage timer

if (state == MG_STATE.PLAYING) {
    if (phase == LEMON_STAGE.CUT) {
        step_cutting();
    } else if (phase == LEMON_STAGE.SUGAR || phase == LEMON_STAGE.SHAKE) {
        meter.update();
        if (meter.finished) complete_phase();
    }
}