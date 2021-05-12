function dialogue_display(speaker, dialogue) {
	return speaker + ": " + dialogue;
}

function draw_dialogue() {
	draw_set_font(display_font);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var m_x = message_x, m_y = message_y;
	var min_y = map_y + map_size * map_scale + 10;
	var m_struct = dialogue_buffer[dialogue_index];
	if (m_struct == 0) return;
	var m = m_struct.dialogue;
	var m_s = m_struct.speaker;
	var m_f = m_struct.faction;
	var m_c = faction_color[? m_f];
	var d_y = message_y_spacing;
	draw_text_transformed_color(m_x,m_y,dialogue_display(m_s,m),message_scale,message_scale,0,m_c,m_c,m_c,m_c,gui_alpha);
	for (var length = array_length(dialogue_buffer), i = modulo(dialogue_index-1,length); i != dialogue_index; i = modulo(i-1,length)) {
		m_struct = dialogue_buffer[i];
		var draw_y = m_y - d_y;
		if (m_struct == 0 || draw_y <= min_y) break;
		var m = m_struct.dialogue;
		var m_s = m_struct.speaker;
		var m_f = m_struct.faction;
		var m_c = faction_color[? m_f];
		draw_text_transformed_color(m_x,draw_y,dialogue_display(m_s,m),message_scale,message_scale,0,m_c,m_c,m_c,m_c,gui_alpha);
		d_y += message_y_spacing;
	}
}