extends Node

export (PackedScene) var Explosao

signal fim_de_jogo

onready var pontuacao = 0

func _ready():
	$Nave.connect("nave_atirou", self, "_on_nave_atirou")
	$Nave.connect("jogador_explodiu", self, "_on_jogador_explodiu")
	$Inimigo.connect("inimigo_explodiu", self, "_on_inimigo_explodiu")
	$Inimigo.connect("inimigo_atirou", self, "_on_inimigo_atirou")

func _on_nave_atirou (projetil, pos):
	var p = projetil.instance()
	p.iniciar_em(pos)
	add_child(p)

func _on_inimigo_explodiu (pos, pontos):
	var expl = Explosao.instance()
	add_child(expl)
	expl.explodir(pos, "sonica")
	pontuacao += pontos
	$Hud.pontuacao(pontos)	

func _on_jogador_explodiu (pos):
	var expl = Explosao.instance()
	add_child(expl)
	expl.explodir(pos, "sonica")
	emit_signal("fim_de_jogo")
	$Hud.fim_de_jogo()

func _on_inimigo_atirou (projetil, pos):
	atirar(projetil, pos)

func atirar (projetil, pos):
	var p = projetil.instance()
	p.iniciar_em(pos)
	add_child(p)
	pass
	