function dialogue_un() {
	// UN Dialogue
	var type = "none";//choose("friend","enemy","none");
	var target = noone;
	var chance = random_range(0,100);
	if (chance > 25) {
		var ship_number = instance_number(ship_parent);
		target = instance_find(ship_parent,irandom(ship_number - 1));
		if (target == self) target = noone;
		else {
			type = check_faction(faction, target.faction) ? "enemy" : "friend";
		}
	}
	var dialogue_options = dialogue_faction_data[$ dialogue_faction][$ dialogue_type][$ type];
	var dialogue = dialogue_options[irandom(array_length(dialogue_options) - 1)];
	if (target != noone) {
		dialogue = string_replace_all(dialogue, "%NAME%", target.name);
	}
	add_dialogue(name,faction,dialogue,target);
}