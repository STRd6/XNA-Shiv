Canvas = ->
  transformStack = []
  currentTransform = Matrix.IDENTITY
  fillColor = Color("black")

  clear: ->
    XNA_Canvas.clear()

  createPattern: ->
    ;#TODO

  fill: (color) ->
    r = fillColor.r() & 0xFF
    g = fillColor.g() & 0xFF
    b = fillColor.b() & 0xFF
    a = (fillColor.a() * 0xFF) & 0xFF

    XNA_Canvas.fill(r, g, b, a)

  fillColor: (color) ->
    fillColor = Color(color)

  fillRect: (x, y, width, height)->
    r = fillColor.r() & 0xFF
    g = fillColor.g() & 0xFF
    b = fillColor.b() & 0xFF
    a = (fillColor.a() * 0xFF) & 0xFF

    XNA_Canvas.fillRect(x, y, width, height, r, g, b, a)

  drawImage: (image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) ->
    # TODO: Get matrix scale and rotation components and pass them through
    {x, y} = currentTransform.transformPoint(Point(destX, destY))

    XNA_Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, x, y, destWidth, destHeight)

    return this

  withTransform: (matrix, block) ->
    currentTransform = currentTransform.concat(matrix)
    transformStack.push currentTransform

    try
      block(this)
    finally
      transformStack.pop()
      currentTransform = transformStack.last() || Matrix.IDENTITY

    return this

