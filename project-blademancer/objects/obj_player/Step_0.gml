// movement
if(canMove){
	var hdir = 0;
	var vdir = 0;
	if(keyboard_check(global.key_left)){
		hdir -= 1;
	}
	if(keyboard_check(global.key_right)){
		hdir += 1;
	}
	if(keyboard_check(global.key_up)){
		vdir -= 1;
	}
	if(keyboard_check(global.key_down)){
		vdir += 1;
	}

	// process movement vectors
	if(hdir != 0 || vdir != 0){
		isMoving = true;
		movespeed += moveacc;
		movespeed = min(movespeed,maxmovespeed);
		movedir = point_direction(0,0,hdir,vdir);
		move(movespeed,movedir);
	}
	// deacc when not moving; needs to check for other speed to be 0 in order to count as not moving
	else if(isMoving){
		if(movespeed == 0){
			isMoving = false;
		}
		else{
			movespeed -= moveacc;
			movespeed = max(movespeed,0);
			
			move(movespeed,movedir);
		}
	}
}


// collide with wall
// TODO: add sweeping check to determine which direction player goes when colliding with slant
/*if(place_meeting(x+hspeed,y,obj_wall_parent)){
	while(!place_meeting(x+sign(hspeed),y,obj_wall_parent)){
		x += sign(hspeed);
	}
	hspeed = 0;
}
if(place_meeting(x,y+vspeed,obj_wall_parent)){
	while(!place_meeting(x,y+sign(vspeed),obj_wall_parent)){
		y += sign(vspeed);
	}
	vspeed = 0;
}*/