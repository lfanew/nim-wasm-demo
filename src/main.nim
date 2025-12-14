import std/strformat
import raylib

proc emscripten_set_main_loop(
  f: proc() {.cdecl.},
  fps: cint,
  simulateInfiniteLoop: cint
) {.importc, header: "<emscripten/emscripten.h>".}

const
  SCREEN_WIDTH: int32  = 800
  SCREEN_HEIGHT: int32 = 600
  TITLE = "Target Practice"
  FPS: int32 = 60
  TARGET_RADIUS: float32 = 20.0
  ACTIVE_PERIOD: float32 = 1.0
  REST_PERIOD: float32 = 2.0

type
  Target = object
    position: Vector2
    active: bool
    radius: float32
  GameState = object
    target: Target
    mousePos: Vector2
    elapsed: float32
    hits: int32
    total: int32

var state: GameState = GameState()

proc randomPosition(minX, minY, maxX, maxY: int32): Vector2 =
  let x = GetRandomValue(minX, maxX)
  let y = GetRandomValue(minY, maxY)
  result = Vector2(x: float(x), y: float(y))

proc init() =
  state.target.active = false
  state.target.radius = TARGET_RADIUS
  state.elapsed = 0

proc update() =
  state.elapsed += GetFrameTime()
  state.mousePos = GetMousePosition()

  if state.target.active:
    if state.elapsed > ACTIVE_PERIOD:
      inc(state.total)
      state.target.active = false
      state.elapsed = 0
    elif IsMouseButtonPressed(MOUSE_BUTTON_LEFT):
      inc(state.total)
      if CheckCollisionPointCircle(state.mousePos, state.target.position, TARGET_RADIUS): inc(state.hits)
      state.target.active = false
      state.elapsed = 0
  elif not state.target.active and state.elapsed > REST_PERIOD:
    state.target.active = true
    state.elapsed = 0
    state.target.position = randomPosition(int32(state.target.radius), int32(state.target.radius), SCREEN_WIDTH - int32(state.target.radius), SCREEN_HEIGHT - int32(state.target.radius))

proc draw() =
  BeginDrawing()
  defer: EndDrawing()

  ClearBackground(RAYWHITE)
  if state.target.active:
    DrawCircleV(state.target.position, state.target.radius, BLUE)
  DrawText(fmt"Score: {state.hits}/{state.total}".cstring, 20, 20, 32, BLACK)

proc gameLoop() {.cdecl.} =
  update()
  draw()

block main:
  InitWindow(SCREEN_WIDTH, SCREEN_HEIGHT, TITLE.cstring)
  defer: CloseWindow()
  SetTargetFPS(FPS)

  init()
  emscripten_set_main_loop(gameLoop, 0, 1)