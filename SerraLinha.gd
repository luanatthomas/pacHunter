extends Node2D

onready var tween := $Tween

var posInit : Vector2 = Vector2(0,0)
var posEnd : Vector2 = Vector2(0,0)

signal pacmanColide

onready var line := $Line2D
onready var serra := $Serra

func setPointInit(pointInit: Vector2):
	posInit = pointInit
	line.add_point(pointInit)


func setPointEnd(pointEnd: Vector2):
	posEnd = pointEnd
	line.add_point(pointEnd)

func startTween():
	tween.interpolate_property($Serra, "position", posInit, posEnd, 1.5, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()

func _ready():
	line.add_point(Vector2(0,0))

func _process(delta):	
	serra.rotate(0.3)
	if !tween.is_active():
		startTween()
		var temp = posEnd
		posEnd = posInit
		posInit = temp


func _on_Serra_body_entered(body):
	if body.name == "Pacman":
		emit_signal("pacmanColide")
