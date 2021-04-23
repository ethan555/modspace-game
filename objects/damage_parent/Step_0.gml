/// @description Countdown lifespan
if (lifespan > 0) {
	lifespan --;
} else {
	script_execute(end_script, noone);
}