draw_self();

if difference >= -5 && difference <= 5
{
	image_index = 1
}

if difference >= -20 && difference < 5
{
	image_index = 2
}

if difference >= -180 && difference < -20
{
	image_index = 3
}

if difference > 5 && difference <=20
{
	image_index = 4
}

if difference > 20 && difference < 180
{
	image_index = 5
}


// health bar
draw_healthbar(x-20,y+25,x+20,y+30, health, c_black, c_red, c_lime, 0, true, true)

//shield bar
draw_healthbar(x-20,y+25,x+20,y+20, shield * 2, c_black, c_purple, c_aqua, 0, true, true)

// death
if health <= 0
{ 
	
}

// Stall
if speed <= 2
{	draw_set_halign(fa_center)
	draw_text(x,y+50,"STALLED")
}
