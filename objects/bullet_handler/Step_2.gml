/// @description Deal bullet damage

var i = 0, j = 0, x1i,y1i,x2i,y2i,ti,di, length = ds_list_size(bullet_list);
for (i = 0; i < length; i += 6) {
    j = 0;
    x1i = i+j++;
    y1i = i+j++;
    x2i = i+j++;
    y2i = i+j++;
    ti = i+j++;
    di = i+j++;
    
    var x1 = bullet_list[| x1i];
    var y1 = bullet_list[| y1i];
    var x2 = bullet_list[| x2i];
    var y2 = bullet_list[| y2i];
    var target_type = bullet_list[| ti];
    var damage = bullet_list[| di];
    var target = collision_circle(x2, y2,
        1, target_type, false, true);
    if (target != noone) {deal_damage(target,damage);}
}