shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec4 color_1 = vec4(0.133, 0.137, 0.137, 1.0);
uniform vec4 color_2 = vec4(0.941, 0.965, 0.941, 1.0);
//uniform vec4 color_3 = vec4(0.098, 0.216, 0.294, 1.0);
//uniform vec4 color_4 = vec4(0.224, 0.427, 0.49, 1.0);
//uniform vec4 color_5 = vec4(0.443, 0.592, 0.592, 1.0);
//uniform vec4 color_6 = vec4(0.635, 0.722, 0.694, 1.0);
//uniform vec4 color_7 = vec4(0.333, 0.482, 0.471, 1.0);
//uniform vec4 color_8 = vec4(0.235, 0.373, 0.4, 1.0);
//uniform vec4 color_9 = vec4(0.145, 0.263, 0.318, 1.0);

void fragment() {

	vec4 colors[2] = {color_1, color_2};
	float min_diff = -1.0;
	vec4 min_color = vec4(0.133, 0.137, 0.137, 1.0);

	vec2 uv = SCREEN_UV;

	vec4 temp = textureLod(SCREEN_TEXTURE, uv, 0.0);

	min_diff = 1000.0;
	for (int i = 0; i < colors.length(); i++) {

		float curr_dist = distance(colors[i], temp);
		if (curr_dist < min_diff) {
			min_diff = curr_dist;
			min_color = colors[i];
		}
	}

	COLOR.rgb = min_color.rgb;
}
