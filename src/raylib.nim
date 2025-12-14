{.passL: "libraylib.a".}

##  Vector2, 2 components

type
  Vector2* {.bycopy.} = object
    x*: cfloat
    ##  Vector x component
    y*: cfloat
    ##  Vector y component


##  Vector3, 3 components

type
  Vector3* {.bycopy.} = object
    x*: cfloat
    ##  Vector x component
    y*: cfloat
    ##  Vector y component
    z*: cfloat
    ##  Vector z component


##  Vector4, 4 components

type
  Vector4* {.bycopy.} = object
    x*: cfloat
    ##  Vector x component
    y*: cfloat
    ##  Vector y component
    z*: cfloat
    ##  Vector z component
    w*: cfloat
    ##  Vector w component


##  Quaternion, 4 components (Vector4 alias)

type
  Quaternion* = Vector4

##  Matrix, 4x4 components, column major, OpenGL style, right-handed

type
  Matrix* {.bycopy.} = object
    m0*: cfloat
    m4*: cfloat
    m8*: cfloat
    m12*: cfloat
    ##  Matrix first row (4 components)
    m1*: cfloat
    m5*: cfloat
    m9*: cfloat
    m13*: cfloat
    ##  Matrix second row (4 components)
    m2*: cfloat
    m6*: cfloat
    m10*: cfloat
    m14*: cfloat
    ##  Matrix third row (4 components)
    m3*: cfloat
    m7*: cfloat
    m11*: cfloat
    m15*: cfloat
    ##  Matrix fourth row (4 components)


##  Color, 4 components, R8G8B8A8 (32bit)

type
  Color* {.bycopy.} = object
    r*: uint8
    ##  Color red value
    g*: uint8
    ##  Color green value
    b*: uint8
    ##  Color blue value
    a*: uint8
    ##  Color alpha value


##  Rectangle, 4 components

type
  Rectangle* {.bycopy.} = object
    x*: cfloat
    ##  Rectangle top-left corner position x
    y*: cfloat
    ##  Rectangle top-left corner position y
    width*: cfloat
    ##  Rectangle width
    height*: cfloat
    ##  Rectangle height


##  Image, pixel data stored in CPU memory (RAM)

type
  Image* {.bycopy.} = object
    data*: pointer
    ##  Image raw data
    width*: cint
    ##  Image base width
    height*: cint
    ##  Image base height
    mipmaps*: cint
    ##  Mipmap levels, 1 by default
    format*: cint
    ##  Data format (PixelFormat type)


##  Texture, tex data stored in GPU memory (VRAM)

type
  Texture* {.bycopy.} = object
    id*: cuint
    ##  OpenGL texture id
    width*: cint
    ##  Texture base width
    height*: cint
    ##  Texture base height
    mipmaps*: cint
    ##  Mipmap levels, 1 by default
    format*: cint
    ##  Data format (PixelFormat type)


##  Texture2D, same as Texture

type
  Texture2D* = Texture

##  TextureCubemap, same as Texture

type
  TextureCubemap* = Texture

##  RenderTexture, fbo for texture rendering

type
  RenderTexture* {.bycopy.} = object
    id*: cuint
    ##  OpenGL framebuffer object id
    texture*: Texture
    ##  Color buffer attachment texture
    depth*: Texture
    ##  Depth buffer attachment texture


##  RenderTexture2D, same as RenderTexture

type
  RenderTexture2D* = RenderTexture

##  NPatchInfo, n-patch layout info

type
  NPatchInfo* {.bycopy.} = object
    source*: Rectangle
    ##  Texture source rectangle
    left*: cint
    ##  Left border offset
    top*: cint
    ##  Top border offset
    right*: cint
    ##  Right border offset
    bottom*: cint
    ##  Bottom border offset
    layout*: cint
    ##  Layout of the n-patch: 3x3, 1x3 or 3x1


##  GlyphInfo, font characters glyphs info

type
  GlyphInfo* {.bycopy.} = object
    value*: cint
    ##  Character value (Unicode)
    offsetX*: cint
    ##  Character offset X when drawing
    offsetY*: cint
    ##  Character offset Y when drawing
    advanceX*: cint
    ##  Character advance position X
    image*: Image
    ##  Character image data


##  Font, font texture and GlyphInfo array data

type
  Font* {.bycopy.} = object
    baseSize*: cint
    ##  Base size (default chars height)
    glyphCount*: cint
    ##  Number of glyph characters
    glyphPadding*: cint
    ##  Padding around the glyph characters
    texture*: Texture2D
    ##  Texture atlas containing the glyphs
    recs*: ptr Rectangle
    ##  Rectangles in texture for the glyphs
    glyphs*: ptr GlyphInfo
    ##  Glyphs info data


##  Camera, defines position/orientation in 3d space

type
  Camera3D* {.bycopy.} = object
    position*: Vector3
    ##  Camera position
    target*: Vector3
    ##  Camera target it looks-at
    up*: Vector3
    ##  Camera up vector (rotation over its axis)
    fovy*: cfloat
    ##  Camera field-of-view aperture in Y (degrees) in perspective, used as near plane height in world units in orthographic
    projection*: cint
    ##  Camera projection: CAMERA_PERSPECTIVE or CAMERA_ORTHOGRAPHIC

  Camera* = Camera3D

##  Camera type fallback, defaults to Camera3D
##  Camera2D, defines position/orientation in 2d space

type
  Camera2D* {.bycopy.} = object
    offset*: Vector2
    ##  Camera offset (displacement from target)
    target*: Vector2
    ##  Camera target (rotation and zoom origin)
    rotation*: cfloat
    ##  Camera rotation in degrees
    zoom*: cfloat
    ##  Camera zoom (scaling), should be 1.0f by default


##  Mesh, vertex data and vao/vbo

type
  Mesh* {.bycopy.} = object
    vertexCount*: cint
    ##  Number of vertices stored in arrays
    triangleCount*: cint
    ##  Number of triangles stored (indexed or not)
    ##  Vertex attributes data
    vertices*: ptr cfloat
    ##  Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
    texcoords*: ptr cfloat
    ##  Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
    texcoords2*: ptr cfloat
    ##  Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
    normals*: ptr cfloat
    ##  Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
    tangents*: ptr cfloat
    ##  Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
    colors*: ptr uint8
    ##  Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
    indices*: ptr cushort
    ##  Vertex indices (in case vertex data comes indexed)
    ##  Animation vertex data
    animVertices*: ptr cfloat
    ##  Animated vertex positions (after bones transformations)
    animNormals*: ptr cfloat
    ##  Animated normals (after bones transformations)
    boneIds*: ptr uint8
    ##  Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning) (shader-location = 6)
    boneWeights*: ptr cfloat
    ##  Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
    boneMatrices*: ptr Matrix
    ##  Bones animated transformation matrices
    boneCount*: cint
    ##  Number of bones
    ##  OpenGL identifiers
    vaoId*: cuint
    ##  OpenGL Vertex Array Object id
    vboId*: ptr cuint
    ##  OpenGL Vertex Buffer Objects id (default vertex data)


##  Shader

type
  Shader* {.bycopy.} = object
    id*: cuint
    ##  Shader program id
    locs*: ptr cint
    ##  Shader locations array (RL_MAX_SHADER_LOCATIONS)


##  MaterialMap

type
  MaterialMap* {.bycopy.} = object
    texture*: Texture2D
    ##  Material map texture
    color*: Color
    ##  Material map color
    value*: cfloat
    ##  Material map value


##  Material, includes shader and maps

type
  Material* {.bycopy.} = object
    shader*: Shader
    ##  Material shader
    maps*: ptr MaterialMap
    ##  Material maps array (MAX_MATERIAL_MAPS)
    params*: array[4, cfloat]
    ##  Material generic parameters (if required)


##  Transform, vertex transformation data

type
  Transform* {.bycopy.} = object
    translation*: Vector3
    ##  Translation
    rotation*: Quaternion
    ##  Rotation
    scale*: Vector3
    ##  Scale


##  Bone, skeletal animation bone

type
  BoneInfo* {.bycopy.} = object
    name*: array[32, char]
    ##  Bone name
    parent*: cint
    ##  Bone parent


##  Model, meshes, materials and animation data

type
  Model* {.bycopy.} = object
    transform*: Matrix
    ##  Local transform matrix
    meshCount*: cint
    ##  Number of meshes
    materialCount*: cint
    ##  Number of materials
    meshes*: ptr Mesh
    ##  Meshes array
    materials*: ptr Material
    ##  Materials array
    meshMaterial*: ptr cint
    ##  Mesh material number
    ##  Animation data
    boneCount*: cint
    ##  Number of bones
    bones*: ptr BoneInfo
    ##  Bones information (skeleton)
    bindPose*: ptr Transform
    ##  Bones base transformation (pose)


##  ModelAnimation

type
  ModelAnimation* {.bycopy.} = object
    boneCount*: cint
    ##  Number of bones
    frameCount*: cint
    ##  Number of animation frames
    bones*: ptr BoneInfo
    ##  Bones information (skeleton)
    framePoses*: ptr ptr Transform
    ##  Poses array by frame
    name*: array[32, char]
    ##  Animation name


##  Ray, ray for raycasting

type
  Ray* {.bycopy.} = object
    position*: Vector3
    ##  Ray position (origin)
    direction*: Vector3
    ##  Ray direction (normalized)


##  RayCollision, ray hit information

type
  RayCollision* {.bycopy.} = object
    hit*: bool
    ##  Did the ray hit something?
    distance*: cfloat
    ##  Distance to the nearest hit
    point*: Vector3
    ##  Point of the nearest hit
    normal*: Vector3
    ##  Surface normal of hit


##  BoundingBox

type
  BoundingBox* {.bycopy.} = object
    min*: Vector3
    ##  Minimum vertex box-corner
    max*: Vector3
    ##  Maximum vertex box-corner


##  Wave, audio wave data

type
  Wave* {.bycopy.} = object
    frameCount*: cuint
    ##  Total number of frames (considering channels)
    sampleRate*: cuint
    ##  Frequency (samples per second)
    sampleSize*: cuint
    ##  Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels*: cuint
    ##  Number of channels (1-mono, 2-stereo, ...)
    data*: pointer
    ##  Buffer data pointer


##  Opaque structs declaration
##  NOTE: Actual structs are defined internally in raudio module
type
  rAudioBuffer* = object
  rAudioProcessor* = object

##  AudioStream, custom audio stream

type
  AudioStream* {.bycopy.} = object
    buffer*: ptr rAudioBuffer
    ##  Pointer to internal data used by the audio system
    processor*: ptr rAudioProcessor
    ##  Pointer to internal data processor, useful for audio effects
    sampleRate*: cuint
    ##  Frequency (samples per second)
    sampleSize*: cuint
    ##  Bit depth (bits per sample): 8, 16, 32 (24 not supported)
    channels*: cuint
    ##  Number of channels (1-mono, 2-stereo, ...)


##  Sound

type
  Sound* {.bycopy.} = object
    stream*: AudioStream
    ##  Audio stream
    frameCount*: cuint
    ##  Total number of frames (considering channels)


##  Music, audio stream, anything longer than ~10 seconds should be streamed

type
  Music* {.bycopy.} = object
    stream*: AudioStream
    ##  Audio stream
    frameCount*: cuint
    ##  Total number of frames (considering channels)
    looping*: bool
    ##  Music looping enable
    ctxType*: cint
    ##  Type of music context (audio filetype)
    ctxData*: pointer
    ##  Audio context data, depends on type


##  VrDeviceInfo, Head-Mounted-Display device parameters

type
  VrDeviceInfo* {.bycopy.} = object
    hResolution*: cint
    ##  Horizontal resolution in pixels
    vResolution*: cint
    ##  Vertical resolution in pixels
    hScreenSize*: cfloat
    ##  Horizontal size in meters
    vScreenSize*: cfloat
    ##  Vertical size in meters
    eyeToScreenDistance*: cfloat
    ##  Distance between eye and display in meters
    lensSeparationDistance*: cfloat
    ##  Lens separation distance in meters
    interpupillaryDistance*: cfloat
    ##  IPD (distance between pupils) in meters
    lensDistortionValues*: array[4, cfloat]
    ##  Lens distortion constant parameters
    chromaAbCorrection*: array[4, cfloat]
    ##  Chromatic aberration correction parameters


##  VrStereoConfig, VR stereo rendering configuration for simulator

type
  VrStereoConfig* {.bycopy.} = object
    projection*: array[2, Matrix]
    ##  VR projection matrices (per eye)
    viewOffset*: array[2, Matrix]
    ##  VR view offset matrices (per eye)
    leftLensCenter*: array[2, cfloat]
    ##  VR left lens center
    rightLensCenter*: array[2, cfloat]
    ##  VR right lens center
    leftScreenCenter*: array[2, cfloat]
    ##  VR left screen center
    rightScreenCenter*: array[2, cfloat]
    ##  VR right screen center
    scale*: array[2, cfloat]
    ##  VR distortion scale
    scaleIn*: array[2, cfloat]
    ##  VR distortion scale in


##  File path list

type
  FilePathList* {.bycopy.} = object
    capacity*: cuint
    ##  Filepaths max entries
    count*: cuint
    ##  Filepaths entries count
    paths*: cstringArray
    ##  Filepaths entries


##  Automation event

type
  AutomationEvent* {.bycopy.} = object
    frame*: cuint
    ##  Event frame
    `type`*: cuint
    ##  Event type (AutomationEventType)
    params*: array[4, cint]
    ##  Event parameters (if required)


##  Automation event list

type
  AutomationEventList* {.bycopy.} = object
    capacity*: cuint
    ##  Events max entries (MAX_AUTOMATION_EVENTS)
    count*: cuint
    ##  Events entries count
    events*: ptr AutomationEvent
    ##  Events entries

## Color Constants

const
  LIGHTGRAY*  = Color(r: 200, g: 200, b: 200, a: 255)
  GRAY*       = Color(r: 130, g: 130, b: 130, a: 255)
  DARKGRAY*   = Color(r: 80, g: 80, b: 80, a: 255)
  YELLOW*     = Color(r: 253, g: 249, b: 0, a: 255)
  GOLD*       = Color(r: 255, g: 203, b: 0, a: 255)
  ORANGE*     = Color(r: 255, g: 161, b: 0, a: 255)
  PINK*       = Color(r: 255, g: 109, b: 194, a: 255)
  RED*        = Color(r: 230, g: 41, b: 55, a: 255)
  MAROON*     = Color(r: 190, g: 33, b: 55, a: 255)
  GREEN*      = Color(r: 0, g: 228, b: 48, a: 255)
  LIME*       = Color(r: 0, g: 158, b: 47, a: 255)
  DARKGREEN*  = Color(r: 0, g: 117, b: 44, a: 255)
  SKYBLUE*    = Color(r: 102, g: 191, b: 255, a: 255)
  BLUE*       = Color(r: 0, g: 121, b: 241, a: 255)
  DARKBLUE*   = Color(r: 0, g: 82, b: 172, a: 255)
  PURPLE*     = Color(r: 200, g: 122, b: 255, a: 255)
  VIOLET*     = Color(r: 135, g: 60, b: 190, a: 255)
  DARKPURPLE* = Color(r: 112, g: 31, b: 126, a: 255)
  BEIGE*      = Color(r: 211, g: 176, b: 131, a: 255)
  BROWN*      = Color(r: 127, g: 106, b: 79, a: 255)
  DARKBROWN*  = Color(r: 76, g: 63, b: 47, a: 255)
  WHITE*      = Color(r: 255, g: 255, b: 255, a: 255)
  BLACK*      = Color(r: 0, g: 0, b: 0, a: 255)
  BLANK*      = Color(r: 0, g: 0, b: 0, a: 0)
  MAGENTA*    = Color(r: 255, g: 0, b: 255, a: 255)
  RAYWHITE*   = Color(r: 245, g: 245, b: 245, a: 255)

## ----------------------------------------------------------------------------------
##  Enumerators Definition
## ----------------------------------------------------------------------------------
##  System/Window config flags
##  NOTE: Every bit registers one state (use it with bit masks)
##  By default all flags are set to 0

type
  ConfigFlags* = enum
    FLAG_FULLSCREEN_MODE = 0x00000002, ##  Set to run program in fullscreen
    FLAG_WINDOW_RESIZABLE = 0x00000004, ##  Set to allow resizable window
    FLAG_WINDOW_UNDECORATED = 0x00000008, ##  Set to disable window decoration (frame and buttons)
    FLAG_WINDOW_TRANSPARENT = 0x00000010, ##  Set to allow transparent framebuffer
    FLAG_MSAA_4X_HINT = 0x00000020, ##  Set to try enabling MSAA 4X
    FLAG_VSYNC_HINT = 0x00000040, ##  Set to try enabling V-Sync on GPU
    FLAG_WINDOW_HIDDEN = 0x00000080, ##  Set to hide window
    FLAG_WINDOW_ALWAYS_RUN = 0x00000100, ##  Set to allow windows running while minimized
    FLAG_WINDOW_MINIMIZED = 0x00000200, ##  Set to minimize window (iconify)
    FLAG_WINDOW_MAXIMIZED = 0x00000400, ##  Set to maximize window (expanded to monitor)
    FLAG_WINDOW_UNFOCUSED = 0x00000800, ##  Set to window non focused
    FLAG_WINDOW_TOPMOST = 0x00001000, ##  Set to window always on top
    FLAG_WINDOW_HIGHDPI = 0x00002000, ##  Set to support HighDPI
    FLAG_WINDOW_MOUSE_PASSTHROUGH = 0x00004000, ##  Set to support mouse passthrough, only supported when FLAG_WINDOW_UNDECORATED
    FLAG_BORDERLESS_WINDOWED_MODE = 0x00008000, ##  Set to run program in borderless windowed mode
    FLAG_INTERLACED_HINT = 0x00010000 ##  Set to try enabling interlaced video format (for V3D)


##  Trace log level
##  NOTE: Organized by priority level

type
  TraceLogLevel* = enum
    LOG_ALL = 0,                ##  Display all logs
    LOG_TRACE,                ##  Trace logging, intended for internal use only
    LOG_DEBUG,                ##  Debug logging, used for internal debugging, it should be disabled on release builds
    LOG_INFO,                 ##  Info logging, used for program execution info
    LOG_WARNING,              ##  Warning logging, used on recoverable failures
    LOG_ERROR,                ##  Error logging, used on unrecoverable failures
    LOG_FATAL,                ##  Fatal logging, used to abort program: exit(EXIT_FAILURE)
    LOG_NONE                  ##  Disable logging


##  Keyboard keys (US keyboard layout)
##  NOTE: Use GetKeyPressed() to allow redefining
##  required keys for alternative layouts

