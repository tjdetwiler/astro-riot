#
#  Copyright(C) 2012, Tim Detwiler <timdetwiler@gmail.com>
#

Window = require('./window').Window

class Game
  constructor: (canvas) ->
    @_window = new Window canvas
    @_run_timer = null
    @_update_period = 50

  update: () -> null
  draw: () -> @_window.draw()

  run: () ->
    cb = () =>
      @update()
      @draw()
    @_run_timer = setInterval cb, @_update_period
  
exports.Game = Game
