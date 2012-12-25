Game = require('./ar/game').Game
$ = window.jQuery

class DemoGame extends Game
  update: () -> console.log "Updating"
  #draw: () -> console.log "Drawing"

main = () ->
  canvas = $("#canvas")[0]
  console.log canvas
  game = new DemoGame canvas
  game.run()

main()