type
  KeyboardKey* = enum
    KEY_NULL = 0,               ##  Key: NULL, used for no key pressed
               ##  Alphanumeric keys
    KEY_BACK = 4,               ##  Key: Android back button
    KEY_MENU = 5,               ##  Key: Android menu button
    KEY_VOLUME_UP = 24,         ##  Key: Android volume up button
    KEY_VOLUME_DOWN = 25,       ##  Key: Android volume down button
    KEY_SPACE = 32,             ##  Key: Space
    KEY_APOSTROPHE = 39,        ##  Key: '
    KEY_COMMA = 44,             ##  Key: ,
    KEY_MINUS = 45,             ##  Key: -
    KEY_PERIOD = 46,            ##  Key: .
    KEY_SLASH = 47,             ##  Key: /
    KEY_ZERO = 48,              ##  Key: 0
    KEY_ONE = 49,               ##  Key: 1
    KEY_TWO = 50,               ##  Key: 2
    KEY_THREE = 51,             ##  Key: 3
    KEY_FOUR = 52,              ##  Key: 4
    KEY_FIVE = 53,              ##  Key: 5
    KEY_SIX = 54,               ##  Key: 6
    KEY_SEVEN = 55,             ##  Key: 7
    KEY_EIGHT = 56,             ##  Key: 8
    KEY_NINE = 57,              ##  Key: 9
    KEY_SEMICOLON = 59,         ##  Key: ;
    KEY_EQUAL = 61,             ##  Key: =
    KEY_A = 65,                 ##  Key: A | a
    KEY_B = 66,                 ##  Key: B | b
    KEY_C = 67,                 ##  Key: C | c
    KEY_D = 68,                 ##  Key: D | d
    KEY_E = 69,                 ##  Key: E | e
    KEY_F = 70,                 ##  Key: F | f
    KEY_G = 71,                 ##  Key: G | g
    KEY_H = 72,                 ##  Key: H | h
    KEY_I = 73,                 ##  Key: I | i
    KEY_J = 74,                 ##  Key: J | j
    KEY_K = 75,                 ##  Key: K | k
    KEY_L = 76,                 ##  Key: L | l
    KEY_M = 77,                 ##  Key: M | m
    KEY_N = 78,                 ##  Key: N | n
    KEY_O = 79,                 ##  Key: O | o
    KEY_P = 80,                 ##  Key: P | p
    KEY_Q = 81,                 ##  Key: Q | q
    KEY_R = 82,                 ##  Key: R | r
    KEY_S = 83,                 ##  Key: S | s
    KEY_T = 84,                 ##  Key: T | t
    KEY_U = 85,                 ##  Key: U | u
    KEY_V = 86,                 ##  Key: V | v
    KEY_W = 87,                 ##  Key: W | w
    KEY_X = 88,                 ##  Key: X | x
    KEY_Y = 89,                 ##  Key: Y | y
    KEY_Z = 90,                 ##  Key: Z | z
    KEY_LEFT_BRACKET = 91,      ##  Key: [
    KEY_BACKSLASH = 92,         ##  Key: '\'
    KEY_RIGHT_BRACKET = 93,     ##  Key: ]
    KEY_GRAVE = 96,             ##  Key: `
                 ##  Function keys
    KEY_ESCAPE = 256,           ##  Key: Esc
    KEY_ENTER = 257,            ##  Key: Enter
    KEY_TAB = 258,              ##  Key: Tab
    KEY_BACKSPACE = 259,        ##  Key: Backspace
    KEY_INSERT = 260,           ##  Key: Ins
    KEY_DELETE = 261,           ##  Key: Del
    KEY_RIGHT = 262,            ##  Key: Cursor right
    KEY_LEFT = 263,             ##  Key: Cursor left
    KEY_DOWN = 264,             ##  Key: Cursor down
    KEY_UP = 265,               ##  Key: Cursor up
    KEY_PAGE_UP = 266,          ##  Key: Page up
    KEY_PAGE_DOWN = 267,        ##  Key: Page down
    KEY_HOME = 268,             ##  Key: Home
    KEY_END = 269,              ##  Key: End
    KEY_CAPS_LOCK = 280,        ##  Key: Caps lock
    KEY_SCROLL_LOCK = 281,      ##  Key: Scroll down
    KEY_NUM_LOCK = 282,         ##  Key: Num lock
    KEY_PRINT_SCREEN = 283,     ##  Key: Print screen
    KEY_PAUSE = 284,            ##  Key: Pause
    KEY_F1 = 290,               ##  Key: F1
    KEY_F2 = 291,               ##  Key: F2
    KEY_F3 = 292,               ##  Key: F3
    KEY_F4 = 293,               ##  Key: F4
    KEY_F5 = 294,               ##  Key: F5
    KEY_F6 = 295,               ##  Key: F6
    KEY_F7 = 296,               ##  Key: F7
    KEY_F8 = 297,               ##  Key: F8
    KEY_F9 = 298,               ##  Key: F9
    KEY_F10 = 299,              ##  Key: F10
    KEY_F11 = 300,              ##  Key: F11
    KEY_F12 = 301,              ##  Key: F12
    KEY_KP_0 = 320,             ##  Key: Keypad 0
    KEY_KP_1 = 321,             ##  Key: Keypad 1
    KEY_KP_2 = 322,             ##  Key: Keypad 2
    KEY_KP_3 = 323,             ##  Key: Keypad 3
    KEY_KP_4 = 324,             ##  Key: Keypad 4
    KEY_KP_5 = 325,             ##  Key: Keypad 5
    KEY_KP_6 = 326,             ##  Key: Keypad 6
    KEY_KP_7 = 327,             ##  Key: Keypad 7
    KEY_KP_8 = 328,             ##  Key: Keypad 8
    KEY_KP_9 = 329,             ##  Key: Keypad 9
    KEY_KP_DECIMAL = 330,       ##  Key: Keypad .
    KEY_KP_DIVIDE = 331,        ##  Key: Keypad /
    KEY_KP_MULTIPLY = 332,      ##  Key: Keypad *
    KEY_KP_SUBTRACT = 333,      ##  Key: Keypad -
    KEY_KP_ADD = 334,           ##  Key: Keypad +
    KEY_KP_ENTER = 335,         ##  Key: Keypad Enter
    KEY_KP_EQUAL = 336,         ##  Key: Keypad =
                     ##  Android key buttons
    KEY_LEFT_SHIFT = 340,       ##  Key: Shift left
    KEY_LEFT_CONTROL = 341,     ##  Key: Control left
    KEY_LEFT_ALT = 342,         ##  Key: Alt left
    KEY_LEFT_SUPER = 343,       ##  Key: Super left
    KEY_RIGHT_SHIFT = 344,      ##  Key: Shift right
    KEY_RIGHT_CONTROL = 345,    ##  Key: Control right
    KEY_RIGHT_ALT = 346,        ##  Key: Alt right
    KEY_RIGHT_SUPER = 347,      ##  Key: Super right
    KEY_KB_MENU = 348           ##  Key: KB menu
                   ##  Keypad keys


##  Mouse buttons

type
  MouseButton* = enum
    MOUSE_BUTTON_LEFT = 0,      ##  Mouse button left
    MOUSE_BUTTON_RIGHT = 1,     ##  Mouse button right
    MOUSE_BUTTON_MIDDLE = 2,    ##  Mouse button middle (pressed wheel)
    MOUSE_BUTTON_SIDE = 3,      ##  Mouse button side (advanced mouse device)
    MOUSE_BUTTON_EXTRA = 4,     ##  Mouse button extra (advanced mouse device)
    MOUSE_BUTTON_FORWARD = 5,   ##  Mouse button forward (advanced mouse device)
    MOUSE_BUTTON_BACK = 6       ##  Mouse button back (advanced mouse device)


##  Mouse cursor

type
  MouseCursor* = enum
    MOUSE_CURSOR_DEFAULT = 0,   ##  Default pointer shape
    MOUSE_CURSOR_ARROW = 1,     ##  Arrow shape
    MOUSE_CURSOR_IBEAM = 2,     ##  Text writing cursor shape
    MOUSE_CURSOR_CROSSHAIR = 3, ##  Cross shape
    MOUSE_CURSOR_POINTING_HAND = 4, ##  Pointing hand cursor
    MOUSE_CURSOR_RESIZE_EW = 5, ##  Horizontal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NS = 6, ##  Vertical resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NWSE = 7, ##  Top-left to bottom-right diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_NESW = 8, ##  The top-right to bottom-left diagonal resize/move arrow shape
    MOUSE_CURSOR_RESIZE_ALL = 9, ##  The omnidirectional resize/move cursor shape
    MOUSE_CURSOR_NOT_ALLOWED = 10 ##  The operation-not-allowed shape


##  Gamepad buttons

type
  GamepadButton* = enum
    GAMEPAD_BUTTON_UNKNOWN = 0, ##  Unknown button, just for error checking
    GAMEPAD_BUTTON_LEFT_FACE_UP, ##  Gamepad left DPAD up button
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT, ##  Gamepad left DPAD right button
    GAMEPAD_BUTTON_LEFT_FACE_DOWN, ##  Gamepad left DPAD down button
    GAMEPAD_BUTTON_LEFT_FACE_LEFT, ##  Gamepad left DPAD left button
    GAMEPAD_BUTTON_RIGHT_FACE_UP, ##  Gamepad right button up (i.e. PS3: Triangle, Xbox: Y)
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT, ##  Gamepad right button right (i.e. PS3: Circle, Xbox: B)
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN, ##  Gamepad right button down (i.e. PS3: Cross, Xbox: A)
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT, ##  Gamepad right button left (i.e. PS3: Square, Xbox: X)
    GAMEPAD_BUTTON_LEFT_TRIGGER_1, ##  Gamepad top/back trigger left (first), it could be a trailing button
    GAMEPAD_BUTTON_LEFT_TRIGGER_2, ##  Gamepad top/back trigger left (second), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1, ##  Gamepad top/back trigger right (first), it could be a trailing button
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2, ##  Gamepad top/back trigger right (second), it could be a trailing button
    GAMEPAD_BUTTON_MIDDLE_LEFT, ##  Gamepad center buttons, left one (i.e. PS3: Select)
    GAMEPAD_BUTTON_MIDDLE,    ##  Gamepad center buttons, middle one (i.e. PS3: PS, Xbox: XBOX)
    GAMEPAD_BUTTON_MIDDLE_RIGHT, ##  Gamepad center buttons, right one (i.e. PS3: Start)
    GAMEPAD_BUTTON_LEFT_THUMB, ##  Gamepad joystick pressed button left
    GAMEPAD_BUTTON_RIGHT_THUMB ##  Gamepad joystick pressed button right


##  Gamepad axes

type
  GamepadAxis* = enum
    GAMEPAD_AXIS_LEFT_X = 0,    ##  Gamepad left stick X axis
    GAMEPAD_AXIS_LEFT_Y = 1,    ##  Gamepad left stick Y axis
    GAMEPAD_AXIS_RIGHT_X = 2,   ##  Gamepad right stick X axis
    GAMEPAD_AXIS_RIGHT_Y = 3,   ##  Gamepad right stick Y axis
    GAMEPAD_AXIS_LEFT_TRIGGER = 4, ##  Gamepad back trigger left, pressure level: [1..-1]
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5 ##  Gamepad back trigger right, pressure level: [1..-1]


##  Material map index

type
  MaterialMapIndex* = enum
    MATERIAL_MAP_ALBEDO = 0,    ##  Albedo material (same as: MATERIAL_MAP_DIFFUSE)
    MATERIAL_MAP_METALNESS,   ##  Metalness material (same as: MATERIAL_MAP_SPECULAR)
    MATERIAL_MAP_NORMAL,      ##  Normal material
    MATERIAL_MAP_ROUGHNESS,   ##  Roughness material
    MATERIAL_MAP_OCCLUSION,   ##  Ambient occlusion material
    MATERIAL_MAP_EMISSION,    ##  Emission material
    MATERIAL_MAP_HEIGHT,      ##  Heightmap material
    MATERIAL_MAP_CUBEMAP,     ##  Cubemap material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_IRRADIANCE,  ##  Irradiance material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_PREFILTER,   ##  Prefilter material (NOTE: Uses GL_TEXTURE_CUBE_MAP)
    MATERIAL_MAP_BRDF         ##  Brdf material


const
  MATERIAL_MAP_DIFFUSE* = MATERIAL_MAP_ALBEDO
  MATERIAL_MAP_SPECULAR* = MATERIAL_MAP_METALNESS

##  Shader location index

type
  ShaderLocationIndex* = enum
    SHADER_LOC_VERTEX_POSITION = 0, ##  Shader location: vertex attribute: position
    SHADER_LOC_VERTEX_TEXCOORD01, ##  Shader location: vertex attribute: texcoord01
    SHADER_LOC_VERTEX_TEXCOORD02, ##  Shader location: vertex attribute: texcoord02
    SHADER_LOC_VERTEX_NORMAL, ##  Shader location: vertex attribute: normal
    SHADER_LOC_VERTEX_TANGENT, ##  Shader location: vertex attribute: tangent
    SHADER_LOC_VERTEX_COLOR,  ##  Shader location: vertex attribute: color
    SHADER_LOC_MATRIX_MVP,    ##  Shader location: matrix uniform: model-view-projection
    SHADER_LOC_MATRIX_VIEW,   ##  Shader location: matrix uniform: view (camera transform)
    SHADER_LOC_MATRIX_PROJECTION, ##  Shader location: matrix uniform: projection
    SHADER_LOC_MATRIX_MODEL,  ##  Shader location: matrix uniform: model (transform)
    SHADER_LOC_MATRIX_NORMAL, ##  Shader location: matrix uniform: normal
    SHADER_LOC_VECTOR_VIEW,   ##  Shader location: vector uniform: view
    SHADER_LOC_COLOR_DIFFUSE, ##  Shader location: vector uniform: diffuse color
    SHADER_LOC_COLOR_SPECULAR, ##  Shader location: vector uniform: specular color
    SHADER_LOC_COLOR_AMBIENT, ##  Shader location: vector uniform: ambient color
    SHADER_LOC_MAP_ALBEDO,    ##  Shader location: sampler2d texture: albedo (same as: SHADER_LOC_MAP_DIFFUSE)
    SHADER_LOC_MAP_METALNESS, ##  Shader location: sampler2d texture: metalness (same as: SHADER_LOC_MAP_SPECULAR)
    SHADER_LOC_MAP_NORMAL,    ##  Shader location: sampler2d texture: normal
    SHADER_LOC_MAP_ROUGHNESS, ##  Shader location: sampler2d texture: roughness
    SHADER_LOC_MAP_OCCLUSION, ##  Shader location: sampler2d texture: occlusion
    SHADER_LOC_MAP_EMISSION,  ##  Shader location: sampler2d texture: emission
    SHADER_LOC_MAP_HEIGHT,    ##  Shader location: sampler2d texture: height
    SHADER_LOC_MAP_CUBEMAP,   ##  Shader location: samplerCube texture: cubemap
    SHADER_LOC_MAP_IRRADIANCE, ##  Shader location: samplerCube texture: irradiance
    SHADER_LOC_MAP_PREFILTER, ##  Shader location: samplerCube texture: prefilter
    SHADER_LOC_MAP_BRDF,      ##  Shader location: sampler2d texture: brdf
    SHADER_LOC_VERTEX_BONEIDS, ##  Shader location: vertex attribute: boneIds
    SHADER_LOC_VERTEX_BONEWEIGHTS, ##  Shader location: vertex attribute: boneWeights
    SHADER_LOC_BONE_MATRICES, ##  Shader location: array of matrices uniform: boneMatrices
    SHADER_LOC_VERTEX_INSTANCE_TX ##  Shader location: vertex attribute: instanceTransform


const
  SHADER_LOC_MAP_DIFFUSE* = SHADER_LOC_MAP_ALBEDO
  SHADER_LOC_MAP_SPECULAR* = SHADER_LOC_MAP_METALNESS

##  Shader uniform data type

type
  ShaderUniformDataType* = enum
    SHADER_UNIFORM_FLOAT = 0,   ##  Shader uniform type: float
    SHADER_UNIFORM_VEC2,      ##  Shader uniform type: vec2 (2 float)
    SHADER_UNIFORM_VEC3,      ##  Shader uniform type: vec3 (3 float)
    SHADER_UNIFORM_VEC4,      ##  Shader uniform type: vec4 (4 float)
    SHADER_UNIFORM_INT,       ##  Shader uniform type: int
    SHADER_UNIFORM_IVEC2,     ##  Shader uniform type: ivec2 (2 int)
    SHADER_UNIFORM_IVEC3,     ##  Shader uniform type: ivec3 (3 int)
    SHADER_UNIFORM_IVEC4,     ##  Shader uniform type: ivec4 (4 int)
    SHADER_UNIFORM_UINT,      ##  Shader uniform type: unsigned int
    SHADER_UNIFORM_UIVEC2,    ##  Shader uniform type: uivec2 (2 unsigned int)
    SHADER_UNIFORM_UIVEC3,    ##  Shader uniform type: uivec3 (3 unsigned int)
    SHADER_UNIFORM_UIVEC4,    ##  Shader uniform type: uivec4 (4 unsigned int)
    SHADER_UNIFORM_SAMPLER2D  ##  Shader uniform type: sampler2d


##  Shader attribute data types

type
  ShaderAttributeDataType* = enum
    SHADER_ATTRIB_FLOAT = 0,    ##  Shader attribute type: float
    SHADER_ATTRIB_VEC2,       ##  Shader attribute type: vec2 (2 float)
    SHADER_ATTRIB_VEC3,       ##  Shader attribute type: vec3 (3 float)
    SHADER_ATTRIB_VEC4        ##  Shader attribute type: vec4 (4 float)


##  Pixel formats
##  NOTE: Support depends on OpenGL version and platform

type
  PixelFormat* = enum
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1, ##  8 bit per pixel (no alpha)
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA, ##  8*2 bpp (2 channels)
    PIXELFORMAT_UNCOMPRESSED_R5G6B5, ##  16 bpp
    PIXELFORMAT_UNCOMPRESSED_R8G8B8, ##  24 bpp
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1, ##  16 bpp (1 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4, ##  16 bpp (4 bit alpha)
    PIXELFORMAT_UNCOMPRESSED_R8G8B8A8, ##  32 bpp
    PIXELFORMAT_UNCOMPRESSED_R32, ##  32 bpp (1 channel - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32, ##  32*3 bpp (3 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32, ##  32*4 bpp (4 channels - float)
    PIXELFORMAT_UNCOMPRESSED_R16, ##  16 bpp (1 channel - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16, ##  16*3 bpp (3 channels - half float)
    PIXELFORMAT_UNCOMPRESSED_R16G16B16A16, ##  16*4 bpp (4 channels - half float)
    PIXELFORMAT_COMPRESSED_DXT1_RGB, ##  4 bpp (no alpha)
    PIXELFORMAT_COMPRESSED_DXT1_RGBA, ##  4 bpp (1 bit alpha)
    PIXELFORMAT_COMPRESSED_DXT3_RGBA, ##  8 bpp
    PIXELFORMAT_COMPRESSED_DXT5_RGBA, ##  8 bpp
    PIXELFORMAT_COMPRESSED_ETC1_RGB, ##  4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_RGB, ##  4 bpp
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA, ##  8 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGB, ##  4 bpp
    PIXELFORMAT_COMPRESSED_PVRT_RGBA, ##  4 bpp
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA, ##  8 bpp
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA ##  2 bpp


