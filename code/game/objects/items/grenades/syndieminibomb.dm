/obj/item/grenade/syndieminibomb
	desc = "A syndicate manufactured explosive used to sow destruction and chaos."
	name = "syndicate minibomb"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "syndicate"
	inhand_icon_state = "flashbang"
	worn_icon_state = "minibomb"
	arm_sound = 'sound/weapons/armbomb.ogg'
	warning = "You prime syndicate minibomb!"
	ex_dev = 1
	ex_heavy = 2
	ex_light = 4
	ex_flame = 2

/obj/item/grenade/syndieminibomb/detonate(mob/living/lanced_by)
	. = ..()
	update_mob()
	qdel(src)

/obj/item/grenade/syndieminibomb/concussion
	name = "HE Grenade"
	desc = "A compact shrapnel grenade meant to devastate nearby organisms and cause some damage in the process. Pull pin and throw opposite direction."
	icon_state = "concussion"
	arm_sound = 'sound/weapons/armbomb.ogg'
	warning = "You prime the HE Grenade!"
	ex_heavy = 2
	ex_light = 3
	ex_flame = 3

/obj/item/grenade/frag
	name = "frag grenade"
	desc = "An anti-personnel fragmentation grenade, this weapon excels at killing soft targets by shredding them with metal shrapnel."
	icon_state = "frag"
	arm_sound = 'sound/weapons/armbomb.ogg'
	warning = "You prime the frag grenade!"
	shrapnel_type = /obj/projectile/bullet/shrapnel
	shrapnel_radius = 4
	ex_heavy = 1
	ex_light = 3
	ex_flame = 4

/obj/item/grenade/frag/mega
	name = "FRAG grenade"
	desc = "An anti-everything fragmentation grenade, this weapon excels at killing anything any everything by shredding them with metal shrapnel."
	shrapnel_type = /obj/projectile/bullet/shrapnel/mega
	shrapnel_radius = 12
	arm_sound = 'sound/weapons/armbomb.ogg'
	warning = "You prime the FRAG grenade!"

/obj/item/grenade/frag/detonate(mob/living/lanced_by)
	. = ..()
	update_mob()
	qdel(src)

/obj/item/grenade/gluon
	desc = "An advanced grenade that releases a harmful stream of gluons inducing radiation in those nearby. These gluon streams will also make victims feel exhausted, and induce shivering. This extreme coldness will also likely wet any nearby floors."
	name = "gluon frag grenade"
	icon = 'icons/obj/grenade.dmi'
	icon_state = "bluefrag"
	inhand_icon_state = "flashbang"
	arm_sound = 'sound/weapons/armbomb.ogg'
	warning = "You prime the gluon frag grenade!"
	var/freeze_range = 4
	var/rad_damage = 350
	var/stamina_damage = 30
	var/temp_adjust = -230

/obj/item/grenade/gluon/detonate(mob/living/lanced_by)
	. = ..()
	update_mob()
	playsound(loc, 'sound/effects/empulse.ogg', 50, TRUE)
	radiation_pulse(src, rad_damage)
	for (var/turf/open/floor/floor in view(freeze_range, loc))
		floor.MakeSlippery(TURF_WET_PERMAFROST, 6 MINUTES)
		for(var/mob/living/carbon/victim in floor)
			victim.adjustStaminaLoss(stamina_damage)
			victim.adjust_bodytemperature(temp_adjust)
	qdel(src)
