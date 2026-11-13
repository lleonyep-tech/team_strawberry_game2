
	if (sprite_index == spr_sushi) {
		sprite_index = spr_seaweedRice
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient2 = sprite_index
	}	if (sprite_index == spr_steakPotatoDish) {
		sprite_index = spr_steak
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient2 = sprite_index
	}	if (sprite_index == spr_sandwhich) {
		sprite_index = spr_tomato
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient2 = sprite_index
	}
	
	if (!fully_cut) {
if (mouse_check_button_pressed(mb_left)) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		cut_count++;
		


		if (ingredient2 == spr_seaweedRice) {
			
		if (cut_count == 1) {
			sprite_index = spr_seaweedRiceHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count == 2) {
			sprite_index = spr_seaweedRiceHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_seaweedRiceHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }

		if (ingredient2 == spr_steak) {
			
		if (cut_count == 1) {
			sprite_index = spr_steakHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count == 2) {
			sprite_index = spr_steakHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_steakHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }
		
		if (ingredient2 == spr_tomato) {
			
		if (cut_count == 1) {
			sprite_index = spr_tomatoHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count == 2) {
			sprite_index = spr_tomatoHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_tomatoHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }
	  
	  	  if (fully_cut) {
		  if (instance_exists(obj_randomIngredient1) && obj_randomIngredient1.fully_cut) {
			  instance_destroy(obj_randomIngredient1)
			  instance_destroy()
			  instance_create_layer(x, y, layer, obj_randomDish)
		  }
	  }
	  
	  
	 }
   }
 }