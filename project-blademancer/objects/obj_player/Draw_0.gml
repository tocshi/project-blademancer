// face last moved direction; CANNOT ACCOUNT FOR 0!
if(hspeed > 0){image_xscale = 1;}
if(hspeed < 0){image_xscale = -1;}


// movement effects
if(isMoving){
	var angle = 10*sin(global.time/5);
	draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,angle,c_white,1);
}
else{draw_self();}/// @description description

//temp
draw_set_halign(fa_center)
draw_text(x,y-40,string(hspeed)+", "+string(vspeed));
draw_set_halign(fa_left)