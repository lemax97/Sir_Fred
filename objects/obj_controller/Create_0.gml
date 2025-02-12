enum STATES {
PLAYING,
PAUSED,
DEAD,
GAMEOVER
};

global.game_state = STATES.PLAYING;

game_set_speed(60, gamespeed_fps);

global.cherries = 0;
global.cherries_max = instance_number(obj_cherry);
global.startx = obj_player.x;
global.starty = obj_player.y;

options = ["RESUME", "RESTART", "QUIT"];
opt_number = array_length(options);
menu_index = 0;

if (room == room0)
{
	lives = 3;
}