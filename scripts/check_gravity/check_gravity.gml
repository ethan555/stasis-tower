/// @description Check gravity regions and add to xspd/yspd

#region Handle universal gravity
yspd = clamp(yspd + GRAVITY * mass, -TERMINAL, TERMINAL);
#endregion

#region Handle gravity regions
var region_list = ds_list_create();
var num_regions = collision_rectangle_list(bbox_left,bbox_top,bbox_right,bbox_bottom,gravity_region,false,true,region_list,false);
for (var i = 0; i < num_regions; i++) {
	var region = num_regions[| i];
	
	xspd += lengthdir_x(region.gravity_amount * mass, region.gravity_dir);
	yspd += lengthdir_y(region.gravity_amount * mass, region.gravity_dir);
}
ds_list_destroy(region_list);
#endregion