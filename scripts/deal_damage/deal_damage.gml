/// @description deal_damage
/// @param target
/// @param damage
var target = argument[0];
var damage = argument[1];

with (target) {
    hp -= damage;
}
