var App;
App = {
  "directories": {
    "animations": "animations",
    "data": "data",
    "entities": "entities",
    "images": "images",
    "lib": "lib",
    "sounds": "sounds",
    "source": "src",
    "test": "test",
    "tilemaps": "tilemaps"
  },
  "width": 480,
  "height": 320,
  "library": false,
  "main": "main",
  "wrapMain": true,
  "hotSwap": true,
  "name": "XNA Shiv"
};;
;
var Canvas;
Canvas = function() {
  return {
    __proto__: Canvas.prototype
  };
};
Canvas.prototype = {
  withTransform: function(matrix, block) {
    this.begin(matrix.a, matrix.b, matrix.c, matrix.d, matrix.tx, matrix.ty);
    try {
      block(this);
    } finally {
      this.end();
    }
    return this;
  }
};;
App.entities = {};;
;$(function(){ undefined });