///@description Returns whether the two factions are at war
function check_faction(faction_, target_faction_){
	return ds_map_exists(faction_map[? target_faction_], faction_);
}