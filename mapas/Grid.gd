extends Node2D

onready var gridLines := $GridLines
onready var grid := $Grid
onready var pacman:  KinematicBody2D = $Pacman 

onready var lblUp := $LabelUp
onready var lblDown := $LabelDown
onready var lblLeft := $LabelLeft
onready var lblRight := $LabelRight
onready var lblStop := $LabelStop

export var actualLevel : int

export (PackedScene) var blockLeft : PackedScene
export (PackedScene) var blockRight : PackedScene
export (PackedScene) var blockUp : PackedScene
export (PackedScene) var blockDown : PackedScene
export (PackedScene) var blockStop : PackedScene

#export (PackedScene) var backScene : PackedScene

var backScene = load("res://Main.tscn")
var nextScene = ""

#em qualquer fase, quando o pacman morrer, vai para a tela de GameOver (gameFail)
#de 1 a 9, quando pacman ganhar, vai para a próxima fase (1>2 2>3 3>4 ...) (levelX)
#na fase 10, quando pacman ganhar, vai para tela de GameSuccess (gameSuccess)


export var qntDown : int
export var qntUp : int
export var qntLeft : int
export var qntRight : int
export var qntStop : int

export var qntGhost : int

var selectedBlock := 0

func _process(delta: float):
	
	var timeLeft = $Timer.time_left 
	var mins = int(timeLeft)/60
	var secs = int(timeLeft) - (60*mins)
	
	$TimerLabel.text = String(mins)+":"+String(secs)
	
	if mins < 1 and secs <= 30:
		$TimerLabel.add_color_override("font_color", Color(1,0,0,1))
	
	if mins == 0 and secs == 0:
		print("Acabou o tempo")
		levelFail()
	
	print(qntGhost)
	if qntGhost <= 0:
		levelSuccess()
	
	lblLeft.text = str(qntLeft)
	lblStop.text = str(qntStop)
	lblRight.text = str(qntRight)
	lblUp.text = str(qntUp)
	lblDown.text = str(qntDown)
	var worldSize = grid.world_to_map(get_viewport().size)
	var quantColumns = worldSize.y - 1
	var quantLines = worldSize.x - 1

	gridLines.clear()
#	for l in range(1, quantLines):
#		for c in range(1, quantColumns):
#			gridLines.set_cellv(Vector2(l, c), 0)

	var mouse_position = get_viewport().get_mouse_position()
	var cell = grid.world_to_map(mouse_position)
	var tile_pos = grid.map_to_world(grid.world_to_map(mouse_position))
	
#	print(grid.get_cellv(grid.world_to_map(mouse_position)))
	
#	if cell.x > 0 && cell.x < quantLines && cell.y > 0 && cell. y < quantColumns && get_cellv(mouse_position) == 27:
	if isValidCell(mouse_position):
		gridLines.set_cellv(cell, selectedBlock)

func _input(event):
	if event is InputEventKey:
		if (event.is_action_pressed("up")):
			selectedBlock = 5
		elif event.is_action_pressed("down"):
			selectedBlock = 2
		elif event.is_action_pressed("left"):
			selectedBlock = 3
		elif event.is_action_pressed("right"):
			selectedBlock = 4
		elif event.is_action_pressed("block"):
			selectedBlock = 1
		elif event.is_action_pressed("escape"):
			selectedBlock = 0
	elif event is InputEventMouseButton:
		if event.pressed && isValidCell(event.position):
			
			match selectedBlock:
				1:
					if qntStop == 0: return
					var b = blockStop.instance()
					var pos = grid.map_to_world(grid.world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("tree_exited", self, "incStop")
					add_child(b)
					qntStop=qntStop-1
				2:
					if qntDown == 0: return
					var b = blockDown.instance()
					var pos = grid.map_to_world(grid.world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_down", pacman, "_on_move_down")
					b.connect("tree_exited", self, "incDown")
					add_child(b)
					qntDown=qntDown-1
				3:
					if qntLeft == 0: return
					var b = blockLeft.instance()
					var pos = grid.map_to_world(grid.world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_left", pacman, "_on_move_left")
					b.connect("tree_exited", self, "incLeft")
					add_child(b)
					qntLeft = qntLeft-1
				4:
					if qntRight == 0: return
					var b = blockRight.instance()
					var pos = grid.map_to_world(grid.world_to_map(event.position))
					b = posInCenter(event.position, b)
					b.connect("move_right", pacman, "_on_move_right")
					b.connect("tree_exited", self, "incRight")
					add_child(b)
					qntRight = qntRight-1
				5:
					if qntUp == 0: return
					var b = blockUp.instance()
					b = posInCenter(event.position, b)
					b.connect("move_up", pacman, "_on_move_up")
					b.connect("tree_exited", self, "incUp")
					add_child(b)
					qntUp = qntUp -1
				
			selectedBlock = 0

func _on_Ghost_tree_exited():
	print("Saiu")
	qntGhost = qntGhost -1

func levelSuccess():
	if actualLevel != 10:
		nextScene = load("res://mapas/Level"+String(actualLevel+1)+".tscn")
	else:
		nextScene = load("res://GameSuccess.tscn")
	get_tree().change_scene_to(nextScene)
	#get_tree().quit()

func levelFail():
	nextScene = load("res://GameOver.tscn")
	get_tree().quit()

func isValidCell(pos: Vector2):
	var gridPos = grid.world_to_map(pos)
	return gridPos.y > 3 && grid.get_cellv(gridPos) == 27 && gridPos != grid.world_to_map(pacman.position)

func incUp():
	qntUp = qntUp + 1

func incDown():
	qntDown = qntDown + 1
	
func incLeft():
	qntLeft = qntLeft + 1
	
func incRight():
	qntRight = qntRight + 1

func incStop():
	qntStop = qntStop + 1
	
func posInCenter(initialPosition, b):
	var pos = grid.map_to_world(grid.world_to_map(initialPosition))
	gridLines.get_cellv(pos)
	b.position.x = pos.x + 30
	b.position.y = pos.y + 30
	
	b.z_index=0
	
	return b

func posGhost(initialPosition, ghost):
	var pos = grid.map_to_world(grid.world_to_map(initialPosition))
	gridLines.get_cellv(pos)
	ghost.position.x = pos.x + 30
	ghost.position.y = pos.y + 30
	
	return ghost

func _on_btn_voltar_pressed():
	pass # Replace with function body.

func _on_btn_back_pressed():
	get_tree().change_scene_to(backScene)
	pass # Replace with function body.