##  Texture parameters: filter mode
##  NOTE 1: Filtering considers mipmaps if available in the texture
##  NOTE 2: Filter is accordingly set for minification and magnification

type
  TextureFilter* = enum
    TEXTURE_FILTER_POINT = 0,   ##  No filter, just pixel approximation
    TEXTURE_FILTER_BILINEAR,  ##  Linear filtering
    TEXTURE_FILTER_TRILINEAR, ##  Trilinear filtering (linear with mipmaps)
    TEXTURE_FILTER_ANISOTROPIC_4X, ##  Anisotropic filtering 4x
    TEXTURE_FILTER_ANISOTROPIC_8X, ##  Anisotropic filtering 8x
    TEXTURE_FILTER_ANISOTROPIC_16X ##  Anisotropic filtering 16x


##  Texture parameters: wrap mode

type
  TextureWrap* = enum
    TEXTURE_WRAP_REPEAT = 0,    ##  Repeats texture in tiled mode
    TEXTURE_WRAP_CLAMP,       ##  Clamps texture to edge pixel in tiled mode
    TEXTURE_WRAP_MIRROR_REPEAT, ##  Mirrors and repeats the texture in tiled mode
    TEXTURE_WRAP_MIRROR_CLAMP ##  Mirrors and clamps to border the texture in tiled mode


##  Cubemap layouts

type
  CubemapLayout* = enum
    CUBEMAP_LAYOUT_AUTO_DETECT = 0, ##  Automatically detect layout type
    CUBEMAP_LAYOUT_LINE_VERTICAL, ##  Layout is defined by a vertical line with faces
    CUBEMAP_LAYOUT_LINE_HORIZONTAL, ##  Layout is defined by a horizontal line with faces
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR, ##  Layout is defined by a 3x4 cross with cubemap faces
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE ##  Layout is defined by a 4x3 cross with cubemap faces


##  Font type, defines generation method

type
  FontType* = enum
    FONT_DEFAULT = 0,           ##  Default font generation, anti-aliased
    FONT_BITMAP,              ##  Bitmap font generation, no anti-aliasing
    FONT_SDF                  ##  SDF font generation, requires external shader


##  Color blending modes (pre-defined)

type
  BlendMode* = enum
    BLEND_ALPHA = 0,            ##  Blend textures considering alpha (default)
    BLEND_ADDITIVE,           ##  Blend textures adding colors
    BLEND_MULTIPLIED,         ##  Blend textures multiplying colors
    BLEND_ADD_COLORS,         ##  Blend textures adding colors (alternative)
    BLEND_SUBTRACT_COLORS,    ##  Blend textures subtracting colors (alternative)
    BLEND_ALPHA_PREMULTIPLY,  ##  Blend premultiplied textures considering alpha
    BLEND_CUSTOM,             ##  Blend textures using custom src/dst factors (use rlSetBlendFactors())
    BLEND_CUSTOM_SEPARATE     ##  Blend textures using custom rgb/alpha separate src/dst factors (use rlSetBlendFactorsSeparate())


##  Gesture
##  NOTE: Provided as bit-wise flags to enable only desired gestures

type
  Gesture* = enum
    GESTURE_NONE = 0,           ##  No gesture
    GESTURE_TAP = 1,            ##  Tap gesture
    GESTURE_DOUBLETAP = 2,      ##  Double tap gesture
    GESTURE_HOLD = 4,           ##  Hold gesture
    GESTURE_DRAG = 8,           ##  Drag gesture
    GESTURE_SWIPE_RIGHT = 16,   ##  Swipe right gesture
    GESTURE_SWIPE_LEFT = 32,    ##  Swipe left gesture
    GESTURE_SWIPE_UP = 64,      ##  Swipe up gesture
    GESTURE_SWIPE_DOWN = 128,   ##  Swipe down gesture
    GESTURE_PINCH_IN = 256,     ##  Pinch in gesture
    GESTURE_PINCH_OUT = 512     ##  Pinch out gesture


##  Camera system modes

type
  CameraMode* = enum
    CAMERA_CUSTOM = 0,          ##  Camera custom, controlled by user (UpdateCamera() does nothing)
    CAMERA_FREE,              ##  Camera free mode
    CAMERA_ORBITAL,           ##  Camera orbital, around target, zoom supported
    CAMERA_FIRST_PERSON,      ##  Camera first person
    CAMERA_THIRD_PERSON       ##  Camera third person


##  Camera projection

type
  CameraProjection* = enum
    CAMERA_PERSPECTIVE = 0,     ##  Perspective projection
    CAMERA_ORTHOGRAPHIC       ##  Orthographic projection


##  N-patch layout

type
  NPatchLayout* = enum
    NPATCH_NINE_PATCH = 0,      ##  Npatch layout: 3x3 tiles
    NPATCH_THREE_PATCH_VERTICAL, ##  Npatch layout: 1x3 tiles
    NPATCH_THREE_PATCH_HORIZONTAL ##  Npatch layout: 3x1 tiles


##  Callbacks to hook some internal functions
##  WARNING: These callbacks are intended for advanced users

type
  TraceLogCallback* = proc (logLevel: cint; text: cstring;) {.cdecl, varargs.}

##  Logging: Redirect trace log messages

type
  LoadFileDataCallback* = proc (fileName: cstring; dataSize: ptr cint): ptr uint8 {.cdecl.}

##  FileIO: Load binary data

type
  SaveFileDataCallback* = proc (fileName: cstring; data: pointer; dataSize: cint): bool {.
      cdecl.}

##  FileIO: Save binary data

type
  LoadFileTextCallback* = proc (fileName: cstring): cstring {.cdecl.}

##  FileIO: Load text data

type
  SaveFileTextCallback* = proc (fileName: cstring; text: cstring): bool {.cdecl.}

##  FileIO: Save text data
## ------------------------------------------------------------------------------------
##  Global Variables Definition
## ------------------------------------------------------------------------------------
##  It's lonely here...
## ------------------------------------------------------------------------------------
##  Window and Graphics Device Functions (Module: core)
## ------------------------------------------------------------------------------------
##  Window-related functions

proc InitWindow*(width: cint; height: cint; title: cstring) {.cdecl,
    importc: "InitWindow".}
##  Initialize window and OpenGL context

proc CloseWindow*() {.cdecl, importc: "CloseWindow".}
##  Close window and unload OpenGL context

proc WindowShouldClose*(): bool {.cdecl, importc: "WindowShouldClose".}
##  Check if application should close (KEY_ESCAPE pressed or windows close icon clicked)

proc IsWindowReady*(): bool {.cdecl, importc: "IsWindowReady".}
##  Check if window has been initialized successfully

proc IsWindowFullscreen*(): bool {.cdecl, importc: "IsWindowFullscreen".}
##  Check if window is currently fullscreen

proc IsWindowHidden*(): bool {.cdecl, importc: "IsWindowHidden".}
##  Check if window is currently hidden

proc IsWindowMinimized*(): bool {.cdecl, importc: "IsWindowMinimized".}
##  Check if window is currently minimized

proc IsWindowMaximized*(): bool {.cdecl, importc: "IsWindowMaximized".}
##  Check if window is currently maximized

proc IsWindowFocused*(): bool {.cdecl, importc: "IsWindowFocused".}
##  Check if window is currently focused

proc IsWindowResized*(): bool {.cdecl, importc: "IsWindowResized".}
##  Check if window has been resized last frame

proc IsWindowState*(flag: cuint): bool {.cdecl, importc: "IsWindowState".}
##  Check if one specific window flag is enabled

proc SetWindowState*(flags: cuint) {.cdecl, importc: "SetWindowState".}
##  Set window configuration state using flags

proc ClearWindowState*(flags: cuint) {.cdecl, importc: "ClearWindowState".}
##  Clear window configuration state flags

proc ToggleFullscreen*() {.cdecl, importc: "ToggleFullscreen".}
##  Toggle window state: fullscreen/windowed, resizes monitor to match window resolution

proc ToggleBorderlessWindowed*() {.cdecl, importc: "ToggleBorderlessWindowed".}
##  Toggle window state: borderless windowed, resizes window to match monitor resolution

proc MaximizeWindow*() {.cdecl, importc: "MaximizeWindow".}
##  Set window state: maximized, if resizable

proc MinimizeWindow*() {.cdecl, importc: "MinimizeWindow".}
##  Set window state: minimized, if resizable

proc RestoreWindow*() {.cdecl, importc: "RestoreWindow".}
##  Restore window from being minimized/maximized

proc SetWindowIcon*(image: Image) {.cdecl, importc: "SetWindowIcon".}
##  Set icon for window (single image, RGBA 32bit)

proc SetWindowIcons*(images: ptr Image; count: cint) {.cdecl, importc: "SetWindowIcons".}
##  Set icon for window (multiple images, RGBA 32bit)

proc SetWindowTitle*(title: cstring) {.cdecl, importc: "SetWindowTitle".}
##  Set title for window

proc SetWindowPosition*(x: cint; y: cint) {.cdecl, importc: "SetWindowPosition".}
##  Set window position on screen

proc SetWindowMonitor*(monitor: cint) {.cdecl, importc: "SetWindowMonitor".}
##  Set monitor for the current window

proc SetWindowMinSize*(width: cint; height: cint) {.cdecl, importc: "SetWindowMinSize".}
##  Set window minimum dimensions (for FLAG_WINDOW_RESIZABLE)

proc SetWindowMaxSize*(width: cint; height: cint) {.cdecl, importc: "SetWindowMaxSize".}
##  Set window maximum dimensions (for FLAG_WINDOW_RESIZABLE)

proc SetWindowSize*(width: cint; height: cint) {.cdecl, importc: "SetWindowSize".}
##  Set window dimensions

proc SetWindowOpacity*(opacity: cfloat) {.cdecl, importc: "SetWindowOpacity".}
##  Set window opacity [0.0f..1.0f]

proc SetWindowFocused*() {.cdecl, importc: "SetWindowFocused".}
##  Set window focused

proc GetWindowHandle*(): pointer {.cdecl, importc: "GetWindowHandle".}
##  Get native window handle

proc GetScreenWidth*(): cint {.cdecl, importc: "GetScreenWidth".}
##  Get current screen width

proc GetScreenHeight*(): cint {.cdecl, importc: "GetScreenHeight".}
##  Get current screen height

proc GetRenderWidth*(): cint {.cdecl, importc: "GetRenderWidth".}
##  Get current render width (it considers HiDPI)

proc GetRenderHeight*(): cint {.cdecl, importc: "GetRenderHeight".}
##  Get current render height (it considers HiDPI)

proc GetMonitorCount*(): cint {.cdecl, importc: "GetMonitorCount".}
##  Get number of connected monitors

proc GetCurrentMonitor*(): cint {.cdecl, importc: "GetCurrentMonitor".}
##  Get current monitor where window is placed

proc GetMonitorPosition*(monitor: cint): Vector2 {.cdecl,
    importc: "GetMonitorPosition".}
##  Get specified monitor position

proc GetMonitorWidth*(monitor: cint): cint {.cdecl, importc: "GetMonitorWidth".}
##  Get specified monitor width (current video mode used by monitor)

proc GetMonitorHeight*(monitor: cint): cint {.cdecl, importc: "GetMonitorHeight".}
##  Get specified monitor height (current video mode used by monitor)

proc GetMonitorPhysicalWidth*(monitor: cint): cint {.cdecl,
    importc: "GetMonitorPhysicalWidth".}
##  Get specified monitor physical width in millimetres

proc GetMonitorPhysicalHeight*(monitor: cint): cint {.cdecl,
    importc: "GetMonitorPhysicalHeight".}
##  Get specified monitor physical height in millimetres

proc GetMonitorRefreshRate*(monitor: cint): cint {.cdecl,
    importc: "GetMonitorRefreshRate".}
##  Get specified monitor refresh rate

proc GetWindowPosition*(): Vector2 {.cdecl, importc: "GetWindowPosition".}
##  Get window position XY on monitor

proc GetWindowScaleDPI*(): Vector2 {.cdecl, importc: "GetWindowScaleDPI".}
##  Get window scale DPI factor

proc GetMonitorName*(monitor: cint): cstring {.cdecl, importc: "GetMonitorName".}
##  Get the human-readable, UTF-8 encoded name of the specified monitor

proc SetClipboardText*(text: cstring) {.cdecl, importc: "SetClipboardText".}
##  Set clipboard text content

proc GetClipboardText*(): cstring {.cdecl, importc: "GetClipboardText".}
##  Get clipboard text content

proc GetClipboardImage*(): Image {.cdecl, importc: "GetClipboardImage".}
##  Get clipboard image content

proc EnableEventWaiting*() {.cdecl, importc: "EnableEventWaiting".}
##  Enable waiting for events on EndDrawing(), no automatic event polling

proc DisableEventWaiting*() {.cdecl, importc: "DisableEventWaiting".}
##  Disable waiting for events on EndDrawing(), automatic events polling
##  Cursor-related functions

proc ShowCursor*() {.cdecl, importc: "ShowCursor".}
##  Shows cursor

proc HideCursor*() {.cdecl, importc: "HideCursor".}
##  Hides cursor

proc IsCursorHidden*(): bool {.cdecl, importc: "IsCursorHidden".}
##  Check if cursor is not visible

proc EnableCursor*() {.cdecl, importc: "EnableCursor".}
##  Enables cursor (unlock cursor)

proc DisableCursor*() {.cdecl, importc: "DisableCursor".}
##  Disables cursor (lock cursor)

proc IsCursorOnScreen*(): bool {.cdecl, importc: "IsCursorOnScreen".}
##  Check if cursor is on the screen
##  Drawing-related functions

proc ClearBackground*(color: Color) {.cdecl, importc: "ClearBackground".}
##  Set background color (framebuffer clear color)

proc BeginDrawing*() {.cdecl, importc: "BeginDrawing".}
##  Setup canvas (framebuffer) to start drawing

proc EndDrawing*() {.cdecl, importc: "EndDrawing".}
##  End canvas drawing and swap buffers (double buffering)

proc BeginMode2D*(camera: Camera2D) {.cdecl, importc: "BeginMode2D".}
##  Begin 2D mode with custom camera (2D)

proc EndMode2D*() {.cdecl, importc: "EndMode2D".}
##  Ends 2D mode with custom camera

proc BeginMode3D*(camera: Camera3D) {.cdecl, importc: "BeginMode3D".}
##  Begin 3D mode with custom camera (3D)

proc EndMode3D*() {.cdecl, importc: "EndMode3D".}
##  Ends 3D mode and returns to default 2D orthographic mode

proc BeginTextureMode*(target: RenderTexture2D) {.cdecl, importc: "BeginTextureMode".}
##  Begin drawing to render texture

proc EndTextureMode*() {.cdecl, importc: "EndTextureMode".}
##  Ends drawing to render texture

proc BeginShaderMode*(shader: Shader) {.cdecl, importc: "BeginShaderMode".}
##  Begin custom shader drawing

proc EndShaderMode*() {.cdecl, importc: "EndShaderMode".}
##  End custom shader drawing (use default shader)

proc BeginBlendMode*(mode: cint) {.cdecl, importc: "BeginBlendMode".}
##  Begin blending mode (alpha, additive, multiplied, subtract, custom)

proc EndBlendMode*() {.cdecl, importc: "EndBlendMode".}
##  End blending mode (reset to default: alpha blending)

proc BeginScissorMode*(x: cint; y: cint; width: cint; height: cint) {.cdecl,
    importc: "BeginScissorMode".}
##  Begin scissor mode (define screen area for following drawing)

proc EndScissorMode*() {.cdecl, importc: "EndScissorMode".}
##  End scissor mode

proc BeginVrStereoMode*(config: VrStereoConfig) {.cdecl,
    importc: "BeginVrStereoMode".}
##  Begin stereo rendering (requires VR simulator)

proc EndVrStereoMode*() {.cdecl, importc: "EndVrStereoMode".}
##  End stereo rendering (requires VR simulator)
##  VR stereo config functions for VR simulator

proc LoadVrStereoConfig*(device: VrDeviceInfo): VrStereoConfig {.cdecl,
    importc: "LoadVrStereoConfig".}
##  Load VR stereo config for VR simulator device parameters

proc UnloadVrStereoConfig*(config: VrStereoConfig) {.cdecl,
    importc: "UnloadVrStereoConfig".}
##  Unload VR stereo config
##  Shader management functions
##  NOTE: Shader functionality is not available on OpenGL 1.1

proc LoadShader*(vsFileName: cstring; fsFileName: cstring): Shader {.cdecl,
    importc: "LoadShader".}
##  Load shader from files and bind default locations

proc LoadShaderFromMemory*(vsCode: cstring; fsCode: cstring): Shader {.cdecl,
    importc: "LoadShaderFromMemory".}
##  Load shader from code strings and bind default locations

proc IsShaderValid*(shader: Shader): bool {.cdecl, importc: "IsShaderValid".}
##  Check if a shader is valid (loaded on GPU)

proc GetShaderLocation*(shader: Shader; uniformName: cstring): cint {.cdecl,
    importc: "GetShaderLocation".}
##  Get shader uniform location

proc GetShaderLocationAttrib*(shader: Shader; attribName: cstring): cint {.cdecl,
    importc: "GetShaderLocationAttrib".}
##  Get shader attribute location

proc SetShaderValue*(shader: Shader; locIndex: cint; value: pointer; uniformType: cint) {.
    cdecl, importc: "SetShaderValue".}
##  Set shader uniform value

proc SetShaderValueV*(shader: Shader; locIndex: cint; value: pointer;
                     uniformType: cint; count: cint) {.cdecl,
    importc: "SetShaderValueV".}
##  Set shader uniform value vector

proc SetShaderValueMatrix*(shader: Shader; locIndex: cint; mat: Matrix) {.cdecl,
    importc: "SetShaderValueMatrix".}
##  Set shader uniform value (matrix 4x4)

proc SetShaderValueTexture*(shader: Shader; locIndex: cint; texture: Texture2D) {.
    cdecl, importc: "SetShaderValueTexture".}
##  Set shader uniform value and bind the texture (sampler2d)

proc UnloadShader*(shader: Shader) {.cdecl, importc: "UnloadShader".}
##  Unload shader from GPU memory (VRAM)
##  Screen-space-related functions

proc GetScreenToWorldRay*(position: Vector2; camera: Camera): Ray {.cdecl,
    importc: "GetScreenToWorldRay".}
##  Get a ray trace from screen position (i.e mouse)

proc GetScreenToWorldRayEx*(position: Vector2; camera: Camera; width: cint;
                           height: cint): Ray {.cdecl,
    importc: "GetScreenToWorldRayEx".}
##  Get a ray trace from screen position (i.e mouse) in a viewport

proc GetWorldToScreen*(position: Vector3; camera: Camera): Vector2 {.cdecl,
    importc: "GetWorldToScreen".}
##  Get the screen space position for a 3d world space position

