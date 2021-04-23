/// @description Dockable

if (instance_exists(player)) {
	var distance = distance_to_object(player);
	if (distance < PLANET_DOCK_DISTANCE) {
		if (!in_docking_range && !dock_this) {
			// Set the current docking entity to this station
			in_docking_range = true;
			dock_this = true;
			system_dock_inst = id;
		}
	} else if (dock_this) {
		// We are out of range, cannot dock here
		in_docking_range = false;
		dock_this = false;
	}
} else {
	if (dock_this) {
		in_docking_range = false;
		dock_this = false;
	}
}
