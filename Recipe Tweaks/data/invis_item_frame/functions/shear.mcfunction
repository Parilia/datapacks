execute at @e[predicate=invis_item_frame:shearable, limit=1, sort=nearest] run playsound entity.sheep.shear block @a ~ ~ ~
data modify entity @e[predicate=invis_item_frame:shearable, limit=1, sort=nearest] Invisible set value 1b
advancement revoke @s only invis_item_frame:shear_check
