{Phaser} = this

{SECOND} = Phaser.Timer

{abs} = Math

COLOR_RUNNING        = '#2cc631'
COLOR_PAUSED         = '#fed609'
COLOR_EXPIRED        = '#fc6f16'
COLOR_PENDING_DELETE = '#fb2729'
COLOR_OTHER          = '#999999'

timerColor = (timer) ->
  switch
    when timer.paused  then return COLOR_PAUSED
    when timer.running then return COLOR_RUNNING
    when timer.expired then return COLOR_EXPIRED
    else                    return COLOR_OTHER
  return

Phaser.Utils.Debug::timerElapsed = (timer = this.game.time.events, x, y, label) ->
  label ?= @timerName timer

  {ms, seconds} = timer

  @text (if label then "#{label}: " else "") +
        (if abs(seconds) < 1 then "#{ms}ms" else "#{~~seconds}s"),
        x, y, timerColor(timer), @font

  return

Phaser.Utils.Debug::timerName = (timer) ->
  if timer is @game.time.events then "game.time.events" else timer.name

Phaser.Utils.Debug::timerNextEvent = (timer = this.game.time.events, x, y, width = 100, height = 20, label) ->
  label ?= @timerName timer

  if label
    @text "#{label} (#{timer.length})", x, y, timerColor(timer), @font
    y += height

  if timer.length
    @timerEvent timer.events[0], x, y, width, height
  else
    @text "No timer events", x, ~~(y + height / 2), @color, @font

  return

_rect = new Phaser.Rectangle

Phaser.Utils.Debug::timerEvent = (event, x, y, width = 100, height = 20, label = event.name) ->
  now = event.timer._now
  color = timerColor event.timer
  rectColor = color
  textColor = @color

  if event.pendingDelete
    rectColor = textColor = COLOR_PENDING_DELETE

  _rect.setTo x, y, ~~((event.tick - now) * width / SECOND), height
  @geom _rect, rectColor

  if label
    @text label, x, y + ~~(0.5 * height), textColor, @font

  return

Phaser.Utils.Debug::timerEvents = (timer = this.game.time.events, x, y, width = 100, height = 20, label) ->
  label ?= @timerName timer

  if label
    @text "#{label} (#{timer.length})", x, y, timerColor(timer), @font
    y += height

  for event in timer.events
    @timerEvent event, x, y, width, height
    y += 1.5 * height

  return
