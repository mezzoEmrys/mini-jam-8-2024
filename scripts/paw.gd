extends Node2D

@export var windup_time : float = 10
var current_windup = 0
@export var cooldown_time : float = 10
var current_cooldown = 0

enum paw_state {COOLDOWN, WINDUP, ATTACK}
var ps = paw_state.COOLDOWN

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ps == paw_state.COOLDOWN:
		current_cooldown += delta
		if current_cooldown >= cooldown_time:
			print("Cooldown Over")
			ps = paw_state.WINDUP
			current_cooldown = 0
	elif ps == paw_state.WINDUP:
		current_windup += delta
		if current_windup >= windup_time:
			print("Windup Over")
			ps = paw_state.ATTACK
			attack()

func attack():
	pass
