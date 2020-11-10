function cutscene_move_character(_obj, _x, _y, _relative, _spd){
	static x_dest = -1;
	static y_dest = -1;
	
	if (x_dest == -1) {
		x_dest = _relative ? _obj.x + _x : _x;
		y_dest = _relative ? _obj.y + _y : _y;
	}
	
	var xx = x_dest;
	var yy = y_dest;
	
	with (_obj) {
		
		if (point_distance(x, y, xx, yy) >= _spd) {
			var dir = point_direction(x, y, xx, yy);
			var ldirx = lengthdir_x(_spd, dir);
			var ldiry = lengthdir_y(_spd, dir);
			
			x += ldirx;
			y += ldiry;
		}
		else {
			x = xx;
			y = yy;
		}
		
		with (other) {
			x_dest = -1;
			y_dest = -1;
		}
		
	}
}