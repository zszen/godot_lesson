shader_type canvas_item;

uniform vec4 shadow_color:hint_color;

uniform float tiled_factor = 10.0;
uniform float aspect_ratio = .5;

uniform sampler2D texture_offset_uv:hint_black;
uniform vec2 texture_offset_scale = vec2(.2,.2);
uniform float texture_offset_height = .1;

uniform float texture_offset_time_scale = .05;

uniform float sine_time_scale = .03;
uniform vec2 sine_offset_scale = vec2(.4, .4);
uniform float sine_wave_size = .4;

vec2 cal_wave_offset(float time,float multiplier, vec2 uv, vec2 scale){
	float time_mutiplier = time*multiplier;
	float unique_offset = uv.x+uv.y;
	return vec2(
		sin(time_mutiplier + unique_offset*scale.x),
		cos(time_mutiplier + unique_offset*scale.y)
	);
}

void fragment(){
	float myTime = 1.;
	//缩放纹理 修正横纵比
	vec2 adjusted_uv = UV*tiled_factor;
	adjusted_uv.y*=aspect_ratio;
	
	//时间波动
	vec2 sine_offset = cal_wave_offset(myTime, sine_time_scale, adjusted_uv, sine_offset_scale);
	
	//扩散收缩波动
	vec2 base_uv_offset = UV*texture_offset_scale;
	base_uv_offset+=myTime*texture_offset_time_scale; 
	
	vec2 texture_based_offset = texture(texture_offset_uv, base_uv_offset).rg*2.-1.;
//	texture_based_offset = texture_based_offset*2.-1.;
	
	//混合波动
	vec2 waves_uvs = adjusted_uv + texture_based_offset*texture_offset_height + sine_offset*sine_wave_size;
	//混合波叠加高度
	float waves_height= (texture_based_offset.y*.5+sine_offset.y)*.25+.5;
//	waves_height = min(waves_height*1.5,1.);

	vec4 diffuse_color = texture(TEXTURE, waves_uvs);
	
	//输出颜色
//	COLOR = vec4(tiled_uvs+ wave_uv_offset*sine_texture_offset_height+texture_based_offset,.0,1.);
//	COLOR = texture(TEXTURE, waves_uvs);
	COLOR = mix(diffuse_color,diffuse_color*shadow_color,waves_height);
//	COLOR = vec4(waves_height,waves_height,waves_height,1.);
//	NORMALMAP = texture(NORMAL_TEXTURE, waves_uvs/5.0).rgb;
}
