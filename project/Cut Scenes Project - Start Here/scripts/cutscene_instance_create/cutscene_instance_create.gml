function cutscene_instance_create(x, y, layer_id_or_name, obj) {
	instance_create_layer(x, y, layer_id_or_name, obj);
	cutscene_end_action();
}