#
#  Copyright(C) 2012, Tim Detwiler <timdetwiler@gmail.com>
#

class Window
  constructor: (canvas) ->
    @_canvas = canvas
    @_context = canvas.getContext("2d")

  draw: () ->
    @_context.fillStyle = "#FF0000"
    @_context.fillRect 0, 0, 640, 480

exports.Window = Window
