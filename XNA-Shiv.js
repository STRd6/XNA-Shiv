;
;
var Canvas;
Canvas = function() {
  return {
    __proto__: Canvas.prototype
  };
};
Canvas.prototype = {
  drawImage: function() {
    return __XNA__Canvas.drawImage.apply(this, arguments);
  },
  withTransform: function(matrix, block) {
    __XNA__Canvas.begin(matrix.a, matrix.b, matrix.c, matrix.d, matrix.tx, matrix.ty);
    try {
      block(this);
    } finally {
      __XNA__Canvas.end();
    }
    return this;
  }
};;
;
