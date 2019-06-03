shader_type canvas_item;

//uniform float blue:hint_range(.0,1.,.1) = 1.;

//void vertex() {
//  VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
//}

//uniform float brightness = 1;
//uniform float contrast = 1.;
//uniform float saturation = 5;
//
//void fragment() {
//    vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
//
//    c.rgb = mix(vec3(0.0), c.rgb, brightness);
//    c.rgb = mix(vec3(0.5), c.rgb, contrast);
//    c.rgb = mix(vec3(dot(vec3(0.2125, 0.7154 ,0.0721), c.rgb) ), c.rgb, saturation);
//
//    COLOR.rgb = c;
//}


//void fragment(){
//	COLOR = texture(TEXTURE, UV); //read from texture
// 	COLOR.b = blue;
//	COLOR.g = .0;
//}


void vertex() {
  POSITION = vec2(VERTEX, 1.0);
}