draw_self();

if image_difference < 10
{
	image_index = 0
}

if image_difference >= 10 && image_difference < 30
{
	image_index = 3
}

if image_difference >= 30 && image_difference < 180
{
	image_index = 4
}

if image_difference > -30 && image_difference < -10
{
	image_index = 1
}

if image_difference <= -30 && image_difference > -180
{
	image_index = 2
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
