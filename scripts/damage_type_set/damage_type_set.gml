/*
type_	: {
	armor		: multiplier against armor
	shields		: multiplier against shields
	fire		: fire damage inflicted
	electric	: power damage inflicted
	force		: knockback
}
*/
function damage_struct(damage_, armor_, shields_, fire_, electric_, force_, scrap_) constructor {
	damage = damage_;
	armor = armor_;
	shields = shields_;
	fire = fire_;
	electric = electric_;
	force = force_;
	scrap = scrap_;
}

function damage_type_set(damage_, armor_, shields_, fire_, electric_, force_, scrap_) {
	var type_ = new damage_struct(damage_, armor_, shields_, fire_, electric_, force_, scrap_);
	return type_;
}

function damage_collision_set(damage_) {
	var type_ = new damage_struct(damage_, .75, 1, 0, 0, 0, .8);
	return type_;
}