proc GetWorldToScreenEx*(position: Vector3; camera: Camera; width: cint; height: cint): Vector2 {.
    cdecl, importc: "GetWorldToScreenEx".}
##  Get size position for a 3d world space position

proc GetWorldToScreen2D*(position: Vector2; camera: Camera2D): Vector2 {.cdecl,
    importc: "GetWorldToScreen2D".}
##  Get the screen space position for a 2d camera world space position

proc GetScreenToWorld2D*(position: Vector2; camera: Camera2D): Vector2 {.cdecl,
    importc: "GetScreenToWorld2D".}
##  Get the world space position for a 2d camera screen space position

proc GetCameraMatrix*(camera: Camera): Matrix {.cdecl, importc: "GetCameraMatrix".}
##  Get camera transform matrix (view matrix)

proc GetCameraMatrix2D*(camera: Camera2D): Matrix {.cdecl,
    importc: "GetCameraMatrix2D".}
##  Get camera 2d transform matrix
##  Timing-related functions

proc SetTargetFPS*(fps: cint) {.cdecl, importc: "SetTargetFPS".}
##  Set target FPS (maximum)

proc GetFrameTime*(): cfloat {.cdecl, importc: "GetFrameTime".}
##  Get time in seconds for last frame drawn (delta time)

proc GetTime*(): cdouble {.cdecl, importc: "GetTime".}
##  Get elapsed time in seconds since InitWindow()

proc GetFPS*(): cint {.cdecl, importc: "GetFPS".}
##  Get current FPS
##  Custom frame control functions
##  NOTE: Those functions are intended for advanced users that want full control over the frame processing
##  By default EndDrawing() does this job: draws everything + SwapScreenBuffer() + manage frame timing + PollInputEvents()
##  To avoid that behaviour and control frame processes manually, enable in config.h: SUPPORT_CUSTOM_FRAME_CONTROL

proc SwapScreenBuffer*() {.cdecl, importc: "SwapScreenBuffer".}
##  Swap back buffer with front buffer (screen drawing)

proc PollInputEvents*() {.cdecl, importc: "PollInputEvents".}
##  Register all input events

proc WaitTime*(seconds: cdouble) {.cdecl, importc: "WaitTime".}
##  Wait for some time (halt program execution)
##  Random values generation functions

proc SetRandomSeed*(seed: cuint) {.cdecl, importc: "SetRandomSeed".}
##  Set the seed for the random number generator

proc GetRandomValue*(min: cint; max: cint): cint {.cdecl, importc: "GetRandomValue".}
##  Get a random value between min and max (both included)

proc LoadRandomSequence*(count: cuint; min: cint; max: cint): ptr cint {.cdecl,
    importc: "LoadRandomSequence".}
##  Load random values sequence, no values repeated

proc UnloadRandomSequence*(sequence: ptr cint) {.cdecl,
    importc: "UnloadRandomSequence".}
##  Unload random values sequence
##  Misc. functions

proc TakeScreenshot*(fileName: cstring) {.cdecl, importc: "TakeScreenshot".}
##  Takes a screenshot of current screen (filename extension defines format)

proc SetConfigFlags*(flags: cuint) {.cdecl, importc: "SetConfigFlags".}
##  Setup init configuration flags (view FLAGS)

proc OpenURL*(url: cstring) {.cdecl, importc: "OpenURL".}
##  Open URL with default system browser (if available)
##  NOTE: Following functions implemented in module [utils]
## ------------------------------------------------------------------

proc TraceLog*(logLevel: cint; text: cstring) {.varargs, cdecl, importc: "TraceLog".}
##  Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)

proc SetTraceLogLevel*(logLevel: cint) {.cdecl, importc: "SetTraceLogLevel".}
##  Set the current threshold (minimum) log level

proc MemAlloc*(size: cuint): pointer {.cdecl, importc: "MemAlloc".}
##  Internal memory allocator

proc MemRealloc*(`ptr`: pointer; size: cuint): pointer {.cdecl, importc: "MemRealloc".}
##  Internal memory reallocator

proc MemFree*(`ptr`: pointer) {.cdecl, importc: "MemFree".}
##  Internal memory free
##  Set custom callbacks
##  WARNING: Callbacks setup is intended for advanced users

proc SetTraceLogCallback*(callback: TraceLogCallback) {.cdecl,
    importc: "SetTraceLogCallback".}
##  Set custom trace log

proc SetLoadFileDataCallback*(callback: LoadFileDataCallback) {.cdecl,
    importc: "SetLoadFileDataCallback".}
##  Set custom file binary data loader

proc SetSaveFileDataCallback*(callback: SaveFileDataCallback) {.cdecl,
    importc: "SetSaveFileDataCallback".}
##  Set custom file binary data saver

proc SetLoadFileTextCallback*(callback: LoadFileTextCallback) {.cdecl,
    importc: "SetLoadFileTextCallback".}
##  Set custom file text data loader

proc SetSaveFileTextCallback*(callback: SaveFileTextCallback) {.cdecl,
    importc: "SetSaveFileTextCallback".}
##  Set custom file text data saver
##  Files management functions

proc LoadFileData*(fileName: cstring; dataSize: ptr cint): ptr uint8 {.cdecl,
    importc: "LoadFileData".}
##  Load file data as byte array (read)

proc UnloadFileData*(data: ptr uint8) {.cdecl, importc: "UnloadFileData".}
##  Unload file data allocated by LoadFileData()

proc SaveFileData*(fileName: cstring; data: pointer; dataSize: cint): bool {.cdecl,
    importc: "SaveFileData".}
##  Save data to file from byte array (write), returns true on success

proc ExportDataAsCode*(data: ptr uint8; dataSize: cint; fileName: cstring): bool {.
    cdecl, importc: "ExportDataAsCode".}
##  Export data to code (.h), returns true on success

proc LoadFileText*(fileName: cstring): cstring {.cdecl, importc: "LoadFileText".}
##  Load text data from file (read), returns a '\0' terminated string

proc UnloadFileText*(text: cstring) {.cdecl, importc: "UnloadFileText".}
##  Unload file text data allocated by LoadFileText()

proc SaveFileText*(fileName: cstring; text: cstring): bool {.cdecl,
    importc: "SaveFileText".}
##  Save text data to file (write), string must be '\0' terminated, returns true on success
## ------------------------------------------------------------------
##  File system functions

proc FileRename*(fileName: cstring; fileRename: cstring): cint {.cdecl,
    importc: "FileRename".}
##  Rename file (if exists)

proc FileRemove*(fileName: cstring): cint {.cdecl, importc: "FileRemove".}
##  Remove file (if exists)

proc FileCopy*(srcPath: cstring; dstPath: cstring): cint {.cdecl, importc: "FileCopy".}
##  Copy file from one path to another, dstPath created if it doesn't exist

proc FileMove*(srcPath: cstring; dstPath: cstring): cint {.cdecl, importc: "FileMove".}
##  Move file from one directory to another, dstPath created if it doesn't exist

proc FileTextReplace*(fileName: cstring; search: cstring; replacement: cstring): cint {.
    cdecl, importc: "FileTextReplace".}
##  Replace text in an existing file

proc FileTextFindIndex*(fileName: cstring; search: cstring): cint {.cdecl,
    importc: "FileTextFindIndex".}
##  Find text in existing file

proc FileExists*(fileName: cstring): bool {.cdecl, importc: "FileExists".}
##  Check if file exists

proc DirectoryExists*(dirPath: cstring): bool {.cdecl, importc: "DirectoryExists".}
##  Check if a directory path exists

proc IsFileExtension*(fileName: cstring; ext: cstring): bool {.cdecl,
    importc: "IsFileExtension".}
##  Check file extension (recommended include point: .png, .wav)

proc GetFileLength*(fileName: cstring): cint {.cdecl, importc: "GetFileLength".}
##  Get file length in bytes (NOTE: GetFileSize() conflicts with windows.h)

proc GetFileModTime*(fileName: cstring): clong {.cdecl, importc: "GetFileModTime".}
##  Get file modification time (last write time)

proc GetFileExtension*(fileName: cstring): cstring {.cdecl,
    importc: "GetFileExtension".}
##  Get pointer to extension for a filename string (includes dot: '.png')

proc GetFileName*(filePath: cstring): cstring {.cdecl, importc: "GetFileName".}
##  Get pointer to filename for a path string

proc GetFileNameWithoutExt*(filePath: cstring): cstring {.cdecl,
    importc: "GetFileNameWithoutExt".}
##  Get filename string without extension (uses static string)

proc GetDirectoryPath*(filePath: cstring): cstring {.cdecl,
    importc: "GetDirectoryPath".}
##  Get full path for a given fileName with path (uses static string)

proc GetPrevDirectoryPath*(dirPath: cstring): cstring {.cdecl,
    importc: "GetPrevDirectoryPath".}
##  Get previous directory path for a given path (uses static string)

proc GetWorkingDirectory*(): cstring {.cdecl, importc: "GetWorkingDirectory".}
##  Get current working directory (uses static string)

proc GetApplicationDirectory*(): cstring {.cdecl, importc: "GetApplicationDirectory".}
##  Get the directory of the running application (uses static string)

proc MakeDirectory*(dirPath: cstring): cint {.cdecl, importc: "MakeDirectory".}
##  Create directories (including full path requested), returns 0 on success

proc ChangeDirectory*(dir: cstring): bool {.cdecl, importc: "ChangeDirectory".}
##  Change working directory, return true on success

proc IsPathFile*(path: cstring): bool {.cdecl, importc: "IsPathFile".}
##  Check if a given path is a file or a directory

proc IsFileNameValid*(fileName: cstring): bool {.cdecl, importc: "IsFileNameValid".}
##  Check if fileName is valid for the platform/OS

proc LoadDirectoryFiles*(dirPath: cstring): FilePathList {.cdecl,
    importc: "LoadDirectoryFiles".}
##  Load directory filepaths

proc LoadDirectoryFilesEx*(basePath: cstring; filter: cstring; scanSubdirs: bool): FilePathList {.
    cdecl, importc: "LoadDirectoryFilesEx".}
##  Load directory filepaths with extension filtering and recursive directory scan. Use 'DIR' in the filter string to include directories in the result

proc UnloadDirectoryFiles*(files: FilePathList) {.cdecl,
    importc: "UnloadDirectoryFiles".}
##  Unload filepaths

proc IsFileDropped*(): bool {.cdecl, importc: "IsFileDropped".}
##  Check if a file has been dropped into window

proc LoadDroppedFiles*(): FilePathList {.cdecl, importc: "LoadDroppedFiles".}
##  Load dropped filepaths

proc UnloadDroppedFiles*(files: FilePathList) {.cdecl, importc: "UnloadDroppedFiles".}
##  Unload dropped filepaths
##  Compression/Encoding functionality

proc CompressData*(data: ptr uint8; dataSize: cint; compDataSize: ptr cint): ptr uint8 {.
    cdecl, importc: "CompressData".}
##  Compress data (DEFLATE algorithm), memory must be MemFree()

proc DecompressData*(compData: ptr uint8; compDataSize: cint; dataSize: ptr cint): ptr uint8 {.
    cdecl, importc: "DecompressData".}
##  Decompress data (DEFLATE algorithm), memory must be MemFree()

proc EncodeDataBase64*(data: ptr uint8; dataSize: cint; outputSize: ptr cint): cstring {.
    cdecl, importc: "EncodeDataBase64".}
##  Encode data to Base64 string (includes NULL terminator), memory must be MemFree()

proc DecodeDataBase64*(text: cstring; outputSize: ptr cint): ptr uint8 {.cdecl,
    importc: "DecodeDataBase64".}
##  Decode Base64 string (expected NULL terminated), memory must be MemFree()

proc ComputeCRC32*(data: ptr uint8; dataSize: cint): cuint {.cdecl,
    importc: "ComputeCRC32".}
##  Compute CRC32 hash code

proc ComputeMD5*(data: ptr uint8; dataSize: cint): ptr cuint {.cdecl,
    importc: "ComputeMD5".}
##  Compute MD5 hash code, returns static int[4] (16 bytes)

proc ComputeSHA1*(data: ptr uint8; dataSize: cint): ptr cuint {.cdecl,
    importc: "ComputeSHA1".}
##  Compute SHA1 hash code, returns static int[5] (20 bytes)

proc ComputeSHA256*(data: ptr uint8; dataSize: cint): ptr cuint {.cdecl,
    importc: "ComputeSHA256".}
##  Compute SHA256 hash code, returns static int[8] (32 bytes)
##  Automation events functionality

proc LoadAutomationEventList*(fileName: cstring): AutomationEventList {.cdecl,
    importc: "LoadAutomationEventList".}
##  Load automation events list from file, NULL for empty list, capacity = MAX_AUTOMATION_EVENTS

proc UnloadAutomationEventList*(list: AutomationEventList) {.cdecl,
    importc: "UnloadAutomationEventList".}
##  Unload automation events list from file

proc ExportAutomationEventList*(list: AutomationEventList; fileName: cstring): bool {.
    cdecl, importc: "ExportAutomationEventList".}
##  Export automation events list as text file

proc SetAutomationEventList*(list: ptr AutomationEventList) {.cdecl,
    importc: "SetAutomationEventList".}
##  Set automation event list to record to

proc SetAutomationEventBaseFrame*(frame: cint) {.cdecl,
    importc: "SetAutomationEventBaseFrame".}
##  Set automation event internal base frame to start recording

proc StartAutomationEventRecording*() {.cdecl,
                                      importc: "StartAutomationEventRecording".}
##  Start recording automation events (AutomationEventList must be set)

proc StopAutomationEventRecording*() {.cdecl,
                                     importc: "StopAutomationEventRecording".}
##  Stop recording automation events

proc PlayAutomationEvent*(event: AutomationEvent) {.cdecl,
    importc: "PlayAutomationEvent".}
##  Play a recorded automation event
## ------------------------------------------------------------------------------------
##  Input Handling Functions (Module: core)
## ------------------------------------------------------------------------------------
##  Input-related functions: keyboard

proc IsKeyPressed*(key: KeyboardKey): bool {.cdecl, importc: "IsKeyPressed".}
##  Check if a key has been pressed once

proc IsKeyPressedRepeat*(key: KeyboardKey): bool {.cdecl, importc: "IsKeyPressedRepeat".}
##  Check if a key has been pressed again

proc IsKeyDown*(key: KeyboardKey): bool {.cdecl, importc: "IsKeyDown".}
##  Check if a key is being pressed

proc IsKeyReleased*(key: KeyboardKey): bool {.cdecl, importc: "IsKeyReleased".}
##  Check if a key has been released once

proc IsKeyUp*(key: KeyboardKey): bool {.cdecl, importc: "IsKeyUp".}
##  Check if a key is NOT being pressed

proc GetKeyPressed*(): KeyboardKey {.cdecl, importc: "GetKeyPressed".}
##  Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty

proc GetCharPressed*(): cint {.cdecl, importc: "GetCharPressed".}
##  Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty

proc GetKeyName*(key: KeyboardKey): cstring {.cdecl, importc: "GetKeyName".}
##  Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)

proc SetExitKey*(key: KeyboardKey) {.cdecl, importc: "SetExitKey".}
##  Set a custom key to exit program (default is ESC)
##  Input-related functions: gamepads

proc IsGamepadAvailable*(gamepad: cint): bool {.cdecl, importc: "IsGamepadAvailable".}
##  Check if a gamepad is available

proc GetGamepadName*(gamepad: cint): cstring {.cdecl, importc: "GetGamepadName".}
##  Get gamepad internal name id

proc IsGamepadButtonPressed*(gamepad: cint; button: MouseButton): bool {.cdecl,
    importc: "IsGamepadButtonPressed".}
##  Check if a gamepad button has been pressed once

proc IsGamepadButtonDown*(gamepad: cint; button: MouseButton): bool {.cdecl,
    importc: "IsGamepadButtonDown".}
##  Check if a gamepad button is being pressed

proc IsGamepadButtonReleased*(gamepad: cint; button: MouseButton): bool {.cdecl,
    importc: "IsGamepadButtonReleased".}
##  Check if a gamepad button has been released once

proc IsGamepadButtonUp*(gamepad: cint; button: MouseButton): bool {.cdecl,
    importc: "IsGamepadButtonUp".}
##  Check if a gamepad button is NOT being pressed

proc GetGamepadButtonPressed*(): cint {.cdecl, importc: "GetGamepadButtonPressed".}
##  Get the last gamepad button pressed

proc GetGamepadAxisCount*(gamepad: cint): cint {.cdecl,
    importc: "GetGamepadAxisCount".}
##  Get axis count for a gamepad

proc GetGamepadAxisMovement*(gamepad: cint; axis: cint): cfloat {.cdecl,
    importc: "GetGamepadAxisMovement".}
##  Get movement value for a gamepad axis

proc SetGamepadMappings*(mappings: cstring): cint {.cdecl,
    importc: "SetGamepadMappings".}
##  Set internal gamepad mappings (SDL_GameControllerDB)

proc SetGamepadVibration*(gamepad: cint; leftMotor: cfloat; rightMotor: cfloat;
                         duration: cfloat) {.cdecl, importc: "SetGamepadVibration".}
##  Set gamepad vibration for both motors (duration in seconds)
##  Input-related functions: mouse

proc IsMouseButtonPressed*(button: MouseButton): bool {.cdecl,
    importc: "IsMouseButtonPressed".}
##  Check if a mouse button has been pressed once

proc IsMouseButtonDown*(button: MouseButton): bool {.cdecl, importc: "IsMouseButtonDown".}
##  Check if a mouse button is being pressed

proc IsMouseButtonReleased*(button: MouseButton): bool {.cdecl,
    importc: "IsMouseButtonReleased".}
##  Check if a mouse button has been released once

proc IsMouseButtonUp*(button: MouseButton): bool {.cdecl, importc: "IsMouseButtonUp".}
##  Check if a mouse button is NOT being pressed

proc GetMouseX*(): cint {.cdecl, importc: "GetMouseX".}
##  Get mouse position X

proc GetMouseY*(): cint {.cdecl, importc: "GetMouseY".}
##  Get mouse position Y

proc GetMousePosition*(): Vector2 {.cdecl, importc: "GetMousePosition".}
##  Get mouse position XY

proc GetMouseDelta*(): Vector2 {.cdecl, importc: "GetMouseDelta".}
##  Get mouse delta between frames

proc SetMousePosition*(x: cint; y: cint) {.cdecl, importc: "SetMousePosition".}
##  Set mouse position XY

proc SetMouseOffset*(offsetX: cint; offsetY: cint) {.cdecl, importc: "SetMouseOffset".}
##  Set mouse offset

proc SetMouseScale*(scaleX: cfloat; scaleY: cfloat) {.cdecl, importc: "SetMouseScale".}
##  Set mouse scaling

proc GetMouseWheelMove*(): cfloat {.cdecl, importc: "GetMouseWheelMove".}
##  Get mouse wheel movement for X or Y, whichever is larger

