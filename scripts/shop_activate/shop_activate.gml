function shop_activate(){
	var shop_items = shop_array[shop_index];
	for (var j = 0, length = ds_list_size(shop_items); j < length; j++) {
		instance_activate_object(shop_items[| j]);
	}
}