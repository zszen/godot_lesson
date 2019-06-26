shader_type canvas_item;

uniform float speed:hint_range(.01,10.0) = 1.0;
uniform float scale:hint_range(.01,1.0) = 1.0;
uniform float distance:hint_range(.5,10.0) = 3.;

void fragment(){
	vec4 cc_all = vec4(vec3(.0),1.0);
	float scale_base = 1./scale/distance;
	float percent = fract(TIME*speed);
	for(int i=3;i>=1;i--){
		float scale_small = scale_base/pow(1.05,float(i*10));
		float scale_big = scale_base/pow(1.05,float((i+1)*10));
		vec2 uv = ((UV-.5)*(percent*(scale_small-scale_big)+scale_big)+.5);
		vec4 cc = texture(TEXTURE, uv);
		if(i==1){
			cc.a *= 1.-smoothstep(0.0, 1.0 ,percent);
		}
		cc_all.rgb = mix(cc_all.rgb,cc.rgb,cc.a);
	}
	COLOR = cc_all;
}