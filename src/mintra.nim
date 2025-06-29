import random
import csfml, csfml/ext

import game

type
  KeyCallbacks = array[KeyCode, proc()]

let
  dorfTexture = newTexture("res/dorf.png")

var
  dorfSprite = newSprite(dorfTexture)

var gameState: Game

proc processEvents(window: RenderWindow; keyCallbacks: KeyCallbacks) =
  for e in window.events:
    case e.kind
    of EventType.Closed: window.close()
    of EventType.KeyPressed:
      let keycode = e.key.code
      if keyCallbacks[keycode] == nil: continue
      keyCallbacks[keycode]()
    else: discard

proc renderThread(window: RenderWindow) =
  # var transform = Identity
  # let states = renderStates(transform=transform)

  discard (window.active = true)
  while window.open:
    window.clear(Black)
    window.draw(dorfSprite)
    window.display()

when isMainModule:
  var
    window: RenderWindow
    thr: system.Thread[RenderWindow]

  randomize()

  window = newRenderWindow(videoMode(1280, 720), "Unsure", WindowStyle.Default, contextSettings())
  window.verticalSyncEnabled = true

  discard (window.active = false)
  createThread(thr, renderThread, window)

  var keyCallbacks: KeyCallbacks
  keyCallbacks[KeyCode.Escape] = proc() = window.close()

  var frameCnt: uint64 = 0
  while window.open:
    processEvents(window, keyCallbacks)
    if not gameState.tick(): window.close()
    frameCnt += 1

  joinThread(thr)