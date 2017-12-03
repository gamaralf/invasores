extends KinematicBody2D

signal jogador_explodiu
signal nave_atirou

const NAVE_VELOC = 260
export (PackedScene) var Projetil   #onready var projetil = ResourceLoader.load("res://projetil.tscn")
var saude = 1

func _ready():
	$TimerTiro.wait_time = 0.4

func _physics_process (delta):
	var dir = Vector2(0, 0)
	if UI.esquerda():  dir.x += -NAVE_VELOC
	if UI.direita(): dir.x += NAVE_VELOC
	if UI.atirar() and $TimerTiro.get_time_left() == 0:
		atirar()
	move_and_slide(dir)

func atirar():
	$TimerTiro.start()	
	# TODO colocar o som do tiro na cena da bala?
	$SomTiro.play()	
	emit_signal("nave_atirou", Projetil, $Canhao.global_position)

func levar_dano (dano):
	$SomDano.play()
	saude -= dano
	if saude <= 0:
		emit_signal("jogador_explodiu", global_position)
		queue_free()
#	else:
#		$Anim.play("impacto")

#__END__
#	print("Canhao.global/relat position: ", $Canhao.global_position, $Canhao.position)
#	print("Nave.global_position/relat: ", global_position, position)

#	OBS: Ao mudar o main de Node2D para Node, já posso usar
#        $Canhao.global_position em vez de
#        Vector2(position.x, $Canhao.position.y) para saida_projetil
