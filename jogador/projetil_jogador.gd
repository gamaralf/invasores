extends "res://projetil/projetil.gd"

func _ready():
	connect("body_entered", self, "_on_projetil_body_entered")	
	veloc = -870
	trajetoria = Vector2(0, veloc)
	dano = 1

func iniciar_em(pos):
	.iniciar_em(pos, rotation)
	
func _on_projetil_body_entered(body):	
	if body.has_method("levar_dano") and body.is_in_group("inimigos"):
		queue_free()
		body.levar_dano(dano)
	