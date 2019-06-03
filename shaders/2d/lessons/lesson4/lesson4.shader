shader_type canvas_item;

uniform float tiled_factor = 10.0;
uniform float aspect_ratio = .5;

uniform sampler2D uv_offset_texture:hint_black;
uniform vec2 uv_offset_scale = vec2(.2,.2);
uniform float wave_size = .1;

uniform vec2 time_scale = vec2(.05,.08);

uniform vec2 sine_time_factor = vec2(2., 3.);
uniform vec2 sine_offset_factor = vec2(5.,2.);
//uniform vec2 sine_wave_size = vec2(.05, .05);
uniform float sine_wave_size = .4;
uniform float sine_wave_scale = .03;

vec2 cal_wave_offset(float time,float multiplier, vec2 uv, vec2 scale){
	vec2 offset;
	float time_mutiplier = time*multiplier;
	float unique_offset = uv.x+uv.y;
	offset.x = cos(time_mutiplier + unique_offset*scale.x);
	offset.y = sin(time_mutiplier + unique_offset*scale.y);
	return offset;
}

void fragment(){
	//缩放纹理 修正横纵比
	vec2 adjusted_uv = UV*tiled_factor;
	adjusted_uv.y*=aspect_ratio;
	
	//时间波动
	vec2 wave_uv_offset = sine_wave_size*cal_wave_offset(TIME, sine_wave_scale, adjusted_uv, sine_offset_factor);
	
	//扩散收缩波动
	vec2 base_uv_offset = UV*uv_offset_scale;
	base_uv_offset+=TIME*time_scale; 
	
	vec2 texture_based_offset = texture(uv_offset_texture, base_uv_offset).rg;
	texture_based_offset = texture_based_offset*2.-1.;
	texture_based_offset*=wave_size;
	 
	//混合波动
//	COLOR = vec4(tiled_uvs+ wave_uv_offset*sine_wave_size+texture_based_offset,.0,1.);
	COLOR = texture(TEXTURE, adjusted_uv+ wave_uv_offset*sine_wave_size+texture_based_offset);
}
