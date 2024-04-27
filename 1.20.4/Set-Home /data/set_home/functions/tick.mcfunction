# - Sethome
execute as @a[scores={SetHome=1..}] at @s run execute store result score @s SetHomeX run data get entity @s Pos[0] 1
execute as @a[scores={SetHome=1..}] at @s run execute store result score @s SetHomeY run data get entity @s Pos[1] 1
execute as @a[scores={SetHome=1..}] at @s run execute store result score @s SetHomeZ run data get entity @s Pos[2] 1
execute as @a[scores={SetHome=1..}] at @s run execute store result score @s SetHomeYaw run data get entity @s Rotation[0] 1
execute as @a[scores={SetHome=1..}] at @s run execute store result score @s SetHomePitch run data get entity @s Rotation[1] 1
execute as @a[scores={SetHome=1..}] at @s if entity @s[predicate=set_home:in_over_world] run scoreboard players set @s SetHomeDimension 1
execute as @a[scores={SetHome=1..}] at @s if entity @s[predicate=set_home:in_nether] run scoreboard players set @s SetHomeDimension 2
execute as @a[scores={SetHome=1..}] at @s if entity @s[predicate=set_home:in_end] run scoreboard players set @s SetHomeDimension 3
execute as @a[scores={SetHome=1..}] at @s run title @s actionbar {"text":"Home Set!","color":"yellow","bold":true}
execute as @a[scores={SetHome=1..}] at @s run particle totem_of_undying ~ ~2 ~ 0.01 0.01 0.01 0.5 50 normal @s
execute as @a[scores={SetHome=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
execute as @a[scores={SetHome=1..}] at @s run scoreboard players reset @s SetHome

# - Teleport
execute as @a[scores={Home=1..}] at @s run execute store result storage sethome:cordinates X int 1 run scoreboard players get @s SetHomeX
execute as @a[scores={Home=1..}] at @s run execute store result storage sethome:cordinates Y int 1 run scoreboard players get @s SetHomeY
execute as @a[scores={Home=1..}] at @s run execute store result storage sethome:cordinates Z int 1 run scoreboard players get @s SetHomeZ
execute as @a[scores={Home=1..}] at @s run execute store result storage sethome:cordinates Yaw int 1 run scoreboard players get @s SetHomeYaw
execute as @a[scores={Home=1..}] at @s run execute store result storage sethome:cordinates Pitch int 1 run scoreboard players get @s SetHomePitch
execute as @a[scores={Home=1..}] at @s if entity @s[scores={SetHomeDimension=1}] run execute in overworld run function set_home:teleport_macro with storage sethome:cordinates
execute as @a[scores={Home=1..}] at @s if entity @s[scores={SetHomeDimension=2}] run execute in the_nether run function set_home:teleport_macro with storage sethome:cordinates
execute as @a[scores={Home=1..}] at @s if entity @s[scores={SetHomeDimension=3}] run execute in the_end run function set_home:teleport_macro with storage sethome:cordinates
execute as @a[scores={Home=1..}] at @s run particle totem_of_undying ~ ~2 ~ 0.01 0.01 0.01 0.5 50 normal @s
execute as @a[scores={Home=1..}] at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
execute as @a[scores={Home=1..}] at @s run title @s actionbar {"text":"Teleported To Home!","color":"yellow","bold":true}
execute as @a[scores={Home=1..}] at @s run scoreboard players reset @s Home


# - Enable Triggers
scoreboard players enable @a SetHome
scoreboard players enable @a Home

