extends KinematicBody2D

signal inimigo_explodiu
signal inimigo_atirou

export (PackedScene) var Projetil   #onready var projetil = ResourceLoader.load("res://projetil.tscn")

const INIMIGO_VELOC = 1.2

var saude = 2
var velocidade = 150
var direcao = Vector2(velocidade, 0)
var pontos = 10
var interv_tiro = 0.8

func _ready ():
	$TimerTiro.wait_time = 2 # TODO: vary by level
	$TimerTiro.start()
	$TimerAtirar.wait_time = interv_tiro
	$TimerAtirar.connect("timeout", self, "_on_timeout_atirar")
	$"/root/Main".connect("fim_de_jogo", self, "_on_fim_de_jogo")	
	$TimerAtirar.start()
	pass
	
func _physics_process (delta):
	var d = move_and_collide(direcao *  delta * INIMIGO_VELOC)
	if d && d.collider.is_in_group("limites"):  direcao.x *= -1

#	var d = move_and_slide(direcao)	
#	if d == direcao:  return  # andou sem bater
#	var colisor = get_slide_collision(0).collider
#	if colisor.is_in_group("limites"):  direcao.x *= -1
	
func levar_dano (dano):
	$SomDano.play()
	saude -= dano
	if saude <= 0:
		emit_signal("inimigo_explodiu", global_position, pontos)
		queue_free()
	else:
		$Anim.play("impacto")

func _on_timeout_atirar ():
	$TimerAtirar.start()	
	# TODO colocar o som do tiro na cena da bala?
	$SomTiro.play()	
	emit_signal("inimigo_atirou", Projetil, global_position)

func _on_fim_de_jogo ():
	$TimerTiro.stop()
	$TimerAtirar.stop()
	hide()