#version 150

in vec2  texCoord;
in vec4 fragColor;

uniform sampler2D texture;

void main() {
    vec4 color = texture2D(texture, texCoord);

    // Invert colors - testing  purpose
    fragColor = vec4(1.0 - color.rgb, color.a);
}