var _keyleft = keyboard_check(vk_left);
var _keyright = keyboard_check(vk_right);

var _move = _keyright - _keyleft;

hsp = spd * _move;

if (_move != 0)
{
	image_xscale = _move;
	sprite_index = spr_player_walk;
}
else
{
	sprite_index = spr_player_idle;
}

x += hsp;