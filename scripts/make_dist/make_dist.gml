function make_dist(faction, type, wealth) {
	var dist_list = ds_list_create();
	var dist_array;
	switch(faction) {
		case UN:
			dist_array = united_nations_shops[? type];
			for (var money_left = wealth; money_left > 0; money_left -= 0;) {
				var index_ = irandom(array_length(dist_array) - 1);
				var struct_ = dist_array[index_];
				ds_list_add(dist_list, struct_.object);
				money_left -= struct_.price;
			}
			break;
	}
	return dist_list;
}