proc GetMouseWheelMoveV*(): Vector2 {.cdecl, importc: "GetMouseWheelMoveV".}
##  Get mouse wheel movement for both X and Y

proc SetMouseCursor*(cursor: cint) {.cdecl, importc: "SetMouseCursor".}
##  Set mouse cursor
##  Input-related functions: touch

proc GetTouchX*(): cint {.cdecl, importc: "GetTouchX".}
##  Get touch position X for touch point 0 (relative to screen size)

proc GetTouchY*(): cint {.cdecl, importc: "GetTouchY".}
##  Get touch position Y for touch point 0 (relative to screen size)

proc GetTouchPosition*(index: cint): Vector2 {.cdecl, importc: "GetTouchPosition".}
##  Get touch position XY for a touch point index (relative to screen size)

proc GetTouchPointId*(index: cint): cint {.cdecl, importc: "GetTouchPointId".}
##  Get touch point identifier for given index

proc GetTouchPointCount*(): cint {.cdecl, importc: "GetTouchPointCount".}
##  Get number of touch points
## ------------------------------------------------------------------------------------
##  Gestures and Touch Handling Functions (Module: rgestures)
## ------------------------------------------------------------------------------------

proc SetGesturesEnabled*(flags: cuint) {.cdecl, importc: "SetGesturesEnabled".}
##  Enable a set of gestures using flags

proc IsGestureDetected*(gesture: cuint): bool {.cdecl, importc: "IsGestureDetected".}
##  Check if a gesture have been detected

proc GetGestureDetected*(): cint {.cdecl, importc: "GetGestureDetected".}
##  Get latest detected gesture

proc GetGestureHoldDuration*(): cfloat {.cdecl, importc: "GetGestureHoldDuration".}
##  Get gesture hold time in seconds

proc GetGestureDragVector*(): Vector2 {.cdecl, importc: "GetGestureDragVector".}
##  Get gesture drag vector

proc GetGestureDragAngle*(): cfloat {.cdecl, importc: "GetGestureDragAngle".}
##  Get gesture drag angle

proc GetGesturePinchVector*(): Vector2 {.cdecl, importc: "GetGesturePinchVector".}
##  Get gesture pinch delta

proc GetGesturePinchAngle*(): cfloat {.cdecl, importc: "GetGesturePinchAngle".}
##  Get gesture pinch angle
## ------------------------------------------------------------------------------------
##  Camera System Functions (Module: rcamera)
## ------------------------------------------------------------------------------------

proc UpdateCamera*(camera: ptr Camera; mode: cint) {.cdecl, importc: "UpdateCamera".}
##  Update camera position for selected mode

proc UpdateCameraPro*(camera: ptr Camera; movement: Vector3; rotation: Vector3;
                     zoom: cfloat) {.cdecl, importc: "UpdateCameraPro".}
##  Update camera movement/rotation
## ------------------------------------------------------------------------------------
##  Basic Shapes Drawing Functions (Module: shapes)
## ------------------------------------------------------------------------------------
##  Set texture and rectangle to be used on shapes drawing
##  NOTE: It can be useful when using basic shapes and one single font,
##  defining a font char white rectangle would allow drawing everything in a single draw call

proc SetShapesTexture*(texture: Texture2D; source: Rectangle) {.cdecl,
    importc: "SetShapesTexture".}
##  Set texture and rectangle to be used on shapes drawing

proc GetShapesTexture*(): Texture2D {.cdecl, importc: "GetShapesTexture".}
##  Get texture that is used for shapes drawing

proc GetShapesTextureRectangle*(): Rectangle {.cdecl,
    importc: "GetShapesTextureRectangle".}
##  Get texture source rectangle that is used for shapes drawing
##  Basic shapes drawing functions

proc DrawPixel*(posX: cint; posY: cint; color: Color) {.cdecl, importc: "DrawPixel".}
##  Draw a pixel using geometry [Can be slow, use with care]

proc DrawPixelV*(position: Vector2; color: Color) {.cdecl, importc: "DrawPixelV".}
##  Draw a pixel using geometry (Vector version) [Can be slow, use with care]

proc DrawLine*(startPosX: cint; startPosY: cint; endPosX: cint; endPosY: cint;
              color: Color) {.cdecl, importc: "DrawLine".}
##  Draw a line

proc DrawLineV*(startPos: Vector2; endPos: Vector2; color: Color) {.cdecl,
    importc: "DrawLineV".}
##  Draw a line (using gl lines)

proc DrawLineEx*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.
    cdecl, importc: "DrawLineEx".}
##  Draw a line (using triangles/quads)

proc DrawLineStrip*(points: ptr Vector2; pointCount: cint; color: Color) {.cdecl,
    importc: "DrawLineStrip".}
##  Draw lines sequence (using gl lines)

proc DrawLineBezier*(startPos: Vector2; endPos: Vector2; thick: cfloat; color: Color) {.
    cdecl, importc: "DrawLineBezier".}
##  Draw line segment cubic-bezier in-out interpolation

proc DrawLineDashed*(startPos: Vector2; endPos: Vector2; dashSize: cint;
                    spaceSize: cint; color: Color) {.cdecl, importc: "DrawLineDashed".}
##  Draw a dashed line

proc DrawCircle*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.cdecl,
    importc: "DrawCircle".}
##  Draw a color-filled circle

proc DrawCircleSector*(center: Vector2; radius: cfloat; startAngle: cfloat;
                      endAngle: cfloat; segments: cint; color: Color) {.cdecl,
    importc: "DrawCircleSector".}
##  Draw a piece of a circle

proc DrawCircleSectorLines*(center: Vector2; radius: cfloat; startAngle: cfloat;
                           endAngle: cfloat; segments: cint; color: Color) {.cdecl,
    importc: "DrawCircleSectorLines".}
##  Draw circle sector outline

proc DrawCircleGradient*(centerX: cint; centerY: cint; radius: cfloat; inner: Color;
                        outer: Color) {.cdecl, importc: "DrawCircleGradient".}
##  Draw a gradient-filled circle

proc DrawCircleV*(center: Vector2; radius: cfloat; color: Color) {.cdecl,
    importc: "DrawCircleV".}
##  Draw a color-filled circle (Vector version)

proc DrawCircleLines*(centerX: cint; centerY: cint; radius: cfloat; color: Color) {.
    cdecl, importc: "DrawCircleLines".}
##  Draw circle outline

proc DrawCircleLinesV*(center: Vector2; radius: cfloat; color: Color) {.cdecl,
    importc: "DrawCircleLinesV".}
##  Draw circle outline (Vector version)

proc DrawEllipse*(centerX: cint; centerY: cint; radiusH: cfloat; radiusV: cfloat;
                 color: Color) {.cdecl, importc: "DrawEllipse".}
##  Draw ellipse

proc DrawEllipseV*(center: Vector2; radiusH: cfloat; radiusV: cfloat; color: Color) {.
    cdecl, importc: "DrawEllipseV".}
##  Draw ellipse (Vector version)

proc DrawEllipseLines*(centerX: cint; centerY: cint; radiusH: cfloat; radiusV: cfloat;
                      color: Color) {.cdecl, importc: "DrawEllipseLines".}
##  Draw ellipse outline

proc DrawEllipseLinesV*(center: Vector2; radiusH: cfloat; radiusV: cfloat; color: Color) {.
    cdecl, importc: "DrawEllipseLinesV".}
##  Draw ellipse outline (Vector version)

proc DrawRing*(center: Vector2; innerRadius: cfloat; outerRadius: cfloat;
              startAngle: cfloat; endAngle: cfloat; segments: cint; color: Color) {.
    cdecl, importc: "DrawRing".}
##  Draw ring

proc DrawRingLines*(center: Vector2; innerRadius: cfloat; outerRadius: cfloat;
                   startAngle: cfloat; endAngle: cfloat; segments: cint; color: Color) {.
    cdecl, importc: "DrawRingLines".}
##  Draw ring outline

proc DrawRectangle*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.
    cdecl, importc: "DrawRectangle".}
##  Draw a color-filled rectangle

proc DrawRectangleV*(position: Vector2; size: Vector2; color: Color) {.cdecl,
    importc: "DrawRectangleV".}
##  Draw a color-filled rectangle (Vector version)

proc DrawRectangleRec*(rec: Rectangle; color: Color) {.cdecl,
    importc: "DrawRectangleRec".}
##  Draw a color-filled rectangle

proc DrawRectanglePro*(rec: Rectangle; origin: Vector2; rotation: cfloat; color: Color) {.
    cdecl, importc: "DrawRectanglePro".}
##  Draw a color-filled rectangle with pro parameters

proc DrawRectangleGradientV*(posX: cint; posY: cint; width: cint; height: cint;
                            top: Color; bottom: Color) {.cdecl,
    importc: "DrawRectangleGradientV".}
##  Draw a vertical-gradient-filled rectangle

proc DrawRectangleGradientH*(posX: cint; posY: cint; width: cint; height: cint;
                            left: Color; right: Color) {.cdecl,
    importc: "DrawRectangleGradientH".}
##  Draw a horizontal-gradient-filled rectangle

proc DrawRectangleGradientEx*(rec: Rectangle; topLeft: Color; bottomLeft: Color;
                             bottomRight: Color; topRight: Color) {.cdecl,
    importc: "DrawRectangleGradientEx".}
##  Draw a gradient-filled rectangle with custom vertex colors

proc DrawRectangleLines*(posX: cint; posY: cint; width: cint; height: cint; color: Color) {.
    cdecl, importc: "DrawRectangleLines".}
##  Draw rectangle outline

proc DrawRectangleLinesEx*(rec: Rectangle; lineThick: cfloat; color: Color) {.cdecl,
    importc: "DrawRectangleLinesEx".}
##  Draw rectangle outline with extended parameters

proc DrawRectangleRounded*(rec: Rectangle; roundness: cfloat; segments: cint;
                          color: Color) {.cdecl, importc: "DrawRectangleRounded".}
##  Draw rectangle with rounded edges

proc DrawRectangleRoundedLines*(rec: Rectangle; roundness: cfloat; segments: cint;
                               color: Color) {.cdecl,
    importc: "DrawRectangleRoundedLines".}
##  Draw rectangle lines with rounded edges

proc DrawRectangleRoundedLinesEx*(rec: Rectangle; roundness: cfloat; segments: cint;
                                 lineThick: cfloat; color: Color) {.cdecl,
    importc: "DrawRectangleRoundedLinesEx".}
##  Draw rectangle with rounded edges outline

proc DrawTriangle*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.cdecl,
    importc: "DrawTriangle".}
##  Draw a color-filled triangle (vertex in counter-clockwise order!)

proc DrawTriangleLines*(v1: Vector2; v2: Vector2; v3: Vector2; color: Color) {.cdecl,
    importc: "DrawTriangleLines".}
##  Draw triangle outline (vertex in counter-clockwise order!)

proc DrawTriangleFan*(points: ptr Vector2; pointCount: cint; color: Color) {.cdecl,
    importc: "DrawTriangleFan".}
##  Draw a triangle fan defined by points (first vertex is the center)

proc DrawTriangleStrip*(points: ptr Vector2; pointCount: cint; color: Color) {.cdecl,
    importc: "DrawTriangleStrip".}
##  Draw a triangle strip defined by points

proc DrawPoly*(center: Vector2; sides: cint; radius: cfloat; rotation: cfloat;
              color: Color) {.cdecl, importc: "DrawPoly".}
##  Draw a regular polygon (Vector version)

proc DrawPolyLines*(center: Vector2; sides: cint; radius: cfloat; rotation: cfloat;
                   color: Color) {.cdecl, importc: "DrawPolyLines".}
##  Draw a polygon outline of n sides

proc DrawPolyLinesEx*(center: Vector2; sides: cint; radius: cfloat; rotation: cfloat;
                     lineThick: cfloat; color: Color) {.cdecl,
    importc: "DrawPolyLinesEx".}
##  Draw a polygon outline of n sides with extended parameters
##  Splines drawing functions

proc DrawSplineLinear*(points: ptr Vector2; pointCount: cint; thick: cfloat;
                      color: Color) {.cdecl, importc: "DrawSplineLinear".}
##  Draw spline: Linear, minimum 2 points

proc DrawSplineBasis*(points: ptr Vector2; pointCount: cint; thick: cfloat; color: Color) {.
    cdecl, importc: "DrawSplineBasis".}
##  Draw spline: B-Spline, minimum 4 points

proc DrawSplineCatmullRom*(points: ptr Vector2; pointCount: cint; thick: cfloat;
                          color: Color) {.cdecl, importc: "DrawSplineCatmullRom".}
##  Draw spline: Catmull-Rom, minimum 4 points

proc DrawSplineBezierQuadratic*(points: ptr Vector2; pointCount: cint; thick: cfloat;
                               color: Color) {.cdecl,
    importc: "DrawSplineBezierQuadratic".}
##  Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]

proc DrawSplineBezierCubic*(points: ptr Vector2; pointCount: cint; thick: cfloat;
                           color: Color) {.cdecl, importc: "DrawSplineBezierCubic".}
##  Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]

proc DrawSplineSegmentLinear*(p1: Vector2; p2: Vector2; thick: cfloat; color: Color) {.
    cdecl, importc: "DrawSplineSegmentLinear".}
##  Draw spline segment: Linear, 2 points

proc DrawSplineSegmentBasis*(p1: Vector2; p2: Vector2; p3: Vector2; p4: Vector2;
                            thick: cfloat; color: Color) {.cdecl,
    importc: "DrawSplineSegmentBasis".}
##  Draw spline segment: B-Spline, 4 points

proc DrawSplineSegmentCatmullRom*(p1: Vector2; p2: Vector2; p3: Vector2; p4: Vector2;
                                 thick: cfloat; color: Color) {.cdecl,
    importc: "DrawSplineSegmentCatmullRom".}
##  Draw spline segment: Catmull-Rom, 4 points

proc DrawSplineSegmentBezierQuadratic*(p1: Vector2; c2: Vector2; p3: Vector2;
                                      thick: cfloat; color: Color) {.cdecl,
    importc: "DrawSplineSegmentBezierQuadratic".}
##  Draw spline segment: Quadratic Bezier, 2 points, 1 control point

proc DrawSplineSegmentBezierCubic*(p1: Vector2; c2: Vector2; c3: Vector2; p4: Vector2;
                                  thick: cfloat; color: Color) {.cdecl,
    importc: "DrawSplineSegmentBezierCubic".}
##  Draw spline segment: Cubic Bezier, 2 points, 2 control points
##  Spline segment point evaluation functions, for a given t [0.0f .. 1.0f]

proc GetSplinePointLinear*(startPos: Vector2; endPos: Vector2; t: cfloat): Vector2 {.
    cdecl, importc: "GetSplinePointLinear".}
##  Get (evaluate) spline point: Linear

proc GetSplinePointBasis*(p1: Vector2; p2: Vector2; p3: Vector2; p4: Vector2; t: cfloat): Vector2 {.
    cdecl, importc: "GetSplinePointBasis".}
##  Get (evaluate) spline point: B-Spline

proc GetSplinePointCatmullRom*(p1: Vector2; p2: Vector2; p3: Vector2; p4: Vector2;
                              t: cfloat): Vector2 {.cdecl,
    importc: "GetSplinePointCatmullRom".}
##  Get (evaluate) spline point: Catmull-Rom

proc GetSplinePointBezierQuad*(p1: Vector2; c2: Vector2; p3: Vector2; t: cfloat): Vector2 {.
    cdecl, importc: "GetSplinePointBezierQuad".}
##  Get (evaluate) spline point: Quadratic Bezier

proc GetSplinePointBezierCubic*(p1: Vector2; c2: Vector2; c3: Vector2; p4: Vector2;
                               t: cfloat): Vector2 {.cdecl,
    importc: "GetSplinePointBezierCubic".}
##  Get (evaluate) spline point: Cubic Bezier
##  Basic shapes collision detection functions

proc CheckCollisionRecs*(rec1: Rectangle; rec2: Rectangle): bool {.cdecl,
    importc: "CheckCollisionRecs".}
##  Check collision between two rectangles

proc CheckCollisionCircles*(center1: Vector2; radius1: cfloat; center2: Vector2;
                           radius2: cfloat): bool {.cdecl,
    importc: "CheckCollisionCircles".}
##  Check collision between two circles

proc CheckCollisionCircleRec*(center: Vector2; radius: cfloat; rec: Rectangle): bool {.
    cdecl, importc: "CheckCollisionCircleRec".}
##  Check collision between circle and rectangle

proc CheckCollisionCircleLine*(center: Vector2; radius: cfloat; p1: Vector2;
                              p2: Vector2): bool {.cdecl,
    importc: "CheckCollisionCircleLine".}
##  Check if circle collides with a line created betweeen two points [p1] and [p2]

proc CheckCollisionPointRec*(point: Vector2; rec: Rectangle): bool {.cdecl,
    importc: "CheckCollisionPointRec".}
##  Check if point is inside rectangle

proc CheckCollisionPointCircle*(point: Vector2; center: Vector2; radius: cfloat): bool {.
    cdecl, importc: "CheckCollisionPointCircle".}
##  Check if point is inside circle

proc CheckCollisionPointTriangle*(point: Vector2; p1: Vector2; p2: Vector2; p3: Vector2): bool {.
    cdecl, importc: "CheckCollisionPointTriangle".}
##  Check if point is inside a triangle

proc CheckCollisionPointLine*(point: Vector2; p1: Vector2; p2: Vector2; threshold: cint): bool {.
    cdecl, importc: "CheckCollisionPointLine".}
##  Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]

proc CheckCollisionPointPoly*(point: Vector2; points: ptr Vector2; pointCount: cint): bool {.
    cdecl, importc: "CheckCollisionPointPoly".}
##  Check if point is within a polygon described by array of vertices

proc CheckCollisionLines*(startPos1: Vector2; endPos1: Vector2; startPos2: Vector2;
                         endPos2: Vector2; collisionPoint: ptr Vector2): bool {.cdecl,
    importc: "CheckCollisionLines".}
##  Check the collision between two lines defined by two points each, returns collision point by reference

proc GetCollisionRec*(rec1: Rectangle; rec2: Rectangle): Rectangle {.cdecl,
    importc: "GetCollisionRec".}
##  Get collision rectangle for two rectangles collision
## ------------------------------------------------------------------------------------
##  Texture Loading and Drawing Functions (Module: textures)
## ------------------------------------------------------------------------------------
##  Image loading functions
##  NOTE: These functions do not require GPU access

proc LoadImage*(fileName: cstring): Image {.cdecl, importc: "LoadImage".}
##  Load image from file into CPU memory (RAM)

proc LoadImageRaw*(fileName: cstring; width: cint; height: cint; format: cint;
                  headerSize: cint): Image {.cdecl, importc: "LoadImageRaw".}
##  Load image from RAW file data

proc LoadImageAnim*(fileName: cstring; frames: ptr cint): Image {.cdecl,
    importc: "LoadImageAnim".}
##  Load image sequence from file (frames appended to image.data)

