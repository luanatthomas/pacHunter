extends Node2D

onready var tween := $Tween

var posInit : Vector2 = Vector2(0,0)
var posEnd : Vector2 = Vector2(0,0)

onready var line := $Line2D
onready var serra := $Serra

func setPointInit(pointInit: Vector2):
	posInit = pointInit
	line.add_point(pointInit)


func setPointEnd(pointEnd: Vector2):
	posEnd = pointEnd
	line.add_point(pointEnd)

func startTween():
	print("SERRA")
	print(posInit)
	print(posEnd)
#	tween.repeat = true
	tween.interpolate_property($Serra, "position", posInit, posEnd, 1, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.interpolate_property($Serra, "rotation", 0, -180, 1, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _process(delta):
	if !tween.is_active():
		startTween()

func _on_tween_completed(object, key):
	if key == ":position":
		var temp = posEnd
		posEnd = posInit
		posInit = temp

		print("ACABOU")
		print(posInit)
		print(posEnd)
		startTween()
	
