/// @description Insert description here
// You can write your code in this editor

if(canMove){
	if(keyboard_check(global.key_left)){
		/*
		if(hspeed > -1 * movespeed){
			hspeed -= moveacc;
			isMoving = true;
		}
		*/
		hspeed = -1 * movespeed;
		isMoving = true;
	}
	if(keyboard_check(global.key_right)){
		/*
		if(hspeed < movespeed){
			hspeed += moveacc;
			isMoving = true;
		}
		*/
		hspeed = movespeed;
		isMoving = true;
	}
	if(keyboard_check(global.key_up)){
		/*
		if(vspeed > -1 * movespeed){
			vspeed -= moveacc;
			isMoving = true;
		}
		*/
		vspeed = -1 * movespeed;
		isMoving = true;
	}
	if(keyboard_check(global.key_down)){
		/*
		if(vspeed < movespeed){
			vspeed += moveacc;
			isMoving = true;
		}
		*/
		vspeed = movespeed;
		isMoving = true;
	}
	if(vspeed != 0 && hspeed != 0) {
		vspeed = vspeed * 0.7;
		hspeed = hspeed * 0.7;
	}
}

/*
// deacc when not moving
if(isMoving){
	if(!keyboard_check(global.key_left) && !keyboard_check(global.key_right)){
		if(hspeed != 0){
			if(hspeed > 0){ hspeed -= moveacc;}
			else{hspeed += moveacc;}
			if(hspeed > -0.1 && hspeed < 0.1){hspeed = 0;}
		}
		else{isMoving = false;}
	}
	if(!keyboard_check(global.key_up) && !keyboard_check(global.key_down)){
		if(vspeed != 0){
			if(vspeed > 0){ vspeed -= moveacc;}
			else{vspeed += moveacc;}
			if(vspeed > -0.1 && vspeed < 0.1){vspeed = 0;}
		}
		else{isMoving = false;}
	}
}
*/

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
}

// collide with wall
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