extends AnimatedSprite2D

# Wir speichern die letzte Richtung, standardmäßig schauen wir nach unten (vorn)
var last_direction = "down"

func _process(_delta: float) -> void:
	var velocity = get_parent().velocity
	
	if velocity.length() > 0:
		# Bestimmen der aktuellen Richtung basierend auf der Geschwindigkeit
		if abs(velocity.x) > abs(velocity.y):
			last_direction = "right" if velocity.x > 0 else "left"
		else:
			last_direction = "down" if velocity.y > 0 else "up"
		
		# Lauf-Animation abspielen
		play("walk_" + last_direction)
	else:
		# Wenn keine Bewegung: Zeige das Standbild der letzten Richtung
		play("idle_" + last_direction)
		stop() # Stoppt die Animation auf dem ersten Frame (Static Frame)
