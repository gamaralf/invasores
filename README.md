# Invasores
Aprendendo Godot com um clone do Space Invaders.

Baseado no [Space Rocks do Kids Can Code](https://github.com/kidscancode/space_rocks).

## Mudanças
- Estou usando ```KinematicBody2D``` para o personagem e inimigo em vez do ```Area2D``` que o original usa.
- Criei um script (```ui.gd```) que é carregado automaticamente que tem umas funções para deixar o código um pouco mais limpo. Exemplo: em vez de ```Input.is_action_pressed("ui_right")```, use ```UI.direita()```.
- Em vez de usar diretórios para "arte", "sons", criei um diretório por elemento/funcionalidade. Exemplo: o diretório ```jogador``` tem todo os arquivos para o jogador funcionar, como imagens, sons e scripts.

## Afazeres
- [ ] Criar diretórios de elementos: arte_comum, explosao, projetil
