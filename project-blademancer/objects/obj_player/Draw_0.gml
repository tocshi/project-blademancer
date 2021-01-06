// face last moved direction; CANNOT ACCOUNT FOR 0!
//if(hspeed > 0){image_xscale = 1;}
//if(hspeed < 0){image_xscale = -1;}


// movement effects
if(isMoving){
	var angle = 10*sin(global.time/5);
	draw_sprite_ext(sprite_index,-1,x,y,image_xscale,image_yscale,angle,c_white,1);
}
else{draw_self();}/// @description description

//temp
draw_set_halign(fa_center)
draw_text(x,y-40,movespeed);
draw_set_halign(fa_left)

// draw HP
var hpleft = stats.hp;
var xx = 0;
var yy = 0;
for(var i = 0; i < 3; ++i){
	if(hpleft > 0){
		draw_sprite(spr_playerhp,1,xx,yy);
	}
	else{
		draw_sprite(spr_playerhp,0,xx,yy);
	}
	hpleft--;
	xx += sprite_get_width(spr_playerhp);
}