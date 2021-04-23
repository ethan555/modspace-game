function shop_switch_type(layout, type) {
	// Switch to type
	layout_bool = layout;
	shop_deactivate();
	shop_index = type;
	shop_activate();
}