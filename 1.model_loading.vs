#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;
layout (location = 3) in vec3 aTanCoords;
layout (location = 4) in vec4 aBiTanCoords;
layout (location = 5) in ivec4 aBoneIndexes;
layout (location = 6) in vec4 aBoneWeights;

out vec2 TexCoords;

const int MAX_BONES = 100;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;
uniform mat4 gBones[MAX_BONES];

void main()
{
	
	mat4 BoneTransform = gBones[aBoneIndexes[0]] * aBoneWeights[0];
    BoneTransform     += gBones[aBoneIndexes[1]] * aBoneWeights[1];
    BoneTransform     += gBones[aBoneIndexes[2]] * aBoneWeights[2];
    BoneTransform     += gBones[aBoneIndexes[3]] * aBoneWeights[3];

    TexCoords = aTexCoords;
	vec4 aPos4 = BoneTransform*vec4(aPos, 1.0);
    gl_Position = projection * view * model * aPos4;
}