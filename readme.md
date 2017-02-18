![Screenshot](https://samme.github.io/phaser-debug-timer/screenshot.png)

Phaser Debug Timer ⏱
==================

Default arguments are shown. The default timer is the master timer, [game.time.events](http://phaser.io/docs/2.6.2/Phaser.Time.html#events).

```javascript
// Show duration since timer started:
game.debug.timerElapsed(timer = this.game.time.events, x, y, label = timer.name)

// Show a timer event's pending interval (uncommon):
// {width}px === 1s
game.debug.timerEvent(event, x, y, width = 100, height = 20, label = event.name)

// Show all pending timer events for a timer:
// {width}px === 1s
game.debug.timerEvents(timer = this.game.time.events, x, y, width = 100, height = 20, label = timer.name)

// Show the next pending timer event:
// {width}px === 1s
game.debug.timerNextEvent(timer = this.game.time.events, x, y, width = 100, height = 20, label = timer.name)
```

You may find it helpful to name your timers and events:

```javascript
var timer = this.game.time.create();
timer.name = 'name';

var timerEvent = timer.add(/*…*/);
timerEvent.name = 'name';
```
