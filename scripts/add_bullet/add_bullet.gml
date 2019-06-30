/// @description add_bullet()
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param target
/// @param damage
var i = 0;
var x1 = argument[i++];
var y1 = argument[i++];
var x2 = argument[i++];
var y2 = argument[i++];
var target = argument[i++];
var damage = argument[i++];

with (bullet_handler) {
    ds_list_add(bullet_list,x1,y1,x2,y2,target,damage);
}
