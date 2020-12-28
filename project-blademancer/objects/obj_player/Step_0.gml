/// @description Insert description here
// You can write your code in this editor

destX = x;
destY = y;
if(keyboard_check(global.key_up)){
	destY -= movespeed;
}
if(keyboard_check(global.key_down)){
	destY += movespeed;
}
if(keyboard_check(global.key_left)){
	destX -= movespeed;
}
if(keyboard_check(global.key_right)){
	destX += movespeed;
}

if(destX != x || destY != y){
	isMoving = true;
}

if((point_distance(x, y, destX, destY) < movespeed && canMove)){
	isMoving = false;
}

if(isMoving && canMove){
	move(movespeed, point_direction(x,y,destX,destY));
}