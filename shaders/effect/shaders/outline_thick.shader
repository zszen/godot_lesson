shader_type canvas_item;

uniform int SAMPLES = 6;
uniform float WIDTH = 4.0;
uniform vec4 OUTLINE_COLOR = vec4(0.,0.,0.,1.);

uniform vec2 TEXTURE_SCALE = vec2(0.94);


void fragment(){
	vec2 uv_offset = (1.-TEXTURE_SCALE)*.5;
	vec2 uv = UV/TEXTURE_SCALE-uv_offset;
	
	vec4 cc = texture(TEXTURE,uv);
	if(UV.x<uv_offset.x || UV.x>1.-uv_offset.x){
		cc.a = 0.;
	}
	if(UV.y<uv_offset.y || UV.y>1.-uv_offset.y){
		cc.a = 0.;
	}
    //OUTLINE
    float outlineAlpha = 0.0;
	float angle = 0.0;
	float unit_angle = 1.0/float(SAMPLES) * 3.1415*2.0;
	for( int i=0; i<SAMPLES; i++ ){
		angle += unit_angle;
		vec2 testPoint = vec2( (WIDTH*TEXTURE_PIXEL_SIZE.x)*cos(angle), (WIDTH*TEXTURE_PIXEL_SIZE.y)*sin(angle) );
		testPoint = clamp( testPoint+uv, vec2(0.), vec2(1.));
		float sampledAlpha = texture( TEXTURE,  testPoint ).a;
		outlineAlpha = max( outlineAlpha, sampledAlpha );
	}
	COLOR = mix( vec4(0.0), OUTLINE_COLOR, outlineAlpha );
	COLOR = mix( COLOR, cc, cc.a );
}