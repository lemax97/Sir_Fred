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
		
	}
	
}