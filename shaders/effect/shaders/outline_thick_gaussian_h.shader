shader_type canvas_item;

uniform int SAMPLES = 6;
uniform float WIDTH = 4.0;
uniform vec4 OUTLINE_COLOR = vec4(0.,0.,0.,1.);

uniform vec2 TEXTURE_SCALE = vec2(0.94);

float scurve(float x){
	x = x*2. - 1.;
	return -x*abs(x)*.5+x+.5;
}

vec4 gaussian_blur_h(sampler2D src, vec2 size, vec2 uv, float radius){
	if(radius>=1.0){
		vec4 c = vec4(0.);
//		float width = 1./size.x;
		float divsor = 0.;
		float weight = 0.;
		float radius_multiplier = 1./radius;
		
		for(float x=-10.; x<=10.;x++){
			weight = smoothstep(-1.,1.,1.-abs(x)*radius_multiplier);
			c+=texture(src, uv+vec2(x*size.x,0.))*weight;
			divsor+=weight;
		}
		return vec4(c.r/divsor, c.g/divsor, c.b/divsor, 1.0);
	}
	return texture(src,uv);
}

void fragment(){
	COLOR = gaussian_blur_h(TEXTURE ,TEXTURE_PIXEL_SIZE ,UV , 5.);
}