proc LoadImageAnimFromMemory*(fileType: cstring; fileData: ptr uint8; dataSize: cint;
                             frames: ptr cint): Image {.cdecl,
    importc: "LoadImageAnimFromMemory".}
##  Load image sequence from memory buffer

proc LoadImageFromMemory*(fileType: cstring; fileData: ptr uint8; dataSize: cint): Image {.
    cdecl, importc: "LoadImageFromMemory".}
##  Load image from memory buffer, fileType refers to extension: i.e. '.png'

proc LoadImageFromTexture*(texture: Texture2D): Image {.cdecl,
    importc: "LoadImageFromTexture".}
##  Load image from GPU texture data

proc LoadImageFromScreen*(): Image {.cdecl, importc: "LoadImageFromScreen".}
##  Load image from screen buffer and (screenshot)

proc IsImageValid*(image: Image): bool {.cdecl, importc: "IsImageValid".}
##  Check if an image is valid (data and parameters)

proc UnloadImage*(image: Image) {.cdecl, importc: "UnloadImage".}
##  Unload image from CPU memory (RAM)

proc ExportImage*(image: Image; fileName: cstring): bool {.cdecl,
    importc: "ExportImage".}
##  Export image data to file, returns true on success

proc ExportImageToMemory*(image: Image; fileType: cstring; fileSize: ptr cint): ptr uint8 {.
    cdecl, importc: "ExportImageToMemory".}
##  Export image to memory buffer

proc ExportImageAsCode*(image: Image; fileName: cstring): bool {.cdecl,
    importc: "ExportImageAsCode".}
##  Export image as code file defining an array of bytes, returns true on success
##  Image generation functions

proc GenImageColor*(width: cint; height: cint; color: Color): Image {.cdecl,
    importc: "GenImageColor".}
##  Generate image: plain color

proc GenImageGradientLinear*(width: cint; height: cint; direction: cint; start: Color;
                            `end`: Color): Image {.cdecl,
    importc: "GenImageGradientLinear".}
##  Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient

proc GenImageGradientRadial*(width: cint; height: cint; density: cfloat; inner: Color;
                            outer: Color): Image {.cdecl,
    importc: "GenImageGradientRadial".}
##  Generate image: radial gradient

proc GenImageGradientSquare*(width: cint; height: cint; density: cfloat; inner: Color;
                            outer: Color): Image {.cdecl,
    importc: "GenImageGradientSquare".}
##  Generate image: square gradient

proc GenImageChecked*(width: cint; height: cint; checksX: cint; checksY: cint;
                     col1: Color; col2: Color): Image {.cdecl,
    importc: "GenImageChecked".}
##  Generate image: checked

proc GenImageWhiteNoise*(width: cint; height: cint; factor: cfloat): Image {.cdecl,
    importc: "GenImageWhiteNoise".}
##  Generate image: white noise

proc GenImagePerlinNoise*(width: cint; height: cint; offsetX: cint; offsetY: cint;
                         scale: cfloat): Image {.cdecl,
    importc: "GenImagePerlinNoise".}
##  Generate image: perlin noise

proc GenImageCellular*(width: cint; height: cint; tileSize: cint): Image {.cdecl,
    importc: "GenImageCellular".}
##  Generate image: cellular algorithm, bigger tileSize means bigger cells

proc GenImageText*(width: cint; height: cint; text: cstring): Image {.cdecl,
    importc: "GenImageText".}
##  Generate image: grayscale image from text data
##  Image manipulation functions

proc ImageCopy*(image: Image): Image {.cdecl, importc: "ImageCopy".}
##  Create an image duplicate (useful for transformations)

proc ImageFromImage*(image: Image; rec: Rectangle): Image {.cdecl,
    importc: "ImageFromImage".}
##  Create an image from another image piece

proc ImageFromChannel*(image: Image; selectedChannel: cint): Image {.cdecl,
    importc: "ImageFromChannel".}
##  Create an image from a selected channel of another image (GRAYSCALE)

proc ImageText*(text: cstring; fontSize: cint; color: Color): Image {.cdecl,
    importc: "ImageText".}
##  Create an image from text (default font)

proc ImageTextEx*(font: Font; text: cstring; fontSize: cfloat; spacing: cfloat;
                 tint: Color): Image {.cdecl, importc: "ImageTextEx".}
##  Create an image from text (custom sprite font)

proc ImageFormat*(image: ptr Image; newFormat: cint) {.cdecl, importc: "ImageFormat".}
##  Convert image data to desired format

proc ImageToPOT*(image: ptr Image; fill: Color) {.cdecl, importc: "ImageToPOT".}
##  Convert image to POT (power-of-two)

proc ImageCrop*(image: ptr Image; crop: Rectangle) {.cdecl, importc: "ImageCrop".}
##  Crop an image to a defined rectangle

proc ImageAlphaCrop*(image: ptr Image; threshold: cfloat) {.cdecl,
    importc: "ImageAlphaCrop".}
##  Crop image depending on alpha value

proc ImageAlphaClear*(image: ptr Image; color: Color; threshold: cfloat) {.cdecl,
    importc: "ImageAlphaClear".}
##  Clear alpha channel to desired color

proc ImageAlphaMask*(image: ptr Image; alphaMask: Image) {.cdecl,
    importc: "ImageAlphaMask".}
##  Apply alpha mask to image

proc ImageAlphaPremultiply*(image: ptr Image) {.cdecl,
    importc: "ImageAlphaPremultiply".}
##  Premultiply alpha channel

proc ImageBlurGaussian*(image: ptr Image; blurSize: cint) {.cdecl,
    importc: "ImageBlurGaussian".}
##  Apply Gaussian blur using a box blur approximation

proc ImageKernelConvolution*(image: ptr Image; kernel: ptr cfloat; kernelSize: cint) {.
    cdecl, importc: "ImageKernelConvolution".}
##  Apply custom square convolution kernel to image

proc ImageResize*(image: ptr Image; newWidth: cint; newHeight: cint) {.cdecl,
    importc: "ImageResize".}
##  Resize image (Bicubic scaling algorithm)

proc ImageResizeNN*(image: ptr Image; newWidth: cint; newHeight: cint) {.cdecl,
    importc: "ImageResizeNN".}
##  Resize image (Nearest-Neighbor scaling algorithm)

proc ImageResizeCanvas*(image: ptr Image; newWidth: cint; newHeight: cint;
                       offsetX: cint; offsetY: cint; fill: Color) {.cdecl,
    importc: "ImageResizeCanvas".}
##  Resize canvas and fill with color

proc ImageMipmaps*(image: ptr Image) {.cdecl, importc: "ImageMipmaps".}
##  Compute all mipmap levels for a provided image

proc ImageDither*(image: ptr Image; rBpp: cint; gBpp: cint; bBpp: cint; aBpp: cint) {.cdecl,
    importc: "ImageDither".}
##  Dither image data to 16bpp or lower (Floyd-Steinberg dithering)

proc ImageFlipVertical*(image: ptr Image) {.cdecl, importc: "ImageFlipVertical".}
##  Flip image vertically

proc ImageFlipHorizontal*(image: ptr Image) {.cdecl, importc: "ImageFlipHorizontal".}
##  Flip image horizontally

proc ImageRotate*(image: ptr Image; degrees: cint) {.cdecl, importc: "ImageRotate".}
##  Rotate image by input angle in degrees (-359 to 359)

proc ImageRotateCW*(image: ptr Image) {.cdecl, importc: "ImageRotateCW".}
##  Rotate image clockwise 90deg

proc ImageRotateCCW*(image: ptr Image) {.cdecl, importc: "ImageRotateCCW".}
##  Rotate image counter-clockwise 90deg

proc ImageColorTint*(image: ptr Image; color: Color) {.cdecl, importc: "ImageColorTint".}
##  Modify image color: tint

proc ImageColorInvert*(image: ptr Image) {.cdecl, importc: "ImageColorInvert".}
##  Modify image color: invert

proc ImageColorGrayscale*(image: ptr Image) {.cdecl, importc: "ImageColorGrayscale".}
##  Modify image color: grayscale

proc ImageColorContrast*(image: ptr Image; contrast: cfloat) {.cdecl,
    importc: "ImageColorContrast".}
##  Modify image color: contrast (-100 to 100)

proc ImageColorBrightness*(image: ptr Image; brightness: cint) {.cdecl,
    importc: "ImageColorBrightness".}
##  Modify image color: brightness (-255 to 255)

proc ImageColorReplace*(image: ptr Image; color: Color; replace: Color) {.cdecl,
    importc: "ImageColorReplace".}
##  Modify image color: replace color

proc LoadImageColors*(image: Image): ptr Color {.cdecl, importc: "LoadImageColors".}
##  Load color data from image as a Color array (RGBA - 32bit)

proc LoadImagePalette*(image: Image; maxPaletteSize: cint; colorCount: ptr cint): ptr Color {.
    cdecl, importc: "LoadImagePalette".}
##  Load colors palette from image as a Color array (RGBA - 32bit)

proc UnloadImageColors*(colors: ptr Color) {.cdecl, importc: "UnloadImageColors".}
##  Unload color data loaded with LoadImageColors()

proc UnloadImagePalette*(colors: ptr Color) {.cdecl, importc: "UnloadImagePalette".}
##  Unload colors palette loaded with LoadImagePalette()

proc GetImageAlphaBorder*(image: Image; threshold: cfloat): Rectangle {.cdecl,
    importc: "GetImageAlphaBorder".}
##  Get image alpha border rectangle

proc GetImageColor*(image: Image; x: cint; y: cint): Color {.cdecl,
    importc: "GetImageColor".}
##  Get image pixel color at (x, y) position
##  Image drawing functions
##  NOTE: Image software-rendering functions (CPU)

proc ImageClearBackground*(dst: ptr Image; color: Color) {.cdecl,
    importc: "ImageClearBackground".}
##  Clear image background with given color

proc ImageDrawPixel*(dst: ptr Image; posX: cint; posY: cint; color: Color) {.cdecl,
    importc: "ImageDrawPixel".}
##  Draw pixel within an image

proc ImageDrawPixelV*(dst: ptr Image; position: Vector2; color: Color) {.cdecl,
    importc: "ImageDrawPixelV".}
##  Draw pixel within an image (Vector version)

proc ImageDrawLine*(dst: ptr Image; startPosX: cint; startPosY: cint; endPosX: cint;
                   endPosY: cint; color: Color) {.cdecl, importc: "ImageDrawLine".}
##  Draw line within an image

proc ImageDrawLineV*(dst: ptr Image; start: Vector2; `end`: Vector2; color: Color) {.
    cdecl, importc: "ImageDrawLineV".}
##  Draw line within an image (Vector version)

proc ImageDrawLineEx*(dst: ptr Image; start: Vector2; `end`: Vector2; thick: cint;
                     color: Color) {.cdecl, importc: "ImageDrawLineEx".}
##  Draw a line defining thickness within an image

proc ImageDrawCircle*(dst: ptr Image; centerX: cint; centerY: cint; radius: cint;
                     color: Color) {.cdecl, importc: "ImageDrawCircle".}
##  Draw a filled circle within an image

proc ImageDrawCircleV*(dst: ptr Image; center: Vector2; radius: cint; color: Color) {.
    cdecl, importc: "ImageDrawCircleV".}
##  Draw a filled circle within an image (Vector version)

proc ImageDrawCircleLines*(dst: ptr Image; centerX: cint; centerY: cint; radius: cint;
                          color: Color) {.cdecl, importc: "ImageDrawCircleLines".}
##  Draw circle outline within an image

proc ImageDrawCircleLinesV*(dst: ptr Image; center: Vector2; radius: cint; color: Color) {.
    cdecl, importc: "ImageDrawCircleLinesV".}
##  Draw circle outline within an image (Vector version)

proc ImageDrawRectangle*(dst: ptr Image; posX: cint; posY: cint; width: cint;
                        height: cint; color: Color) {.cdecl,
    importc: "ImageDrawRectangle".}
##  Draw rectangle within an image

proc ImageDrawRectangleV*(dst: ptr Image; position: Vector2; size: Vector2; color: Color) {.
    cdecl, importc: "ImageDrawRectangleV".}
##  Draw rectangle within an image (Vector version)

proc ImageDrawRectangleRec*(dst: ptr Image; rec: Rectangle; color: Color) {.cdecl,
    importc: "ImageDrawRectangleRec".}
##  Draw rectangle within an image

proc ImageDrawRectangleLines*(dst: ptr Image; rec: Rectangle; thick: cint; color: Color) {.
    cdecl, importc: "ImageDrawRectangleLines".}
##  Draw rectangle lines within an image

proc ImageDrawTriangle*(dst: ptr Image; v1: Vector2; v2: Vector2; v3: Vector2;
                       color: Color) {.cdecl, importc: "ImageDrawTriangle".}
##  Draw triangle within an image

proc ImageDrawTriangleEx*(dst: ptr Image; v1: Vector2; v2: Vector2; v3: Vector2;
                         c1: Color; c2: Color; c3: Color) {.cdecl,
    importc: "ImageDrawTriangleEx".}
##  Draw triangle with interpolated colors within an image

proc ImageDrawTriangleLines*(dst: ptr Image; v1: Vector2; v2: Vector2; v3: Vector2;
                            color: Color) {.cdecl,
    importc: "ImageDrawTriangleLines".}
##  Draw triangle outline within an image

proc ImageDrawTriangleFan*(dst: ptr Image; points: ptr Vector2; pointCount: cint;
                          color: Color) {.cdecl, importc: "ImageDrawTriangleFan".}
##  Draw a triangle fan defined by points within an image (first vertex is the center)

proc ImageDrawTriangleStrip*(dst: ptr Image; points: ptr Vector2; pointCount: cint;
                            color: Color) {.cdecl,
    importc: "ImageDrawTriangleStrip".}
##  Draw a triangle strip defined by points within an image

proc ImageDraw*(dst: ptr Image; src: Image; srcRec: Rectangle; dstRec: Rectangle;
               tint: Color) {.cdecl, importc: "ImageDraw".}
##  Draw a source image within a destination image (tint applied to source)

proc ImageDrawText*(dst: ptr Image; text: cstring; posX: cint; posY: cint; fontSize: cint;
                   color: Color) {.cdecl, importc: "ImageDrawText".}
##  Draw text (using default font) within an image (destination)

proc ImageDrawTextEx*(dst: ptr Image; font: Font; text: cstring; position: Vector2;
                     fontSize: cfloat; spacing: cfloat; tint: Color) {.cdecl,
    importc: "ImageDrawTextEx".}
##  Draw text (custom sprite font) within an image (destination)
##  Texture loading functions
##  NOTE: These functions require GPU access

proc LoadTexture*(fileName: cstring): Texture2D {.cdecl, importc: "LoadTexture".}
##  Load texture from file into GPU memory (VRAM)

proc LoadTextureFromImage*(image: Image): Texture2D {.cdecl,
    importc: "LoadTextureFromImage".}
##  Load texture from image data

proc LoadTextureCubemap*(image: Image; layout: cint): TextureCubemap {.cdecl,
    importc: "LoadTextureCubemap".}
##  Load cubemap from image, multiple image cubemap layouts supported

proc LoadRenderTexture*(width: cint; height: cint): RenderTexture2D {.cdecl,
    importc: "LoadRenderTexture".}
##  Load texture for rendering (framebuffer)

proc IsTextureValid*(texture: Texture2D): bool {.cdecl, importc: "IsTextureValid".}
##  Check if a texture is valid (loaded in GPU)

proc UnloadTexture*(texture: Texture2D) {.cdecl, importc: "UnloadTexture".}
##  Unload texture from GPU memory (VRAM)

proc IsRenderTextureValid*(target: RenderTexture2D): bool {.cdecl,
    importc: "IsRenderTextureValid".}
##  Check if a render texture is valid (loaded in GPU)

proc UnloadRenderTexture*(target: RenderTexture2D) {.cdecl,
    importc: "UnloadRenderTexture".}
##  Unload render texture from GPU memory (VRAM)

proc UpdateTexture*(texture: Texture2D; pixels: pointer) {.cdecl,
    importc: "UpdateTexture".}
##  Update GPU texture with new data (pixels should be able to fill texture)

proc UpdateTextureRec*(texture: Texture2D; rec: Rectangle; pixels: pointer) {.cdecl,
    importc: "UpdateTextureRec".}
##  Update GPU texture rectangle with new data (pixels and rec should fit in texture)
##  Texture configuration functions

proc GenTextureMipmaps*(texture: ptr Texture2D) {.cdecl, importc: "GenTextureMipmaps".}
##  Generate GPU mipmaps for a texture

proc SetTextureFilter*(texture: Texture2D; filter: cint) {.cdecl,
    importc: "SetTextureFilter".}
##  Set texture scaling filter mode

proc SetTextureWrap*(texture: Texture2D; wrap: cint) {.cdecl,
    importc: "SetTextureWrap".}
##  Set texture wrapping mode
##  Texture drawing functions

proc DrawTexture*(texture: Texture2D; posX: cint; posY: cint; tint: Color) {.cdecl,
    importc: "DrawTexture".}
##  Draw a Texture2D

proc DrawTextureV*(texture: Texture2D; position: Vector2; tint: Color) {.cdecl,
    importc: "DrawTextureV".}
##  Draw a Texture2D with position defined as Vector2

proc DrawTextureEx*(texture: Texture2D; position: Vector2; rotation: cfloat;
                   scale: cfloat; tint: Color) {.cdecl, importc: "DrawTextureEx".}
##  Draw a Texture2D with extended parameters

proc DrawTextureRec*(texture: Texture2D; source: Rectangle; position: Vector2;
                    tint: Color) {.cdecl, importc: "DrawTextureRec".}
##  Draw a part of a texture defined by a rectangle

proc DrawTexturePro*(texture: Texture2D; source: Rectangle; dest: Rectangle;
                    origin: Vector2; rotation: cfloat; tint: Color) {.cdecl,
    importc: "DrawTexturePro".}
##  Draw a part of a texture defined by a rectangle with 'pro' parameters

proc DrawTextureNPatch*(texture: Texture2D; nPatchInfo: NPatchInfo; dest: Rectangle;
                       origin: Vector2; rotation: cfloat; tint: Color) {.cdecl,
    importc: "DrawTextureNPatch".}
##  Draws a texture (or part of it) that stretches or shrinks nicely
##  Color/pixel related functions

proc ColorIsEqual*(col1: Color; col2: Color): bool {.cdecl, importc: "ColorIsEqual".}
##  Check if two colors are equal

proc Fade*(color: Color; alpha: cfloat): Color {.cdecl, importc: "Fade".}
##  Get color with alpha applied, alpha goes from 0.0f to 1.0f

proc ColorToInt*(color: Color): cint {.cdecl, importc: "ColorToInt".}
##  Get hexadecimal value for a Color (0xRRGGBBAA)

proc ColorNormalize*(color: Color): Vector4 {.cdecl, importc: "ColorNormalize".}
##  Get Color normalized as float [0..1]

proc ColorFromNormalized*(normalized: Vector4): Color {.cdecl,
    importc: "ColorFromNormalized".}
