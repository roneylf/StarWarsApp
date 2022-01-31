# Star Wars App

## Desafio 03

### Considerações

Para este desafio optei por usar uma estrura Modular.

Para o Gerênciamento de Estados usei o Mobx.

Os dados de filmes e personagens bem como os favoritos são carregados do banco, 
toda a vez que o app é inicializado é feito um request na API e os dados são atualizados
caso haja um novo filme ou personagem.

Os dados do Avatar são armazenados na tabela conforme o requisito, no InitState do AvatarPage 
é chamado uma controller que inicia um listener que sempre que o usuário salva o avatar olistener recebe 
o string e armazena no banco.

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
  
O código é compativel com Android e Ios apenas pois o package Sqflite não suporta windows ou web






