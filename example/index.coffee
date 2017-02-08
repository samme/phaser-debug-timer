"use strict"

game = null
gui = null

preload = ->
  @load.baseURL = 'http://examples.phaser.io/assets/'
  @load.crossOrigin = 'anonymous'
  @load.image 'picture1', 'pics/cougar_sanity_train.png'
  @load.image 'picture2', 'pics/cougar-face_of_nature.png'
  @load.image 'picture3', 'pics/destop-rewarding.png'
  @load.image 'picture4', 'pics/unknown-the_starwars_pic.png'
  return

create = ->
  pic1 = @add.sprite(640, 0  , 'picture1')
  pic2 = @add.sprite(640, 128, 'picture2')
  pic3 = @add.sprite(640, 256, 'picture3')
  pic4 = @add.sprite(640, 384, 'picture4')
  pics = [pic1, pic2, pic3, pic4]
  i = 0
  pics.forEach (pic) ->
    pic.scale.set 0.5
    pic.visible = false
    game.time.events.add 1000 + i * 1000, showPicture, this, pic
    i++
    return
  {events} = game.time
  gui = new dat.GUI
  for methodName in ["pause", "removeAll", "resume", "start", "stop"]
    gui.add events, methodName
  for propName in ["autoDestroy"]
    gui.add(events, propName).listen()
  return

update = ->
  # text.text = "Events: " + @time.events.length;
  return

render = ->
  {debug} = game
  x = 20
  y = 0

  debugText 'game.debug.timerEvents(null, x, y)', x, y += 20
  debug.timerEvents null, x, y += 20

  debugText 'game.debug.timerNextEvent(null, x, y)', x, y += 200
  debug.timerNextEvent null, x, y += 20

  debugText 'game.debug.timerElapsed(null, x, y)', x, y += 100
  debug.timerElapsed null, x, y += 20

  debugText 'game.debug.timer(game.time.events, x, y) [built-in]', x, y += 100
  debug.timer game.time.events, x, y += 20
  return

debugText = (text, x, y, color = '#999', font = game.debug.font) ->
  game.debug.text text, x, y, color, font
  return

showPicture = (pic) ->
  pic.visible = true
  event = game.time.events.add 4000, removePicture, this, pic
  event.name = "show #{pic.key}"
  return

removePicture = (pic) ->
  pic.visible = false
  event = game.time.events.add 4000, showPicture, this, pic
  event.name = "hide #{pic.key}"
  return

game = new (Phaser.Game)(800, 600, Phaser.CANVAS, 'phaser-example',
  preload: preload
  create: create
  update: update
  render: render)