##  Get Color from normalized values [0..1]

proc ColorToHSV*(color: Color): Vector3 {.cdecl, importc: "ColorToHSV".}
##  Get HSV values for a Color, hue [0..360], saturation/value [0..1]

proc ColorFromHSV*(hue: cfloat; saturation: cfloat; value: cfloat): Color {.cdecl,
    importc: "ColorFromHSV".}
##  Get a Color from HSV values, hue [0..360], saturation/value [0..1]

proc ColorTint*(color: Color; tint: Color): Color {.cdecl, importc: "ColorTint".}
##  Get color multiplied with another color

proc ColorBrightness*(color: Color; factor: cfloat): Color {.cdecl,
    importc: "ColorBrightness".}
##  Get color with brightness correction, brightness factor goes from -1.0f to 1.0f

proc ColorContrast*(color: Color; contrast: cfloat): Color {.cdecl,
    importc: "ColorContrast".}
##  Get color with contrast correction, contrast values between -1.0f and 1.0f

proc ColorAlpha*(color: Color; alpha: cfloat): Color {.cdecl, importc: "ColorAlpha".}
##  Get color with alpha applied, alpha goes from 0.0f to 1.0f

proc ColorAlphaBlend*(dst: Color; src: Color; tint: Color): Color {.cdecl,
    importc: "ColorAlphaBlend".}
##  Get src alpha-blended into dst color with tint

proc ColorLerp*(color1: Color; color2: Color; factor: cfloat): Color {.cdecl,
    importc: "ColorLerp".}
##  Get color lerp interpolation between two colors, factor [0.0f..1.0f]

proc GetColor*(hexValue: cuint): Color {.cdecl, importc: "GetColor".}
##  Get Color structure from hexadecimal value

proc GetPixelColor*(srcPtr: pointer; format: cint): Color {.cdecl,
    importc: "GetPixelColor".}
##  Get Color from a source pixel pointer of certain format

proc SetPixelColor*(dstPtr: pointer; color: Color; format: cint) {.cdecl,
    importc: "SetPixelColor".}
##  Set color formatted into destination pixel pointer

proc GetPixelDataSize*(width: cint; height: cint; format: cint): cint {.cdecl,
    importc: "GetPixelDataSize".}
##  Get pixel data size in bytes for certain format
## ------------------------------------------------------------------------------------
##  Font Loading and Text Drawing Functions (Module: text)
## ------------------------------------------------------------------------------------
##  Font loading/unloading functions

proc GetFontDefault*(): Font {.cdecl, importc: "GetFontDefault".}
##  Get the default Font

proc LoadFont*(fileName: cstring): Font {.cdecl, importc: "LoadFont".}
##  Load font from file into GPU memory (VRAM)

proc LoadFontEx*(fileName: cstring; fontSize: cint; codepoints: ptr cint;
                codepointCount: cint): Font {.cdecl, importc: "LoadFontEx".}
##  Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height

proc LoadFontFromImage*(image: Image; key: Color; firstChar: cint): Font {.cdecl,
    importc: "LoadFontFromImage".}
##  Load font from Image (XNA style)

proc LoadFontFromMemory*(fileType: cstring; fileData: ptr uint8; dataSize: cint;
                        fontSize: cint; codepoints: ptr cint; codepointCount: cint): Font {.
    cdecl, importc: "LoadFontFromMemory".}
##  Load font from memory buffer, fileType refers to extension: i.e. '.ttf'

proc IsFontValid*(font: Font): bool {.cdecl, importc: "IsFontValid".}
##  Check if a font is valid (font data loaded, WARNING: GPU texture not checked)

proc LoadFontData*(fileData: ptr uint8; dataSize: cint; fontSize: cint;
                  codepoints: ptr cint; codepointCount: cint; `type`: cint;
                  glyphCount: ptr cint): ptr GlyphInfo {.cdecl,
    importc: "LoadFontData".}
##  Load font data for further use

proc GenImageFontAtlas*(glyphs: ptr GlyphInfo; glyphRecs: ptr ptr Rectangle;
                       glyphCount: cint; fontSize: cint; padding: cint;
                       packMethod: cint): Image {.cdecl,
    importc: "GenImageFontAtlas".}
##  Generate image font atlas using chars info

proc UnloadFontData*(glyphs: ptr GlyphInfo; glyphCount: cint) {.cdecl,
    importc: "UnloadFontData".}
##  Unload font chars info data (RAM)

proc UnloadFont*(font: Font) {.cdecl, importc: "UnloadFont".}
##  Unload font from GPU memory (VRAM)

proc ExportFontAsCode*(font: Font; fileName: cstring): bool {.cdecl,
    importc: "ExportFontAsCode".}
##  Export font as code file, returns true on success
##  Text drawing functions

proc DrawFPS*(posX: cint; posY: cint) {.cdecl, importc: "DrawFPS".}
##  Draw current FPS

proc DrawText*(text: cstring; posX: cint; posY: cint; fontSize: cint; color: Color) {.
    cdecl, importc: "DrawText".}
##  Draw text (using default font)

proc DrawTextEx*(font: Font; text: cstring; position: Vector2; fontSize: cfloat;
                spacing: cfloat; tint: Color) {.cdecl, importc: "DrawTextEx".}
##  Draw text using font and additional parameters

proc DrawTextPro*(font: Font; text: cstring; position: Vector2; origin: Vector2;
                 rotation: cfloat; fontSize: cfloat; spacing: cfloat; tint: Color) {.
    cdecl, importc: "DrawTextPro".}
##  Draw text using Font and pro parameters (rotation)

proc DrawTextCodepoint*(font: Font; codepoint: cint; position: Vector2;
                       fontSize: cfloat; tint: Color) {.cdecl,
    importc: "DrawTextCodepoint".}
##  Draw one character (codepoint)

proc DrawTextCodepoints*(font: Font; codepoints: ptr cint; codepointCount: cint;
                        position: Vector2; fontSize: cfloat; spacing: cfloat;
                        tint: Color) {.cdecl, importc: "DrawTextCodepoints".}
##  Draw multiple character (codepoint)
##  Text font info functions

proc SetTextLineSpacing*(spacing: cint) {.cdecl, importc: "SetTextLineSpacing".}
##  Set vertical line spacing when drawing with line-breaks

proc MeasureText*(text: cstring; fontSize: cint): cint {.cdecl, importc: "MeasureText".}
##  Measure string width for default font

proc MeasureTextEx*(font: Font; text: cstring; fontSize: cfloat; spacing: cfloat): Vector2 {.
    cdecl, importc: "MeasureTextEx".}
##  Measure string size for Font

proc GetGlyphIndex*(font: Font; codepoint: cint): cint {.cdecl,
    importc: "GetGlyphIndex".}
##  Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found

proc GetGlyphInfo*(font: Font; codepoint: cint): GlyphInfo {.cdecl,
    importc: "GetGlyphInfo".}
##  Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found

proc GetGlyphAtlasRec*(font: Font; codepoint: cint): Rectangle {.cdecl,
    importc: "GetGlyphAtlasRec".}
##  Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
##  Text codepoints management functions (unicode characters)

proc LoadUTF8*(codepoints: ptr cint; length: cint): cstring {.cdecl, importc: "LoadUTF8".}
##  Load UTF-8 text encoded from codepoints array

proc UnloadUTF8*(text: cstring) {.cdecl, importc: "UnloadUTF8".}
##  Unload UTF-8 text encoded from codepoints array

proc LoadCodepoints*(text: cstring; count: ptr cint): ptr cint {.cdecl,
    importc: "LoadCodepoints".}
##  Load all codepoints from a UTF-8 text string, codepoints count returned by parameter

proc UnloadCodepoints*(codepoints: ptr cint) {.cdecl, importc: "UnloadCodepoints".}
##  Unload codepoints data from memory

proc GetCodepointCount*(text: cstring): cint {.cdecl, importc: "GetCodepointCount".}
##  Get total number of codepoints in a UTF-8 encoded string

proc GetCodepoint*(text: cstring; codepointSize: ptr cint): cint {.cdecl,
    importc: "GetCodepoint".}
##  Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure

proc GetCodepointNext*(text: cstring; codepointSize: ptr cint): cint {.cdecl,
    importc: "GetCodepointNext".}
##  Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure

proc GetCodepointPrevious*(text: cstring; codepointSize: ptr cint): cint {.cdecl,
    importc: "GetCodepointPrevious".}
##  Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure

proc CodepointToUTF8*(codepoint: cint; utf8Size: ptr cint): cstring {.cdecl,
    importc: "CodepointToUTF8".}
##  Encode one codepoint into UTF-8 byte array (array length returned as parameter)
##  Text strings management functions (no UTF-8 strings, only byte chars)
##  WARNING 1: Most of these functions use internal static buffers[], it's recommended to store returned data on user-side for re-use
##  WARNING 2: Some strings allocate memory internally for the returned strings, those strings must be free by user using MemFree()

proc LoadTextLines*(text: cstring; count: ptr cint): cstringArray {.cdecl,
    importc: "LoadTextLines".}
##  Load text as separate lines ('\n')

proc UnloadTextLines*(text: cstringArray; lineCount: cint) {.cdecl,
    importc: "UnloadTextLines".}
##  Unload text lines

proc TextCopy*(dst: cstring; src: cstring): cint {.cdecl, importc: "TextCopy".}
##  Copy one string to another, returns bytes copied

proc TextIsEqual*(text1: cstring; text2: cstring): bool {.cdecl, importc: "TextIsEqual".}
##  Check if two text string are equal

proc TextLength*(text: cstring): cuint {.cdecl, importc: "TextLength".}
##  Get text length, checks for '\0' ending

proc TextFormat*(text: cstring): cstring {.varargs, cdecl, importc: "TextFormat".}
##  Text formatting with variables (sprintf() style)

proc TextSubtext*(text: cstring; position: cint; length: cint): cstring {.cdecl,
    importc: "TextSubtext".}
##  Get a piece of a text string

proc TextRemoveSpaces*(text: cstring): cstring {.cdecl, importc: "TextRemoveSpaces".}
##  Remove text spaces, concat words

proc GetTextBetween*(text: cstring; begin: cstring; `end`: cstring): cstring {.cdecl,
    importc: "GetTextBetween".}
##  Get text between two strings

proc TextReplace*(text: cstring; search: cstring; replacement: cstring): cstring {.
    cdecl, importc: "TextReplace".}
##  Replace text string (WARNING: memory must be freed!)

proc TextReplaceBetween*(text: cstring; begin: cstring; `end`: cstring;
                        replacement: cstring): cstring {.cdecl,
    importc: "TextReplaceBetween".}
##  Replace text between two specific strings (WARNING: memory must be freed!)

proc TextInsert*(text: cstring; insert: cstring; position: cint): cstring {.cdecl,
    importc: "TextInsert".}
##  Insert text in a position (WARNING: memory must be freed!)

proc TextJoin*(textList: cstringArray; count: cint; delimiter: cstring): cstring {.
    cdecl, importc: "TextJoin".}
##  Join text strings with delimiter

proc TextSplit*(text: cstring; delimiter: char; count: ptr cint): cstringArray {.cdecl,
    importc: "TextSplit".}
##  Split text into multiple strings, using MAX_TEXTSPLIT_COUNT static strings

proc TextAppend*(text: cstring; append: cstring; position: ptr cint) {.cdecl,
    importc: "TextAppend".}
##  Append text at specific position and move cursor

proc TextFindIndex*(text: cstring; search: cstring): cint {.cdecl,
    importc: "TextFindIndex".}
##  Find first text occurrence within a string, -1 if not found

proc TextToUpper*(text: cstring): cstring {.cdecl, importc: "TextToUpper".}
##  Get upper case version of provided string

proc TextToLower*(text: cstring): cstring {.cdecl, importc: "TextToLower".}
##  Get lower case version of provided string

proc TextToPascal*(text: cstring): cstring {.cdecl, importc: "TextToPascal".}
##  Get Pascal case notation version of provided string

proc TextToSnake*(text: cstring): cstring {.cdecl, importc: "TextToSnake".}
##  Get Snake case notation version of provided string

proc TextToCamel*(text: cstring): cstring {.cdecl, importc: "TextToCamel".}
##  Get Camel case notation version of provided string

proc TextToInteger*(text: cstring): cint {.cdecl, importc: "TextToInteger".}
##  Get integer value from text

proc TextToFloat*(text: cstring): cfloat {.cdecl, importc: "TextToFloat".}
##  Get float value from text
## ------------------------------------------------------------------------------------
##  Basic 3d Shapes Drawing Functions (Module: models)
## ------------------------------------------------------------------------------------
##  Basic geometric 3D shapes drawing functions

proc DrawLine3D*(startPos: Vector3; endPos: Vector3; color: Color) {.cdecl,
    importc: "DrawLine3D".}
##  Draw a line in 3D world space

proc DrawPoint3D*(position: Vector3; color: Color) {.cdecl, importc: "DrawPoint3D".}
##  Draw a point in 3D space, actually a small line

proc DrawCircle3D*(center: Vector3; radius: cfloat; rotationAxis: Vector3;
                  rotationAngle: cfloat; color: Color) {.cdecl,
    importc: "DrawCircle3D".}
##  Draw a circle in 3D world space

proc DrawTriangle3D*(v1: Vector3; v2: Vector3; v3: Vector3; color: Color) {.cdecl,
    importc: "DrawTriangle3D".}
##  Draw a color-filled triangle (vertex in counter-clockwise order!)

proc DrawTriangleStrip3D*(points: ptr Vector3; pointCount: cint; color: Color) {.cdecl,
    importc: "DrawTriangleStrip3D".}
##  Draw a triangle strip defined by points

proc DrawCube*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
              color: Color) {.cdecl, importc: "DrawCube".}
##  Draw cube

proc DrawCubeV*(position: Vector3; size: Vector3; color: Color) {.cdecl,
    importc: "DrawCubeV".}
##  Draw cube (Vector version)

proc DrawCubeWires*(position: Vector3; width: cfloat; height: cfloat; length: cfloat;
                   color: Color) {.cdecl, importc: "DrawCubeWires".}
##  Draw cube wires

proc DrawCubeWiresV*(position: Vector3; size: Vector3; color: Color) {.cdecl,
    importc: "DrawCubeWiresV".}
##  Draw cube wires (Vector version)

proc DrawSphere*(centerPos: Vector3; radius: cfloat; color: Color) {.cdecl,
    importc: "DrawSphere".}
##  Draw sphere

proc DrawSphereEx*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                  color: Color) {.cdecl, importc: "DrawSphereEx".}
##  Draw sphere with extended parameters

proc DrawSphereWires*(centerPos: Vector3; radius: cfloat; rings: cint; slices: cint;
                     color: Color) {.cdecl, importc: "DrawSphereWires".}
##  Draw sphere wires

proc DrawCylinder*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                  height: cfloat; slices: cint; color: Color) {.cdecl,
    importc: "DrawCylinder".}
##  Draw a cylinder/cone

proc DrawCylinderEx*(startPos: Vector3; endPos: Vector3; startRadius: cfloat;
                    endRadius: cfloat; sides: cint; color: Color) {.cdecl,
    importc: "DrawCylinderEx".}
##  Draw a cylinder with base at startPos and top at endPos

proc DrawCylinderWires*(position: Vector3; radiusTop: cfloat; radiusBottom: cfloat;
                       height: cfloat; slices: cint; color: Color) {.cdecl,
    importc: "DrawCylinderWires".}
##  Draw a cylinder/cone wires

proc DrawCylinderWiresEx*(startPos: Vector3; endPos: Vector3; startRadius: cfloat;
                         endRadius: cfloat; sides: cint; color: Color) {.cdecl,
    importc: "DrawCylinderWiresEx".}
##  Draw a cylinder wires with base at startPos and top at endPos

proc DrawCapsule*(startPos: Vector3; endPos: Vector3; radius: cfloat; slices: cint;
                 rings: cint; color: Color) {.cdecl, importc: "DrawCapsule".}
##  Draw a capsule with the center of its sphere caps at startPos and endPos

proc DrawCapsuleWires*(startPos: Vector3; endPos: Vector3; radius: cfloat;
                      slices: cint; rings: cint; color: Color) {.cdecl,
    importc: "DrawCapsuleWires".}
##  Draw capsule wireframe with the center of its sphere caps at startPos and endPos

proc DrawPlane*(centerPos: Vector3; size: Vector2; color: Color) {.cdecl,
    importc: "DrawPlane".}
##  Draw a plane XZ

proc DrawRay*(ray: Ray; color: Color) {.cdecl, importc: "DrawRay".}
##  Draw a ray line

proc DrawGrid*(slices: cint; spacing: cfloat) {.cdecl, importc: "DrawGrid".}
##  Draw a grid (centered at (0, 0, 0))
## ------------------------------------------------------------------------------------
##  Model 3d Loading and Drawing Functions (Module: models)
## ------------------------------------------------------------------------------------
##  Model management functions

proc LoadModel*(fileName: cstring): Model {.cdecl, importc: "LoadModel".}
##  Load model from files (meshes and materials)

proc LoadModelFromMesh*(mesh: Mesh): Model {.cdecl, importc: "LoadModelFromMesh".}
##  Load model from generated mesh (default material)

proc IsModelValid*(model: Model): bool {.cdecl, importc: "IsModelValid".}
##  Check if a model is valid (loaded in GPU, VAO/VBOs)

proc UnloadModel*(model: Model) {.cdecl, importc: "UnloadModel".}
##  Unload model (including meshes) from memory (RAM and/or VRAM)

proc GetModelBoundingBox*(model: Model): BoundingBox {.cdecl,
    importc: "GetModelBoundingBox".}
##  Compute model bounding box limits (considers all meshes)
##  Model drawing functions

proc DrawModel*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.cdecl,
    importc: "DrawModel".}
##  Draw a model (with texture if set)

proc DrawModelEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                 rotationAngle: cfloat; scale: Vector3; tint: Color) {.cdecl,
    importc: "DrawModelEx".}
##  Draw a model with extended parameters

proc DrawModelWires*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.
    cdecl, importc: "DrawModelWires".}
##  Draw a model wires (with texture if set)

proc DrawModelWiresEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                      rotationAngle: cfloat; scale: Vector3; tint: Color) {.cdecl,
    importc: "DrawModelWiresEx".}
##  Draw a model wires (with texture if set) with extended parameters

proc DrawModelPoints*(model: Model; position: Vector3; scale: cfloat; tint: Color) {.
    cdecl, importc: "DrawModelPoints".}
##  Draw a model as points

proc DrawModelPointsEx*(model: Model; position: Vector3; rotationAxis: Vector3;
                       rotationAngle: cfloat; scale: Vector3; tint: Color) {.cdecl,
    importc: "DrawModelPointsEx".}
##  Draw a model as points with extended parameters

proc DrawBoundingBox*(box: BoundingBox; color: Color) {.cdecl,
    importc: "DrawBoundingBox".}
##  Draw bounding box (wires)

