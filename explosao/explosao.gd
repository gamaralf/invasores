extends AnimatedSprite

func _ready():
	pass
	
func explodir(pos, tipo):
	position = pos
	scale = Vector2(0.8, 0.8)
	animation = tipo
	$SomExplosao.play()
	play()
	
func _on_explosao_animation_finished():
	queue_free()
