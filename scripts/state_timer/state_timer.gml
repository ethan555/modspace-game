function state_timer() {
	if (--ai_state_timer <= 0) {
		ai_state = modulo(ai_state + 1, ai_state_max);
		ai_state_timer = random_gauss(ai_state_times[ai_state], sqrt(ai_state_times[ai_state] / 2));
	}
}