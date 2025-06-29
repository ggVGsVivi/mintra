import deques
import math

import space
import pathfinding
import player
import character
import zone

type
  EventKind* = enum
    eMove
    eAttack
    eStop
  Event* = object
    player*: ref Player
    kind*: EventKind
    actor*: ref Character
    target*: ref Character
    targetPos*: Vec3f
    autoMove*: bool
  Game* = object
    input: Deque[Event]
    output: Deque[Event]

proc tick*(game: var Game): bool =
  while game.input.len > 0:
    let ev = game.input.popFirst()
    case ev.kind
    of eMove:
      if ev.autoMove:
        # TODO: implement pathfinding
        # ev.actor.path = calculatePath(pathNode(ev.actor.pos), pathNode(ev.targetPos), findPathNodes)
        discard
      else:
        ev.actor.path = @[ev.targetPos]
    of eAttack:
      discard
    of eStop:
      ev.actor.path.setLen(0)
  true
