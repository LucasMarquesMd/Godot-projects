extends Node2D

@onready var player := $player as CharacterBody2D
@onready var camera := $Camera as Camera2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.follow_camera(camera)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
