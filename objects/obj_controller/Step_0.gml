var _esc_pressed = keyboard_check_pressed(vk_escape);
var _enter_pressed = keyboard_check_pressed(vk_enter);
var _move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

if (_esc_pressed)
{
	if (global.game_state == STATES.PLAYING)
	{
		global.game_state = STATES.PAUSED;
		audio_play_sound(snd_menu, 1, false);
		instance_deactivate_all(1);
	}
	else if (global.game_state == STATES.PAUSED)
	{
		global.game_state = STATES.PLAYING;
		instance_activate_all();
	}
}

if (global.game_state == STATES.PAUSED)
{
	menu_index += _move;
	
	if (_move != 0)
	{
		audio_play_sound(snd_menu, 1, false);
	}
	
	if( menu_index < 0)
	{
		menu_index = opt_number - 1;
	}
	else if (menu_index > opt_number - 1)
	{
		menu_index = 0;
	}
	
	if ( _enter_pressed)
	{
		switch (menu_index)
		{
			case 0:
				global.game_state = STATES.PLAYING;
				instance_activate_all();
				break;
			case 1:
				game_restart();
				break;
			case 2:
				game_end();
				break;
		}
	}
}

if (global.game_state == STATES.GAMEOVER)
{
	instance_deactivate_all(1);
	menu_index += _move;
	
	if ( _move != 0)
	{
		audio_play_sound(snd_menu, 1, false);
	}
	
	if (menu_index < 1)
	{
		menu_index = opt_number - 1;
	}
	else if (menu_index > opt_number - 1)
	{
		menu_index = 1;
	}
	
	if ( _enter_pressed)
	{
		switch (menu_index)
		{
			case 1:
				game_restart();
				break;
			case 2:
				game_end();
				break;
		}
	}
}

if (global.game_state == STATES.DEAD)
{
	lives--;
	alarm[0] = game_get_speed(gamespeed_fps) * 1;
	global.game_state = STATES.PLAYING;
	
	if (lives <= 0)
	{
		global.game_state = STATES.GAMEOVER;
	}
}