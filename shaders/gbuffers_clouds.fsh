#version 330 compatibility

uniform sampler2D gtexture;

uniform float alphaTestRef = 0.1;

uniform float frameTimeCounter;

in vec2 texcoord;
in vec4 glcolor;

/* RENDERTARGETS: 0 */
layout(location = 0) out vec4 color;

void main() {
	vec4 texColor = texture(gtexture, texcoord) * glcolor;

	// Smooth animation changing color
	float r = 0.9 + 0.1 * sin(frameTimeCounter * 5.0);
	float g = 0.9 + 0.1 * sin(frameTimeCounter * 5.0 + 2.0);
	float b = 0.9 + 0.1 * sin(frameTimeCounter * 5.0 + 4.0);

	vec3 animatedTint = vec3(r, g, b);

	color = vec4(texColor.rgb * animatedTint, texColor.a);
	if (color.a < alphaTestRef) {
		discard;
	}
}