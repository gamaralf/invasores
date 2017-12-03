extends CanvasLayer

func _ready ():
	inicio_de_jogo()

func exibir_mensagem (msg):
	$TimerMensagem.stop()	
	$Mensagem.text = msg
	$Mensagem.show()
	$TimerMensagem.wait_time = 3.3
	$TimerMensagem.start()
	$TimerMensagem.connect("timeout", self, "on_timeout_mensagem")	

func on_timeout_mensagem ():
	$Mensagem.hide()
	$Mensagem.text = ""

func pontuacao (p):
	$Pontuacao.text = "%04d" % p

func inicio_de_jogo ():
	pontuacao(0)
	exibir_mensagem("Manda brasa!")

func fim_de_jogo ():
	exibir_mensagem("Acabou! Tenta de novo")
