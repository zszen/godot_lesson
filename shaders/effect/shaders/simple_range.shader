shader_type canvas_item;

//uniform vec3 color = vec3(.35,.48,.7);
//uniform int OCTAVES = 4;

//float rand(vec2 uv){
//	return fract(sin(dot(uv, vec2(56,78))*1000.0)*1000.0);
//}

float range(float mi, float ma, float val){
	return step(mi,val)*(1.-step(ma,val));
}

float smoothrange(float mi, float ma, float val){
	float mid = (ma+mi)*.5;
	return smoothstep(mi,mid,val)*(1.-smoothstep(mid,ma,val));
}

//float clamprange(

void fragment(){
	vec4 cc = vec4(vec3(1.), smoothrange(.2,.8,UV.x)*smoothrange(.2,.8,UV.y));
//	cc.a = clamp(cc.a,.5,1.);
//	cc.r = mix(cc.r,cc.a,cc.a);
//	cc.a
	COLOR = cc;
}