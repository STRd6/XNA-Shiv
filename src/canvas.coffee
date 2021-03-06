Canvas = ->
  transformStack = []
  currentTransform = Matrix.IDENTITY
  fillColor = Color("black")

  clear: ->
    XNA_Canvas.clear()

  createPattern: ->
    ;#TODO

  fill: (color) ->
    if color
      this.fillColor(color)

    #TODO: This is terrifying
    r = fillColor.r() & 0xFF
    g = fillColor.g() & 0xFF
    b = fillColor.b() & 0xFF
    a = (fillColor.a() * 0xFF) & 0xFF

    XNA_Canvas.fill(r, g, b, a)

  fillColor: (color) ->
    if color
      fillColor = Color(color)
      return this
    else
      return fillColor

  fillRect: (x, y, width, height) ->
    r = fillColor.r() & 0xFF
    g = fillColor.g() & 0xFF
    b = fillColor.b() & 0xFF
    a = (fillColor.a() * 0xFF) & 0xFF

    {x, y} = currentTransform.transformPoint(Point(x, y))

    XNA_Canvas.fillRect(x, y, width, height, r, g, b, a)

  fillTiledRect: (image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) ->
    {x, y} = currentTransform.transformPoint(Point(destX, destY))

    XNA_Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, x, y, destWidth, destHeight)

    return this

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

