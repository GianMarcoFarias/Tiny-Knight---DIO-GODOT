extends Node2D

@export var value: int = 0

@onready var label: Label = $Label

func _ready():
	if label != null:
		label.text = str(value)
