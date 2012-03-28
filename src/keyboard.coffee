keydown = {}

["left right up down space"].split(" ").each (key) ->
  keydown.__defineGetter__(key, -> XNA_Keyboard.keyDown(key.capitalize()))

["abcdefghijklmnopqrstuvwxyz"].split('').each (key) ->
  keydown.__defineGetter__(key, -> XNA_Keyboard.keyDown(key.toUpperCase()))
