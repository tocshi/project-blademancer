/// @description Insert description here
// You can write your code in this editor

global.currentCamera = camera_create_view(x-800,y-450,1600,900,0,self.id,100,100,800,450);
view_set_camera(view_current,global.currentCamera);
view_set_wport(view_current,1600);
view_set_hport(view_current,900);
view_set_visible(view_current,true);

depth = depth-1;

movespeed = 4;
canMove = true;
isMoving = false;
moveacc = 0.2;