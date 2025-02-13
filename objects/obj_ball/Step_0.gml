if (global.game_state == STATES.PLAYING)
{
	y += spd * dir;
	
	if (place_meeting(x, y, obj_block))
	{
		dir *= -1;
	}
}