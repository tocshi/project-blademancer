// movement
if(canMove){
	// conditions needed to determine diagonal slowdown
	var hMove = false;
	var vMove = false;
	if(keyboard_check(global.key_left)){
		
		if(hspeed > -1 * movespeed){
			hspeed -= moveacc;
			hspeed = max(-1*movespeed,hspeed);
		}
		isMoving = true;	
		hMove = true;
	}
	if(keyboard_check(global.key_right)){
		
		if(hspeed < movespeed){
			hspeed += moveacc;
			hspeed = min(movespeed,hspeed);
		}
		isMoving = true;
		hMove = true;
	}
	if(keyboard_check(global.key_up)){
		
		if(vspeed > -1 * movespeed){
			vspeed -= moveacc;
			vspeed = max(-1*movespeed,vspeed);
		}
		isMoving = true;
		vMove = true;
	}
	if(keyboard_check(global.key_down)){
		
		if(vspeed < movespeed){
			vspeed += moveacc;
			vspeed = min(movespeed,vspeed);	
		}
		isMoving = true;
		vMove = true;
	}
	// diagonal slowdown
	if(hMove && vMove && abs(hspeed) > movespeed * 1 / sqrt(2) && abs(vspeed) > movespeed * 1 / sqrt(2)) {
		vspeed = vspeed * (1 / sqrt(2));
		hspeed = hspeed * (1 / sqrt(2));
	}
}

// deacc when not moving; needs to check for other speed to be 0 in order to count as not moving
if(isMoving){
	if(!keyboard_check(global.key_left) && !keyboard_check(global.key_right)){
		if(hspeed != 0){
			if(hspeed > 0){ hspeed -= moveacc;}
			else{hspeed += moveacc;}
			if(hspeed > -0.15 && hspeed < 0.15){hspeed = 0;}
		}
		else if(vspeed = 0){isMoving = false;}
	}
	if(!keyboard_check(global.key_up) && !keyboard_check(global.key_down)){
		if(vspeed != 0){
			if(vspeed > 0){ vspeed -= moveacc;}
			else{vspeed += moveacc;}
			if(vspeed > -0.15 && vspeed < 0.15){vspeed = 0;}
		}
		else if(hspeed = 0){isMoving = false;}
	}
}

/*
if(isMoving) {
	if(!keyboard_check(global.key_left) && !keyboard_check(global.key_right)) {
		hspeed = 0;
	}
	if(!keyboard_check(global.key_up) && !keyboard_check(global.key_down)) {
		vspeed = 0;
	}
	if(hspeed == 0 && vspeed == 0) {
		isMoving = false;
	}
}*/

// collide with wall
// TODO: add sweeping check to determine which direction player goes when colliding with slant
if(place_meeting(x+hspeed,y,obj_wall_parent)){
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
}