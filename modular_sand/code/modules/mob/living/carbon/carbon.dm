/mob/living/carbon/proc/update_hunger_and_thirst_hud()
	if(!client || !hud_used)
		return
	if(hud_used.hunger)
		switch(src.nutrition)
			if(NUTRITION_LEVEL_FULL to INFINITY)
				hud_used.hunger.icon_state = "nutrition0"
			if(NUTRITION_LEVEL_WELL_FED to NUTRITION_LEVEL_FULL)
				hud_used.hunger.icon_state = "nutrition1"
			if(NUTRITION_LEVEL_HUNGRY to NUTRITION_LEVEL_WELL_FED)
				hud_used.hunger.icon_state = "nutrition2"
			if(NUTRITION_LEVEL_STARVING to NUTRITION_LEVEL_HUNGRY)
				hud_used.hunger.icon_state = "nutrition3"
			if(0 to NUTRITION_LEVEL_STARVING)
				hud_used.hunger.icon_state = "nutrition4"
	/* Nostra change
	if(hud_used.thirst)
		switch(get_thirst(src))
			if(THIRST_LEVEL_FULL to INFINITY)
				hud_used.thirst.icon_state = "hydration0"
			if(THIRST_LEVEL_QUENCHED to THIRST_LEVEL_FULL)
				hud_used.thirst.icon_state = "hydration1"
			if(THIRST_LEVEL_THIRSTY to THIRST_LEVEL_QUENCHED)
				hud_used.thirst.icon_state = "hydration2"
			if(THIRST_LEVEL_PARCHED to THIRST_LEVEL_THIRSTY)
				hud_used.thirst.icon_state = "hydration3"
			if(0 to THIRST_LEVEL_PARCHED)
				hud_used.thirst.icon_state = "hydration4"
	*/

//It's here so it doesn't make a big mess on randomverbs.dm,
//also because of this you can proccall it, why would you if you have smite?
/mob/living/proc/pregoodbye(C)
	if(isanimal(C))
		var/mob/living/simple_animal/D = C
		D.toggle_ai(AI_OFF)
	AllImmobility(900, TRUE, TRUE) // Complete 15 minutes of stun, hopefully they shouldn't take that long
	playsound(C, "modular_sand/sound/effects/admin_punish/changetheworld.ogg", 100, FALSE)
	say("Change the world")
	stoplag(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/myfinalmessage.ogg", 100, FALSE)
	say("My final message")
	stoplag(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/goodbye.ogg", 100, FALSE)
	say("Goodbye.")
	stoplag(20)
	playsound(C, "modular_sand/sound/effects/admin_punish/endjingle.ogg", 100, FALSE)
	goodbye()

/mob/living/proc/goodbye() //this must be separate because it's a loop!
	while(alpha >= 10)
		alpha = alpha - 7
		stoplag(1)
	stoplag(2)
	Destroy()
