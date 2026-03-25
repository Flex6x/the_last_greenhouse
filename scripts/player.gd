extends CharacterBody2D

const SPEED = 180.0

func _physics_process(_delta: float) -> void:
	# Wir nutzen get_vector für 4-Wege-Eingaben (normiert die Diagonale automatisch)
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()
