extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var width
var platform = preload("res://instance/Platform.tscn")
var platform_fail = preload("res://instance/PlatformFail.tscn")
var nest = preload("res://instance/nest.tscn")
var platmovform = preload("res://instance/Platform_movible.tscn")
var sheet = preload("res://Scenes/sheet.tscn")
var level_1 = "res://Scenes/principal_level_1.tscn"

func _ready():
	width = get_viewport().get_visible_rect().size.x
	randomize()
	var y = 0
	var cont = 0
	while y > -3000:
		print (cont)
		if cont == 10:
			var new_platform = platmovform.instance()
			new_platform.set_global_position(Vector2(rand_range(-width/2,width/2),y))
			add_child(new_platform)
			y-= rand_range(10,210)
			cont = 0
		else:
			var new_platform = platform.instance()
			new_platform.set_global_position(Vector2(rand_range(-width/2,width/2),y))
			add_child(new_platform)
			cont = cont + 1
			if fmod(cont, 3) == 0:
				var new_sheet = sheet.instance()
				new_sheet.set_global_position(Vector2(rand_range(-width/2,width/2),y))
				var scale = rand_range(0.5,1.1)
				new_sheet.get_node("sheet_sprite").transform.scaled(Vector2(0.1,0.1))
				add_child(new_sheet)
				var new_platform_fail = platform_fail.instance()
				new_platform_fail.set_global_position(Vector2(rand_range(-width/2,width/2),y))
				add_child(new_platform_fail)
			y-= rand_range(10,210)
	var new_nest= nest.instance()
	new_nest.set_global_position(Vector2(rand_range(-width/2,width/2), -3001))
	add_child(new_nest)

func _on_Timer_timeout():
	print("time")


func restart():
	get_tree().change_scene(level_1)


#func _process(delta):
	
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
