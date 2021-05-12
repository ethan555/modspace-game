function init_un_shop_map() {
	var un_shop_map = ds_map_create();
	un_shop_map[? LAYOUT] = [
		new item(layout_1x1, 10),
		new item(layout_2x1, 25),new item(layout_2x2, 60),
		new item(layout_3x1, 40),new item(layout_3x2, 95),new item(layout_3x3, 150),
		new item(layout_4x1, 55),new item(layout_4x2, 130),new item(layout_4x3, 205),new item(layout_4x4, 280)
	];
	un_shop_map[? WEAPONS] = [
		new item(gun_machinegun, 100),
		new item(gun_flak, 90),
		new item(gun_sniper, 140),
		new item(gun_missile, 250),
		new item(gun_grenade, 120),
		new item(gun_laser, 200),
		new item(gun_cannon, 220),
	];
	un_shop_map[? ARMOR] = [
		new item(armor_light, 20),
		new item(armor_medium, 50),
		new item(armor_heavy, 100),
	];
	un_shop_map[? SHIELDS] = [
		new item(shield_light, 100),
		new item(shield_medium, 250),
		new item(shield_heavy, 500)
	];
	un_shop_map[? ENGINES] = [
		new item(engine_light, 20),
		new item(engine_medium, 20)
	];
	un_shop_map[? REACTORS] = [
		new item(reactor_parent, 200)
	];
	un_shop_map[? ACTIVES] = [
		new item(active_blink, 100)
	];
	un_shop_map[? PASSIVES] = [
		new item(gun_machinegun, 20),
		new item(gun_flak, 17),
		new item(gun_sniper, 30),
	];
	un_shop_map[? PROTOTYPES] = [
		new item(gun_machinegun, 100),
		new item(gun_flak, 90),
		new item(gun_sniper, 140),
	];
	return un_shop_map;
}