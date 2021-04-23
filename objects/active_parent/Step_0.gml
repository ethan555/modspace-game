/// @description Control active system

if (instance_exists(parent)) {
	active = parent.inputs[ACTIVE] && alarm[0] < 1;
} else {
	active = false;
}

script_execute(active_script);