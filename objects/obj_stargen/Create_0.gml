spx1 = 0;
y1 = 0;
x2 = 256;
y2 = 240;

stars = 12;

for(i = 0; i < stars; i++){
	instance_create_depth(x1+random(x2),y1+random(y2),depth,obj_stars);
}