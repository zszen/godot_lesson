shader_type canvas_item;

uniform float ps:hint_range(0,1.2) = .5;
uniform float range:hint_range(0.01,1.) = .05;

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

void vertex(){
//	VERTEX+=vec2(10.,0);
//	VERTEX = (UV-.5)*100.;
//	vec2 uv = (UV-.5)*100.;
//	float l = length(UV);
//	float a = acos(UV.x/l);
//	vec2 uv = vec2(cos(UV.x),sin(UV.y));
//	vec2 uv = vec2(l,a);
//	uv *= 100.;
	vec2 uv = (UV-.5);
	uv = vec2(atan(uv.x,uv.y),length(uv)*.01)*100.;
	uv.y = cos(TIME*10.+UV.x*cos(TIME*10.)*1.+sin(TIME*10.)*UV.y*1.)*10.;//+sin(UV.x*100.)*10.;
//	uv *= 10.;
//	st*=100.;
//	VERTEX += uv;
}

void fragment(){
//	vec2 uv = (UV-.5);
//	uv = vec2(atan(uv.x,uv.y),length(uv));
//	COLOR = vec4(uv.x/6.2831+.5);
//	float x = uv.x*5.;
//	float m = min(fract(x),fract(1.-x));
//	float c = smoothstep(0.,1.,m*.3-uv.y);
//	vec2 st = vec2(atan(uv.x,uv.y),length(uv));
////	COLOR = vec4(st.x/6.2831+.5);
//	COLOR = vec4(c);
	
	vec4 cc = vec4(1.);
	cc.rgb = 1.-smoothstep(ps-range,ps,UV.x+noise(vec2(UV.y*100.,UV.x))*.2)*vec3(1.);
	COLOR = cc;

}