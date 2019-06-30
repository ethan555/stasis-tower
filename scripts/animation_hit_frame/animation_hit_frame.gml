/// @description animation_hit_frame(frame)
/// @param frame
/*
    Returns true if an animation hits a specific
    frame. You must have a positive animation speed.
*/

var frame = argument[0]; // The frame to check for
var result = false;
if (image_speed > 0)
    result = (image_index >= frame - image_speed) && (image_index < frame);//(image_index >= frame+1 - image_speed) && (image_index < frame+1);
else
    result = (image_index <= frame - image_speed) && (image_index > frame);
return result;
