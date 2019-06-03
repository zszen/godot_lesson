shader_type canvas_item;

uniform float tiled_factor = 10;
uniform float aspect_ratio = .5;

uniform sampler2D uv_offset_texture : hint_black;
uniform vec2 uv_offset_size = vec2(1.,1.);

uniform vec2 wave_size = vec2(.1);

uniform float time_scale = .05;

void fragment(){
	vec2 offset_texture_uv = UV*uv_offset_size;
	offset_texture_uv+= TIME * time_scale;
	offset_texture_uv.x += cos(TIME * time_scale);
	offset_texture_uv.y += sin(TIME * time_scale);
	
	vec2 texture_based_offset = texture(uv_offset_texture, offset_texture_uv).rg;
	texture_based_offset = texture_based_offset*2.-1.;
//	vec2 texture_based_offset = vec2(.0);
	
	vec2 adjusted_uv = UV* tiled_factor;
	adjusted_uv.y *=aspect_ratio;
	
	COLOR = texture(TEXTURE, adjusted_uv+texture_based_offset*wave_size);
//	COLOR = texture(uv_offset_texture,texture_based_offset);
//	COLOR = vec4(texture_based_offset, vec2(0.,1.));
	NORMALMAP = texture(NORMAL_TEXTURE, offset_texture_uv).rgb;
}
