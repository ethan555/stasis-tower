/// @description Setup Particle System
globalvar particle_system, spark, smoke, smoke2;
particle_system = part_system_create();
// Spark particle, falls and disappears
spark = part_type_create();
part_type_sprite(spark,spark_sp,false,false,false);
part_type_life(spark,30,30);
part_type_direction(spark,0,359.99,.01,0);
part_type_speed(spark,5,10,.01,0);
part_type_orientation(spark,0,0,.01,0,true);
part_type_gravity(spark,1,270);
part_type_alpha2(spark,1,.25);

// Smoke particle, rises and disappears
smoke = part_type_create();
part_type_sprite(smoke,smoke_sp,false,false,false);
part_type_life(smoke,60,60);
part_type_direction(smoke,80,100,.01,0);
part_type_speed(smoke,0,5,.01,0);
part_type_gravity(smoke,.1,90);
part_type_alpha2(smoke,1,0);

// Stationary Smoke particle, rises and disappears
smoke2 = part_type_create();
part_type_sprite(smoke2,smoke_sp,false,false,false);
part_type_life(smoke2,60,60);
part_type_direction(smoke2,0,359,.01,0);
part_type_speed(smoke2,0,.5,.01,0);
part_type_gravity(smoke2,.01,90);
part_type_alpha2(smoke2,1,0);
