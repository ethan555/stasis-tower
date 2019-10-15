///@description add_particle();
///@param type
///@param x
///@param y
///@param number
var i = 0;
var type = argument[i++];
var xx = argument[i++];
var yy = argument[i++];
var number = argument[i++];
if(part_system_exists(particle_system)) {
    part_particles_create(particle_system,xx,yy,type,number);
}
