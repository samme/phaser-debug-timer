# Phaser Debug Timer ⏱

```javascript
// Default arguments are shown

// Show duration since timer started:
game.debug.timerElapsed(timer = this.game.time.events, x, y, label = timer.name)

// Show a timer event's pending interval (uncommon):
game.debug.timerEvent(event, x, y, width = 100, height = 20, label = event.name)

// Show all pending timer events for a timer:
// {width}px === 1000ms
// Use, e.g., height = 10 for smaller bars
game.debug.timerEvents(timer = this.game.time.events, x, y, width = 100, height = 20, label = timer.name)

// Show the next pending timer event:
game.debug.timerNextEvent(timer = this.game.time.events, x, y, width = 100, height = 20, label = timer.name)
```

You may find it helpful to name your timers and events:

```javascript
var timer = this.game.time.create();
timer.name = 'name';

var timerEvent = timer.add(/*…*/);
timerEvent.name = 'name';
```
