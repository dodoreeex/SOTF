extends KinematicBody2D

onready var Inventory = preload("res://scene/inventory.tscn").instance()
var inventory_open = false
export var speed = 50
export var run_speed = 60  # Speed when running
var velocity = Vector2()

func _process(delta):
	# Player movement
	velocity = Vector2()  # Reset velocity
	var current_speed = speed

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if Input.is_action_pressed("ui_run"):
		current_speed = run_speed  # Use run speed when shift is pressed

	velocity = velocity.normalized() * current_speed
	move_and_slide(velocity)

	# Player animation
	if velocity.x > 0:
		$AnimationPlayer.play("right")
	elif velocity.x < 0:
		$AnimationPlayer.play("left")
	elif velocity.y > 0:
		$AnimationPlayer.play("down")
	elif velocity.y < 0:
		$AnimationPlayer.play("up")




