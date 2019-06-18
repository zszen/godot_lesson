shader_type canvas_item;

vec3 samplef(vec2 offset, vec2 uv, sampler2D text, vec2 tsize){
	return texture(text, vec2(uv+offset*tsize)).rgb;
}

float luminance(vec3 c){
	return dot(c,vec3(.2126,.7152,.0722));
//	return dot(c,vec3(1.))*0.3333;
}

vec3 sobelFilter(vec2 uv, sampler2D text, vec2 tsize){
	//
	vec3 hc=samplef(vec2(-1.,-1.),uv,text,tsize)+samplef(vec2(0.,-1.),uv,text,tsize)*2.
		+samplef(vec2(1.,-1.),uv,text,tsize)+samplef(vec2(-1.,1.),uv,text,tsize)*-1.
		+samplef(vec2(0.,1.),uv,text,tsize)*-2.+samplef(vec2(1.,1.),uv,text,tsize)*-1.;
	//
	vec3 vc=samplef(vec2(-1.,-1.),uv,text,tsize)+samplef(vec2(-1.,0.),uv,text,tsize)*2.
		+samplef(vec2(-1.,1.),uv,text,tsize)+samplef(vec2(1.,-1.),uv,text,tsize)*-1.
		+samplef(vec2(1.,0.),uv,text,tsize)*-2.+samplef(vec2(1.,1.),uv,text,tsize)*-1.;
	return texture(text,uv).rgb*pow(luminance(vc*vc+hc*hc),.6);
}

void fragment(){
//	COLOR = vec4(sobelFilter(UV, TEXTURE, TEXTURE_PIXEL_SIZE),1.0);
//	COLOR = vec4(vec3(length(sobelFilter(UV,TEXTURE,TEXTURE_PIXEL_SIZE))),1.);
	COLOR = vec4(vec3(length(sobelFilter(UV,TEXTURE,TEXTURE_PIXEL_SIZE))),texture(TEXTURE,UV).a);
}