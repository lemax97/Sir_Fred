var _keyleft = keyboard_check(vk_left);
var _keyright = keyboard_check(vk_right);
var _keyup = keyboard_check(vk_up);
var _keydown = keyboard_check(vk_down);
var _jumping = keyboard_check_pressed(vk_space);

var _move = _keyright - _keyleft;
var _vmove = _keydown - _keyup;

hsp = spd * _move;//speed multiply by direction
vsp = vsp + grv;//vertical speed + gravity

//walking
if (_move != 0)
{
	image_xscale = _move;
	idle = _move;
	if (grounded)
	{
		sprite_index = spr_player_walk;
	}
}
else
{
	if (!climbing)
	{
		image_xscale = idle;//to provide correct rendering of idle mode
		sprite_index = spr_player_idle;
	}
}

// Jump
if (grounded and _jumping)
{
	vsp = -jspd;
	grounded = false;
	//image_xscale = _move;
	sprite_index = spr_player_jump;
	
}

// Climbing
if ( place_meeting(x, y + 1, obj_ladder))
{
	if (( _vmove < 0 ) or (_vmove == 0 and climbing)
		or _vmove == 0 and place_meeting(x, y - 1, obj_ladder) 
		or (_vmove > 0 and place_meeting(x, y + sprite_height, obj_ladder)))
	{
		climbing = true;
	}
	else
	{
		
		climbing = false;
	}
}
else
{
	climbing = false;
}

if ( climbing )
{
	vsp = _vmove * spd;
	sprite_index = spr_player_climb;
}

// Horisontal collisions with blocks

if ( place_meeting(x + hsp, y, obj_block))
{
	while (not place_meeting(x + sign(hsp), y, obj_block))
	{
		x += sign(hsp);	
	}
	hsp = 0;
}

x += hsp;//x + horisontal speed


// Vertical collisions with blocks
if (place_meeting(x, y + vsp, obj_block))
{
	if (not climbing)
	{
		while (not place_meeting(x, y + sign(vsp), obj_block))
		{
			y += sign(vsp);
		}
		vsp = 0;
		grounded = true;
	}//not climbing
}
else
{
	grounded = false;
}

y += vsp;