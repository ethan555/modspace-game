//
// Eclipse shader
// Ethan Williams
//

#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 resolution;
uniform float xpos;
uniform float ypos;
uniform float zoom;

const vec3 color_dist = vec3(.35, .2, 1.);

const vec3 star_color_dist = vec3(.1, .4, 1.);
const vec3 star_color_dist2 = vec3(.35, .1, 1.);

const float scale = 10.;

float random(vec2 st) {
	return fract(sin(dot(st.xy, vec2(12.9898,78.233)))* 43758.5453123);
}

float random(float x) {
	return random(vec2(x, x));
}
vec3 random3(vec3 st){
	st = vec3(dot(st,vec3(127.1,311.7,240.2)),
			dot(st,vec3(269.5,183.3,346.5)),
			dot(st,vec3(183.6,221.9,148.0)));
	return -1.0 + 2.0*fract(sin(st)*43758.5453123);
}

float gradient(vec3 st) {
	vec3 i = floor(st);
	vec3 f = fract(st);

	// Quintic
	vec3 u = f*f*f*(f*(f*6.-15.)+10.);

	return mix(mix(
		mix(dot(random3(i + vec3(0.,0.,0.)), f - vec3(0.,0.,0.)),
			dot(random3(i + vec3(1.,0.,0.)), f - vec3(1.,0.,0.)), u.x),
		mix(dot(random3(i + vec3(0.,1.,0.)), f - vec3(0.,1.,0.)),
			dot(random3(i + vec3(1.,1.,0.)), f - vec3(1.,1.,0.)), u.x), u.y),
	mix(mix(dot(random3(i + vec3(0.,0.,1.)), f - vec3(0.,0.,1.)),
			dot(random3(i + vec3(1.,0.,1.)), f - vec3(1.,0.,1.)), u.x),
		mix(dot(random3(i + vec3(0.,1.,1.)), f - vec3(0.,1.,1.)),
			dot(random3(i + vec3(1.,1.,1.)), f - vec3(1.,1.,1.)), u.x), u.y), u.z);
}

const mat3 rot1 = mat3(-0.37, 0.36, 0.85,-0.14,-0.93, 0.34,0.92, 0.01,0.4);

float gradient_octaves(vec3 st, int octaves) {
	return 0.6*gradient(st)
			+0.4*gradient(2.*st*rot1);
}

void main( void ) {

	//vec2 center = vec2(xpos, (ypos * resolution.y / resolution.x));

	float pix_scale = 1000.;
	vec2 drawpos = (gl_FragCoord.xy - (resolution * .5))/resolution.y;
	//vec2 position = vec2((floor((xpos + drawpos.x)*pix_scale)/pix_scale) * zoom, (floor((ypos + drawpos.y)/pix_scale)*pix_scale) * zoom);
	vec2 position = vec2((xpos/4. + drawpos.x) * zoom, (ypos/4. + drawpos.y) * zoom);
	//vec2 eclipse_position = (floor(gl_FragCoord.xy/eclipse_scale)*eclipse_scale) / resolution.x;

	vec4 color = vec4(0., 0., 0., 1.);
	float t = mod(time*0.01, 10000.);
	float t2 = mod(time*0.05, 10000.);

	//float dist = distance(eclipse_position.xy, center)*scale;
	vec3 randposition = vec3(position * 1.+0., t);
	vec3 colordelta = vec3(
		gradient_octaves(randposition*2.+500., 2)*1.+.5,
		gradient_octaves(randposition*2.-20., 2)*1.+.5,
		gradient_octaves(randposition*2.-1000., 2)*1.+.5);
	float value = 2.*pow(6.*pow(.5 + gradient_octaves(randposition, 2)*.5, 6.), 2.);
	
	float spacevalue = value*10.;
    float starvalue = 0.;
	vec3 stars = vec3(0.);
	
	float cloud = 6.*pow(.5 + gradient_octaves(randposition, 2)*.5, 8.);
	
	vec3 starposition = vec3(position * 200.*(zoom/5.)+vec2(xpos,ypos)*4.*zoom, t2);
	starvalue = pow(.7 + gradient_octaves(starposition, 2)*.5, 1.);
	stars = mix(vec3(0.,0.,0.), vec3(1.,1.,1.), smoothstep(0.99, 1.0, vec3(starvalue)));
	stars = clamp(stars, 0.0, 1.0);
		
	value = max(value, 0.);

    color.rgb = color_dist * vec3(value, value, value);

    color.rgb += max(colordelta * stars, vec3(spacevalue)* star_color_dist * stars);//star_color_dist * vec3(spacevalue, spacevalue, spacevalue) * stars;
	color.rgb += star_color_dist2 * spacevalue;
	color.rgb += mix(star_color_dist * cloud, star_color_dist2 * cloud, vec3(0.));
	
	gl_FragColor = color;

}
