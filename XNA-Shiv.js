;
;
var Canvas;
Canvas = function() {
  var currentTransform, transformStack;
  transformStack = [];
  currentTransform = Matrix.IDENTITY;
  return {
    clear: function() {
      return XNA_Canvas.clear();
    },
    createPattern: function() {},
    fill: function(color) {
      return XNA_Canvas.fill();
    },
    fillColor: function() {},
    fillRect: function() {},
    drawImage: function(image, sourceX, sourceY, sourceWidth, sourceHeight, destX, destY, destWidth, destHeight) {
      var x, y, _ref;
      _ref = currentTransform.transformPoint(Point(destX, destY)), x = _ref.x, y = _ref.y;
      XNA_Canvas.drawImage(image, sourceX, sourceY, sourceWidth, sourceHeight, x, y, destWidth, destHeight);
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
var keydown;
keydown = {};
keydown.__defineGetter__("left", function() {
  return XNA_Keyboard.keyDown("Left");
});
keydown.__defineGetter__("right", function() {
  return XNA_Keyboard.keyDown("Right");
});
keydown.__defineGetter__("space", function() {
  return XNA_Keyboard.keyDown("Space");
});;
Sprite.loadByName = function(name, callback) {
  var img;
  img = XNA_Sprite.loadByName(name);
  return Sprite(img, 0, 0, img.Width, img.Height);
};;
;
