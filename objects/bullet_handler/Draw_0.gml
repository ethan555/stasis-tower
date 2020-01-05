/// @description draw bullets

var i = 0, j = 0, x1i,y1i,x2i,y2i,ti,di, length = ds_list_size(bullet_list);
for (i = length - 6; i >= 0; i -= 6) {
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
    
    draw_set_color(c_white);
    draw_line(x1,y1,x2,y2);
    repeat(6) {
        ds_list_delete(bullet_list,i);
    }
}
