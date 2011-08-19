;
;
var Canvas;
Canvas = function() {
  var currentTransform, transformStack;
  transformStack = [];
  currentTransform = Matrix.IDENTITY;
  return {
    drawImage: function(image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) {
      var _ref;
      _ref = currentTransform.transformPoint(Point(destX, destY)), destX = _ref[0], destY = _ref[1];
      __XNA__Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight);
      return this;
    },
    withTransform: function(matrix, block) {
      currentTransform = currentTransform.concat(matrix);
      transformStack.push(currentTransform);
      try {
        block(this);
      } finally {
        transformStack.pop();
        currentTransform = transformStack.last() || Matrix.IDENTITY;
      }
      return this;
    }
  };
};;
;
