Canvas = ->
  transformStack = []
  currentTransform = Matrix.IDENTITY

  drawImage: (image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) ->
    # TODO: Get matrix scale and rotation components and pass them through
    [destX, destY] = currentTransform.transformPoint(Point(destX, destY))

    __XNA__Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight)

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

