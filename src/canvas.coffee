Canvas = ->
  transformStack = []
  currentTransform = Matrix.IDENTITY

  clear: ->
    __XNA__Canvas.clear()

  fill: (color) ->
    #TODO: Pass color through
    __XNA__Canvas.fill()

  drawImage: (image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) ->
    # TODO: Get matrix scale and rotation components and pass them through
    {x, y} = currentTransform.transformPoint(Point(destX, destY))

    __XNA__Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, x, y, destWidth, destHeight)

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

Sprite.loadByName = (name, callback) ->
  img = __XNA__Sprite.loadByName(name);

  Sprite(img, 0, 0, img.Width, img.Height);

