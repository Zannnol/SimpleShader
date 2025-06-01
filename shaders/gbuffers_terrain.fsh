#version 330 compatibility

uniform sampler2D lightmap;
uniform sampler2D gtexture;
uniform float frameTimeCounter;

uniform float alphaTestRef = 0.1;

in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
	// Tex atlas cell size
	const float cellSize = 1.0 / 64.0;
	// Base coord
	vec2 base = floor(texcoord / cellSize) * cellSize;
    // Local coord
	vec2 localUV = fract(texcoord / cellSize);
	//  Moving X
	float animatedX =  fract(localUV.x + frameTimeCounter * 0.5);

	// Animate UVs
	vec2 movingTexcoord = base + vec2(animatedX, localUV.y) * cellSize;
	
	// Texture sampling
	color = texture(gtexture, movingTexcoord) * glcolor;

	// Apply light
	color *= texture(lightmap, lmcoord);

	// Alpha test
	if (color.a < alphaTestRef) {
		discard;
	}
}