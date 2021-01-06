global.currentCamera = camera_create_view(x-800,y-450,1600,900,0,self.id,100,100,800,450);
view_set_camera(view_current,global.currentCamera);
view_set_wport(view_current,1600);
view_set_hport(view_current,900);
view_set_visible(view_current,true);

depth = depth-1;

movespeed = 0;
maxmovespeed = 4;
moveacc = 0.25;
movedir = 0;
canMove = true;
isMoving = false;

stats = {
	hp : 3,
	atk : 10,
	inventory : [] // or whatever it is that we want to call the weapons that the player has attracted towards them
};
