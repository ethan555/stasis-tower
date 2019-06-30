/// @description Go to entrance
if (instance_exists(entrance)) {
    with (entrance) {
        if (last_room == other.last_room && door_number = other.door_number) {
            other.x = x;
            other.y = y;
        }
    }
}

// Update last room
last_room = room;
