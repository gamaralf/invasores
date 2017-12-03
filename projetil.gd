extends Area2D

var veloc = 0
var trajetoria = Vector2()
var dano = 1

func _ready():
	$Visibilidade.connect("screen_exited", self, "_on_projetil_saiu_da_tela")
	
func iniciar_em(pos, dir):
	position = pos
	rotation = dir
	trajetoria = Vector2(veloc, 0).rotated(dir)

func _physics_process(delta):
	position += trajetoria * delta

func _on_projetil_saiu_da_tela():
	queue_free()

#func _on_projetil_body_entered(body):
