/// @description shoot_weapon()
/// @param type
var type = argument[0];

switch(type) {
    case GUN:
        gun_shoot();
        break;
    case MISSILE:
        break;
    default:
        break;
}