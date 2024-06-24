extends Node

@export var speed: float = 1

var enemy: Enemy
var sprite: AnimatedSprite2D


func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")


func _physics_process(delta: float) -> void:
	# Ignorar GameOver
	if GameManager.is_game_over: return
	
	# Calcular direção
	if GameManager.player_position != Vector2.ZERO:
		var player_position = GameManager.player_position
		var difference = player_position - enemy.position
		
		# Movimento
		enemy.velocity = difference.normalized() * speed * 100.0 

		# Girar sprite
		if difference.x > 0:
			sprite.flip_h = false
		elif difference.x < 0:
			sprite.flip_h = true
