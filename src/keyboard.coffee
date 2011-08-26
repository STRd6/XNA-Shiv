keydown = {}

keydown.__defineGetter__("left", -> XNA_Keyboard.keyDown("Left"))
keydown.__defineGetter__("right", -> XNA_Keyboard.keyDown("Right"))
keydown.__defineGetter__("space", -> XNA_Keyboard.keyDown("Space"))

