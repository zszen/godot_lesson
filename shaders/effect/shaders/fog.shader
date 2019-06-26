shader_type canvas_item;

uniform vec3 color = vec3(.35,.48,.7);
uniform int OCTAVES = 4;

float rand(vec2 uv){
	return fract(sin(dot(uv, vec2(56,78))*1000.0)*1000.0);
}

float noise(vec2 uv){
	vec2 i = floor(uv);
	vec2 f = fract(uv);
	float a = rand(i);
	float b = rand(i+vec2(1.,0.));
	float c = rand(i+vec2(.0,1.));
	float d = rand(i+vec2(1.,1.));
	
	vec2 cubic = f*f*(3.-2.*f);
	
//	return mix(a,b,f.x)+(c-a)*f.y*(1.-f.x)+(d-b)*f.x*f.y;
	return mix(a,b,cubic.x)+(c-a)*cubic.y*(1.-cubic.x)+(d-b)*cubic.x*cubic.y;
}

float fbm(vec2 uv){
	float val = 0.;
	float scale = .5;
	
	for(int i=0;i<OCTAVES;i++){
		val+=noise(uv)*scale;
		uv*=2.;
		scale*=.5;
	}
	
	return val;
}

void fragment(){
	vec2 uv = UV*20.;
//	uv.y*=2.;
	
	vec2 motion = vec2(fbm(uv+vec2(TIME*-2., sin(TIME*2.+fract(uv.x*uv.y)))));
	float final = fbm(uv+motion);
	
//	COLOR = vec4(color, rand(uv));
	COLOR = vec4(color, final*.35);
}