proc DrawBillboard*(camera: Camera; texture: Texture2D; position: Vector3;
                   scale: cfloat; tint: Color) {.cdecl, importc: "DrawBillboard".}
##  Draw a billboard texture

proc DrawBillboardRec*(camera: Camera; texture: Texture2D; source: Rectangle;
                      position: Vector3; size: Vector2; tint: Color) {.cdecl,
    importc: "DrawBillboardRec".}
##  Draw a billboard texture defined by source

proc DrawBillboardPro*(camera: Camera; texture: Texture2D; source: Rectangle;
                      position: Vector3; up: Vector3; size: Vector2; origin: Vector2;
                      rotation: cfloat; tint: Color) {.cdecl,
    importc: "DrawBillboardPro".}
##  Draw a billboard texture defined by source and rotation
##  Mesh management functions

proc UploadMesh*(mesh: ptr Mesh; dynamic: bool) {.cdecl, importc: "UploadMesh".}
##  Upload mesh vertex data in GPU and provide VAO/VBO ids

proc UpdateMeshBuffer*(mesh: Mesh; index: cint; data: pointer; dataSize: cint;
                      offset: cint) {.cdecl, importc: "UpdateMeshBuffer".}
##  Update mesh vertex data in GPU for a specific buffer index

proc UnloadMesh*(mesh: Mesh) {.cdecl, importc: "UnloadMesh".}
##  Unload mesh data from CPU and GPU

proc DrawMesh*(mesh: Mesh; material: Material; transform: Matrix) {.cdecl,
    importc: "DrawMesh".}
##  Draw a 3d mesh with material and transform

proc DrawMeshInstanced*(mesh: Mesh; material: Material; transforms: ptr Matrix;
                       instances: cint) {.cdecl, importc: "DrawMeshInstanced".}
##  Draw multiple mesh instances with material and different transforms

proc GetMeshBoundingBox*(mesh: Mesh): BoundingBox {.cdecl,
    importc: "GetMeshBoundingBox".}
##  Compute mesh bounding box limits

proc GenMeshTangents*(mesh: ptr Mesh) {.cdecl, importc: "GenMeshTangents".}
##  Compute mesh tangents

proc ExportMesh*(mesh: Mesh; fileName: cstring): bool {.cdecl, importc: "ExportMesh".}
##  Export mesh data to file, returns true on success

proc ExportMeshAsCode*(mesh: Mesh; fileName: cstring): bool {.cdecl,
    importc: "ExportMeshAsCode".}
##  Export mesh as code file (.h) defining multiple arrays of vertex attributes
##  Mesh generation functions

proc GenMeshPoly*(sides: cint; radius: cfloat): Mesh {.cdecl, importc: "GenMeshPoly".}
##  Generate polygonal mesh

proc GenMeshPlane*(width: cfloat; length: cfloat; resX: cint; resZ: cint): Mesh {.cdecl,
    importc: "GenMeshPlane".}
##  Generate plane mesh (with subdivisions)

proc GenMeshCube*(width: cfloat; height: cfloat; length: cfloat): Mesh {.cdecl,
    importc: "GenMeshCube".}
##  Generate cuboid mesh

proc GenMeshSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.cdecl,
    importc: "GenMeshSphere".}
##  Generate sphere mesh (standard sphere)

proc GenMeshHemiSphere*(radius: cfloat; rings: cint; slices: cint): Mesh {.cdecl,
    importc: "GenMeshHemiSphere".}
##  Generate half-sphere mesh (no bottom cap)

proc GenMeshCylinder*(radius: cfloat; height: cfloat; slices: cint): Mesh {.cdecl,
    importc: "GenMeshCylinder".}
##  Generate cylinder mesh

proc GenMeshCone*(radius: cfloat; height: cfloat; slices: cint): Mesh {.cdecl,
    importc: "GenMeshCone".}
##  Generate cone/pyramid mesh

proc GenMeshTorus*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.cdecl,
    importc: "GenMeshTorus".}
##  Generate torus mesh

proc GenMeshKnot*(radius: cfloat; size: cfloat; radSeg: cint; sides: cint): Mesh {.cdecl,
    importc: "GenMeshKnot".}
##  Generate trefoil knot mesh

proc GenMeshHeightmap*(heightmap: Image; size: Vector3): Mesh {.cdecl,
    importc: "GenMeshHeightmap".}
##  Generate heightmap mesh from image data

proc GenMeshCubicmap*(cubicmap: Image; cubeSize: Vector3): Mesh {.cdecl,
    importc: "GenMeshCubicmap".}
##  Generate cubes-based map mesh from image data
##  Material loading/unloading functions

proc LoadMaterials*(fileName: cstring; materialCount: ptr cint): ptr Material {.cdecl,
    importc: "LoadMaterials".}
##  Load materials from model file

proc LoadMaterialDefault*(): Material {.cdecl, importc: "LoadMaterialDefault".}
##  Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)

proc IsMaterialValid*(material: Material): bool {.cdecl, importc: "IsMaterialValid".}
##  Check if a material is valid (shader assigned, map textures loaded in GPU)

proc UnloadMaterial*(material: Material) {.cdecl, importc: "UnloadMaterial".}
##  Unload material from GPU memory (VRAM)

proc SetMaterialTexture*(material: ptr Material; mapType: cint; texture: Texture2D) {.
    cdecl, importc: "SetMaterialTexture".}
##  Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)

proc SetModelMeshMaterial*(model: ptr Model; meshId: cint; materialId: cint) {.cdecl,
    importc: "SetModelMeshMaterial".}
##  Set material for a mesh
##  Model animations loading/unloading functions

proc LoadModelAnimations*(fileName: cstring; animCount: ptr cint): ptr ModelAnimation {.
    cdecl, importc: "LoadModelAnimations".}
##  Load model animations from file

proc UpdateModelAnimation*(model: Model; anim: ModelAnimation; frame: cint) {.cdecl,
    importc: "UpdateModelAnimation".}
##  Update model animation pose (CPU)

proc UpdateModelAnimationBones*(model: Model; anim: ModelAnimation; frame: cint) {.
    cdecl, importc: "UpdateModelAnimationBones".}
##  Update model animation mesh bone matrices (GPU skinning)

proc UnloadModelAnimation*(anim: ModelAnimation) {.cdecl,
    importc: "UnloadModelAnimation".}
##  Unload animation data

proc UnloadModelAnimations*(animations: ptr ModelAnimation; animCount: cint) {.cdecl,
    importc: "UnloadModelAnimations".}
##  Unload animation array data

proc IsModelAnimationValid*(model: Model; anim: ModelAnimation): bool {.cdecl,
    importc: "IsModelAnimationValid".}
##  Check model animation skeleton match
##  Collision detection functions

proc CheckCollisionSpheres*(center1: Vector3; radius1: cfloat; center2: Vector3;
                           radius2: cfloat): bool {.cdecl,
    importc: "CheckCollisionSpheres".}
##  Check collision between two spheres

proc CheckCollisionBoxes*(box1: BoundingBox; box2: BoundingBox): bool {.cdecl,
    importc: "CheckCollisionBoxes".}
##  Check collision between two bounding boxes

proc CheckCollisionBoxSphere*(box: BoundingBox; center: Vector3; radius: cfloat): bool {.
    cdecl, importc: "CheckCollisionBoxSphere".}
##  Check collision between box and sphere

proc GetRayCollisionSphere*(ray: Ray; center: Vector3; radius: cfloat): RayCollision {.
    cdecl, importc: "GetRayCollisionSphere".}
##  Get collision info between ray and sphere

proc GetRayCollisionBox*(ray: Ray; box: BoundingBox): RayCollision {.cdecl,
    importc: "GetRayCollisionBox".}
##  Get collision info between ray and box

proc GetRayCollisionMesh*(ray: Ray; mesh: Mesh; transform: Matrix): RayCollision {.
    cdecl, importc: "GetRayCollisionMesh".}
##  Get collision info between ray and mesh

proc GetRayCollisionTriangle*(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3): RayCollision {.
    cdecl, importc: "GetRayCollisionTriangle".}
##  Get collision info between ray and triangle

proc GetRayCollisionQuad*(ray: Ray; p1: Vector3; p2: Vector3; p3: Vector3; p4: Vector3): RayCollision {.
    cdecl, importc: "GetRayCollisionQuad".}
##  Get collision info between ray and quad
## ------------------------------------------------------------------------------------
##  Audio Loading and Playing Functions (Module: audio)
## ------------------------------------------------------------------------------------

type
  AudioCallback* = proc (bufferData: pointer; frames: cuint) {.cdecl.}

##  Audio device management functions

proc InitAudioDevice*() {.cdecl, importc: "InitAudioDevice".}
##  Initialize audio device and context

proc CloseAudioDevice*() {.cdecl, importc: "CloseAudioDevice".}
##  Close the audio device and context

proc IsAudioDeviceReady*(): bool {.cdecl, importc: "IsAudioDeviceReady".}
##  Check if audio device has been initialized successfully

proc SetMasterVolume*(volume: cfloat) {.cdecl, importc: "SetMasterVolume".}
##  Set master volume (listener)

proc GetMasterVolume*(): cfloat {.cdecl, importc: "GetMasterVolume".}
##  Get master volume (listener)
##  Wave/Sound loading/unloading functions

proc LoadWave*(fileName: cstring): Wave {.cdecl, importc: "LoadWave".}
##  Load wave data from file

proc LoadWaveFromMemory*(fileType: cstring; fileData: ptr uint8; dataSize: cint): Wave {.
    cdecl, importc: "LoadWaveFromMemory".}
##  Load wave from memory buffer, fileType refers to extension: i.e. '.wav'

proc IsWaveValid*(wave: Wave): bool {.cdecl, importc: "IsWaveValid".}
##  Checks if wave data is valid (data loaded and parameters)

proc LoadSound*(fileName: cstring): Sound {.cdecl, importc: "LoadSound".}
##  Load sound from file

proc LoadSoundFromWave*(wave: Wave): Sound {.cdecl, importc: "LoadSoundFromWave".}
##  Load sound from wave data

proc LoadSoundAlias*(source: Sound): Sound {.cdecl, importc: "LoadSoundAlias".}
##  Create a new sound that shares the same sample data as the source sound, does not own the sound data

proc IsSoundValid*(sound: Sound): bool {.cdecl, importc: "IsSoundValid".}
##  Checks if a sound is valid (data loaded and buffers initialized)

proc UpdateSound*(sound: Sound; data: pointer; sampleCount: cint) {.cdecl,
    importc: "UpdateSound".}
##  Update sound buffer with new data (data and frame count should fit in sound)

proc UnloadWave*(wave: Wave) {.cdecl, importc: "UnloadWave".}
##  Unload wave data

proc UnloadSound*(sound: Sound) {.cdecl, importc: "UnloadSound".}
##  Unload sound

proc UnloadSoundAlias*(alias: Sound) {.cdecl, importc: "UnloadSoundAlias".}
##  Unload a sound alias (does not deallocate sample data)

proc ExportWave*(wave: Wave; fileName: cstring): bool {.cdecl, importc: "ExportWave".}
##  Export wave data to file, returns true on success

proc ExportWaveAsCode*(wave: Wave; fileName: cstring): bool {.cdecl,
    importc: "ExportWaveAsCode".}
##  Export wave sample data to code (.h), returns true on success
##  Wave/Sound management functions

proc PlaySound*(sound: Sound) {.cdecl, importc: "PlaySound".}
##  Play a sound

proc StopSound*(sound: Sound) {.cdecl, importc: "StopSound".}
##  Stop playing a sound

proc PauseSound*(sound: Sound) {.cdecl, importc: "PauseSound".}
##  Pause a sound

proc ResumeSound*(sound: Sound) {.cdecl, importc: "ResumeSound".}
##  Resume a paused sound

proc IsSoundPlaying*(sound: Sound): bool {.cdecl, importc: "IsSoundPlaying".}
##  Check if a sound is currently playing

proc SetSoundVolume*(sound: Sound; volume: cfloat) {.cdecl, importc: "SetSoundVolume".}
##  Set volume for a sound (1.0 is max level)

proc SetSoundPitch*(sound: Sound; pitch: cfloat) {.cdecl, importc: "SetSoundPitch".}
##  Set pitch for a sound (1.0 is base level)

proc SetSoundPan*(sound: Sound; pan: cfloat) {.cdecl, importc: "SetSoundPan".}
##  Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)

proc WaveCopy*(wave: Wave): Wave {.cdecl, importc: "WaveCopy".}
##  Copy a wave to a new wave

proc WaveCrop*(wave: ptr Wave; initFrame: cint; finalFrame: cint) {.cdecl,
    importc: "WaveCrop".}
##  Crop a wave to defined frames range

proc WaveFormat*(wave: ptr Wave; sampleRate: cint; sampleSize: cint; channels: cint) {.
    cdecl, importc: "WaveFormat".}
##  Convert wave data to desired format

proc LoadWaveSamples*(wave: Wave): ptr cfloat {.cdecl, importc: "LoadWaveSamples".}
##  Load samples data from wave as a 32bit float data array

proc UnloadWaveSamples*(samples: ptr cfloat) {.cdecl, importc: "UnloadWaveSamples".}
##  Unload samples data loaded with LoadWaveSamples()
##  Music management functions

proc LoadMusicStream*(fileName: cstring): Music {.cdecl, importc: "LoadMusicStream".}
##  Load music stream from file

proc LoadMusicStreamFromMemory*(fileType: cstring; data: ptr uint8; dataSize: cint): Music {.
    cdecl, importc: "LoadMusicStreamFromMemory".}
##  Load music stream from data

proc IsMusicValid*(music: Music): bool {.cdecl, importc: "IsMusicValid".}
##  Checks if a music stream is valid (context and buffers initialized)

proc UnloadMusicStream*(music: Music) {.cdecl, importc: "UnloadMusicStream".}
##  Unload music stream

proc PlayMusicStream*(music: Music) {.cdecl, importc: "PlayMusicStream".}
##  Start music playing

proc IsMusicStreamPlaying*(music: Music): bool {.cdecl,
    importc: "IsMusicStreamPlaying".}
##  Check if music is playing

proc UpdateMusicStream*(music: Music) {.cdecl, importc: "UpdateMusicStream".}
##  Updates buffers for music streaming

proc StopMusicStream*(music: Music) {.cdecl, importc: "StopMusicStream".}
##  Stop music playing

proc PauseMusicStream*(music: Music) {.cdecl, importc: "PauseMusicStream".}
##  Pause music playing

proc ResumeMusicStream*(music: Music) {.cdecl, importc: "ResumeMusicStream".}
##  Resume playing paused music

proc SeekMusicStream*(music: Music; position: cfloat) {.cdecl,
    importc: "SeekMusicStream".}
##  Seek music to a position (in seconds)

proc SetMusicVolume*(music: Music; volume: cfloat) {.cdecl, importc: "SetMusicVolume".}
##  Set volume for music (1.0 is max level)

proc SetMusicPitch*(music: Music; pitch: cfloat) {.cdecl, importc: "SetMusicPitch".}
##  Set pitch for a music (1.0 is base level)

proc SetMusicPan*(music: Music; pan: cfloat) {.cdecl, importc: "SetMusicPan".}
##  Set pan for a music (-1.0 left, 0.0 center, 1.0 right)

proc GetMusicTimeLength*(music: Music): cfloat {.cdecl, importc: "GetMusicTimeLength".}
##  Get music time length (in seconds)

proc GetMusicTimePlayed*(music: Music): cfloat {.cdecl, importc: "GetMusicTimePlayed".}
##  Get current music time played (in seconds)
##  AudioStream management functions

proc LoadAudioStream*(sampleRate: cuint; sampleSize: cuint; channels: cuint): AudioStream {.
    cdecl, importc: "LoadAudioStream".}
##  Load audio stream (to stream raw audio pcm data)

proc IsAudioStreamValid*(stream: AudioStream): bool {.cdecl,
    importc: "IsAudioStreamValid".}
##  Checks if an audio stream is valid (buffers initialized)

proc UnloadAudioStream*(stream: AudioStream) {.cdecl, importc: "UnloadAudioStream".}
##  Unload audio stream and free memory

proc UpdateAudioStream*(stream: AudioStream; data: pointer; frameCount: cint) {.cdecl,
    importc: "UpdateAudioStream".}
##  Update audio stream buffers with data

proc IsAudioStreamProcessed*(stream: AudioStream): bool {.cdecl,
    importc: "IsAudioStreamProcessed".}
##  Check if any audio stream buffers requires refill

proc PlayAudioStream*(stream: AudioStream) {.cdecl, importc: "PlayAudioStream".}
##  Play audio stream

proc PauseAudioStream*(stream: AudioStream) {.cdecl, importc: "PauseAudioStream".}
##  Pause audio stream

proc ResumeAudioStream*(stream: AudioStream) {.cdecl, importc: "ResumeAudioStream".}
##  Resume audio stream

proc IsAudioStreamPlaying*(stream: AudioStream): bool {.cdecl,
    importc: "IsAudioStreamPlaying".}
##  Check if audio stream is playing

proc StopAudioStream*(stream: AudioStream) {.cdecl, importc: "StopAudioStream".}
##  Stop audio stream

proc SetAudioStreamVolume*(stream: AudioStream; volume: cfloat) {.cdecl,
    importc: "SetAudioStreamVolume".}
##  Set volume for audio stream (1.0 is max level)

proc SetAudioStreamPitch*(stream: AudioStream; pitch: cfloat) {.cdecl,
    importc: "SetAudioStreamPitch".}
##  Set pitch for audio stream (1.0 is base level)

proc SetAudioStreamPan*(stream: AudioStream; pan: cfloat) {.cdecl,
    importc: "SetAudioStreamPan".}
##  Set pan for audio stream (0.5 is centered)

proc SetAudioStreamBufferSizeDefault*(size: cint) {.cdecl,
    importc: "SetAudioStreamBufferSizeDefault".}
##  Default size for new audio streams

proc SetAudioStreamCallback*(stream: AudioStream; callback: AudioCallback) {.cdecl,
    importc: "SetAudioStreamCallback".}
##  Audio thread callback to request new data

proc AttachAudioStreamProcessor*(stream: AudioStream; processor: AudioCallback) {.
    cdecl, importc: "AttachAudioStreamProcessor".}
##  Attach audio stream processor to stream, receives frames x 2 samples as 'float' (stereo)

proc DetachAudioStreamProcessor*(stream: AudioStream; processor: AudioCallback) {.
    cdecl, importc: "DetachAudioStreamProcessor".}
##  Detach audio stream processor from stream

proc AttachAudioMixedProcessor*(processor: AudioCallback) {.cdecl,
    importc: "AttachAudioMixedProcessor".}
##  Attach audio stream processor to the entire audio pipeline, receives frames x 2 samples as 'float' (stereo)

proc DetachAudioMixedProcessor*(processor: AudioCallback) {.cdecl,
    importc: "DetachAudioMixedProcessor".}
##  Detach audio stream processor from the entire audio pipeline

## Macros and templates

template draw*(body: untyped) =
  BeginDrawing()
  defer: EndDrawing()
  body