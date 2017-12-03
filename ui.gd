extends Node

func direita ():
	return Input.is_action_pressed("ui_right")

func esquerda ():
	return Input.is_action_pressed("ui_left")
	
func atirar ():
	return Input.is_action_pressed("atirar")
	
func exibir_mensagem (msg):
	pass
	
func debug(msg):
	print(msg)	