;
;
var Canvas;
Canvas = function() {
  return Object.extend({}, __XNA__Canvas, {
    withTransform: function(matrix, block) {
      this.begin(matrix.a, matrix.b, matrix.c, matrix.d, matrix.tx, matrix.ty);
      try {
        block(this);
      } finally {
        this.end();
      }
      return this;
    }
  });
};;
;
