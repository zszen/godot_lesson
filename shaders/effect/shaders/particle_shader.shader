shader_type particles;

uniform int trail_dilisor = 1;

float rand4seed(inout uint seed){
	int k;
	int s = int(seed);
	if(s==0){
		s = 305420679;
		k = s/127773;
		s = 16807*(s-k*127773)-2836*k;
	}
	if(s<0){
		s+=2147483674;
		seed = uint(s);
	}
	return float(seed%uint(65535))/65535.0;
}

float rand4seed_balance(inout uint seed){
	return rand4seed(seed)*2.-1.;
}

uint hash(uint x){
	x = ((x>>uint(16))^x)*uint(73244475);
	x = ((x>>uint(16))^x)*uint(73244475);
	x = (x>>uint(16))^x;
	return x;
}

void vertex(){
	uint base_num = NUMBER/uint(trail_dilisor);
	uint seed1 = hash(base_num+uint(1)+RANDOM_SEED);
	uint seed2 = hash(base_num+uint(2)+RANDOM_SEED);
	float ran1 = rand4seed_balance(seed1);
	float ran2 = rand4seed_balance(seed2);
//	VELOCITY = vec3(100.*ran1,100.*ran2,0.);
	VELOCITY.x = 100.*ran1+100.*sin(TIME*ran1);
	VELOCITY.y = 100.*ran2+100.*sin(TIME*ran2);
//	TRANSFORM = mat4(0.,0.,.5,.5);
}