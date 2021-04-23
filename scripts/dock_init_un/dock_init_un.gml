function dock_init_un() {
	if (!ds_exists(system_dock_states, ds_type_list)) {
		system_dock_states = ds_list_create();
	}
	if (!ds_exists(system_dock_map, ds_type_map)) {
		system_dock_map = ds_map_create();
	}
	ds_list_add(system_dock_states,SHOP,COMMERCE,MERCENARY,HQ);
	system_dock_map[? SHOP] = [
		make_dist(UN,LAYOUT,1000),
		make_dist(UN,WEAPONS,200),
		make_dist(UN,ARMOR,200),
		make_dist(UN,SHIELDS,200),
		make_dist(UN,ENGINES,200),
		make_dist(UN,REACTORS,200),
		make_dist(UN,ACTIVES,200),
		make_dist(UN,PASSIVES,200),
		make_dist(UN,PROTOTYPES,200)
	];
	/*json_decode(
		"{\"Layouts\":[0, 1, 2, 2, 3, 0, 1, 0, 1]}"
	);*/
	system_dock_map[? COMMERCE] = json_decode(
		"{\"Missions\":[0, 1, 2, 2, 3, 0, 1, 0, 1]}"
	);
	system_dock_map[? MERCENARY] = json_decode(
		"{\"Missions\":[0, 1, 2, 2, 3, 0, 1, 0, 1]}"
	);
	system_dock_map[? HQ] = json_decode(
		"{\"Messages\":[\"We have an important mission for you.\"]}"
	);
}