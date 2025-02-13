sprite_index = spr_player_walk;
alarm[0] = game_get_speed(gamespeed_fps) * 0.5;

var _dx = floor(random_range(-2,2));

for (var _i = 1; _i <= 20; _i++)
{
	x += _dx;
}
