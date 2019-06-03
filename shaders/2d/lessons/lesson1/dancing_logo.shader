shader_type canvas_item;

uniform float time_factor = 1.0;
uniform vec2 amplitude = vec2(10.0,5.0);

void vertex(){
//	 VERTEX += cos(TIME) * vec2(20.0,20.0);

	 VERTEX.x += cos(TIME*time_factor+VERTEX.x*amplitude.x+VERTEX.y) * amplitude.x;
	 VERTEX.y += sin(TIME*time_factor+VERTEX.y*amplitude.y+VERTEX.x) * amplitude.y;
}