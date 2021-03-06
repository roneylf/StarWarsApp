# Star Wars App

## Desafio 03

### Considerações

Para este desafio optei por usar uma estrura Modular.

Para o Gerênciamento de Estados usei o Mobx.

Os dados de filmes e personagens bem como os favoritos são carregados do banco, 
toda a vez que o app é inicializado é feito um request na API e os dados são atualizados
caso haja um novo filme ou personagem.

Os dados do Avatar são armazenados na tabela conforme o requisito, no InitState do AvatarPage 
é chamado uma controller que inicia um listener que sempre que o usuário salva o avatar o listener recebe 
a string (Avarar Decode) e armazena no banco.

### Como executar
```
$ mkdir StarWars
$ cd StarWars
$ git clone https://github.com/roneylf/StarWarsApp.git
$ flutter pub get
$ flutter run
```

ou baixe o apk:
  https://github.com/roneylf/StarWarsApp/releases/download/v1.0.0/StarWarsApp.apk
  
O código é compativel com Android e Ios apenas pois o package Sqflite não suporta windows ou web.
### Screenshots
![Tela Filmes](/screenshots/screenshot_01.jpeg?raw=true "Tela Filmes")
![Tela Personagens](/screenshots/screenshot_02.jpeg?raw=true "Tela Personagens")
![Tela Favoritos](/screenshots/screenshot_03.jpeg?raw=true "Tela Favoritos")
![Tela Avatar](/screenshots/screenshot_04.jpeg?raw=true "Tela Avatar")
![Tela WebView](/screenshots/screenshot_05.jpeg?raw=true "Tela WebView")






