	if (sprite_index == spr_sushi) {
		sprite_index = spr_salmon
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient1 = sprite_index
	}	if (sprite_index == spr_steakPotatoDish) {
		sprite_index = spr_bakedPotato
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient1 = sprite_index
	}	if (sprite_index == spr_sandwhich) {
		sprite_index = spr_chicken
		image_xscale = 0.5
		image_yscale = 0.5
		ingredient1 = sprite_index
	}
	
if (!fully_cut) {
if (mouse_check_button_pressed(mb_left)) {
	if (position_meeting(mouse_x, mouse_y, id)) {
		cut_count++;
		
		image_xscale *= 0.8
		image_yscale *= 1.1


		if (ingredient1 == spr_salmon) {
		
		if (cut_count == 1) {
			sprite_index = spr_salmonHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count == 2) {
			sprite_index = spr_salmonHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_salmonHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }

		if (ingredient1 == spr_bakedPotato) {
			
		if (cut_count == 1) {
			sprite_index = spr_bakedPotatoHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if ( cut_count == 2) {
			sprite_index = spr_bakedPotatoHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_bakedPotatoHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }
		
		if (ingredient1 == spr_chicken) {
			
		if (cut_count == 1) {
			sprite_index = spr_chickenHalf
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count == 2) {
			sprite_index = spr_chickenHalf2
			image_xscale *= 0.8; image_yscale *= 1.1
		} else if (cut_count >= 3) {
			sprite_index = spr_chickenHalf3
			fully_cut = true
			image_xscale = 0.5
			image_yscale = 0.5
		}
	  }
	  
	  
	  if (fully_cut) {
		  if (instance_exists(obj_randomIngredient2) && obj_randomIngredient2.fully_cut) {
			  instance_destroy(obj_randomIngredient2)
			  instance_destroy()
			  
			  instance_create_layer(x, y, layer, obj_randomDish)
		  }
	  }
	  
	  
	 }
   }
 }