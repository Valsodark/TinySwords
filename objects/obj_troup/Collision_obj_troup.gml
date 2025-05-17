
x -= dcos(point_direction(x, y, other.x, other.y));
y += dsin(point_direction(x, y, other.x, other.y));
// Check to see if you are stuck

if (x == other.x && y == other.y){
	if (id > other.id){
		x -= 1
		y += 1
	} else {
		x += 1
		y -= 1
	}
}
