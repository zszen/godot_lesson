shader_type canvas_item;

void fragment(){
	vec4 cc = texture(TEXTURE,UV);
//	cc.a = step(.5,cc.a);
	COLOR = cc;
}