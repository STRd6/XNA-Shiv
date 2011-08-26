Sprite.loadByName = (name, callback) ->
  img = XNA_Sprite.loadByName(name);

  Sprite(img, 0, 0, img.Width, img.Height);

