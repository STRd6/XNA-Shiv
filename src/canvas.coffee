Canvas = ->
  __proto__: Canvas::

Canvas:: =
  drawImage: ->
    __XNA__Canvas.drawImage.apply(this, arguments)

    return this

  withTransform: (matrix, block) ->
    __XNA__Canvas.begin(
      matrix.a,
      matrix.b,
      matrix.c,
      matrix.d,
      matrix.tx,
      matrix.ty
    )

    try
      block(this)
    finally
      __XNA__Canvas.end()

    return this

