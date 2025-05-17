#version 150

in vec4 mc_Entity;
in vec3 mc_Normal;
in vec4 mc_Vertex;
in vec2 mc_MultiTexCoord0;

out vec2 texCoord;

void main() {
    gl_Position = ftransform();
    texCoord = mc_MultiTexCoord0;
}