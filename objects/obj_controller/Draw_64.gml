draw_set_color(c_black);
draw_rectangle(0, 0, room_width, 40, false);

draw_set_color(c_white);
draw_set_font(fnt_score);
draw_text(20, 10, "SCORE: " + string(score));

image_speed = 0.1;
draw_set_color(c_white);
draw_sprite_ext(spr_cherry, -1, room_width / 2 - 32, 20, 0.5, 0.5, 0, c_white, 1);
draw_text(room_width / 2, 10, string(global.cherries) + "/" + string(global.cherries_max));

image_speed = 0.2;
draw_set_color(c_white);
draw_sprite_ext(spr_player_idle, -1, room_width - 110, 20, 0.5, 0.5, 0, c_white, 1);
draw_text(room_width - 100, 10, " X " + string(lives));

if (global.game_state == STATES.PAUSED)
{
	draw_set_color(c_white);
	draw_set_font(fnt_score);
	draw_text(room_width/2, room_height/2, "PAUSE");
	
	for (var _i = 0; _i < opt_number; _i++)
	{
		if( menu_index == _i)
		{
			draw_set_color(c_white);
		}
		else
		{
			draw_set_color(c_dkgray);
		}
		draw_text(1200, 700 + 30 * _i, options[_i]);
	}
}

if (global.game_state == STATES.GAMEOVER)
{
	draw_set_color(c_white);
	draw_set_font(fnt_score);
	
	if (lives <= 0)
	{
		draw_text(room_width / 2, room_height / 2, "GAME OVER");
	}
	else
	{
		draw_text(room_width / 2, room_height / 2, "YOU WON!");
	}
	
	for (var _i = 1; _i < opt_number; _i++)
	{
		if (menu_index == _i)
		{
			draw_set_color(c_white);
		}
		else
		{
			draw_set_color(c_dkgray);
		}
		draw_text(1200, 700 + 30 * _i, options[_i]);
	}
}