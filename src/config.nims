when defined(emscripten):
  --nimcache:build_wasm
  --os:linux
  --cpu:wasm32
  --cc:clang

  when defined(windows):
    --clang.exe:emcc.bat
    --clang.linkerexe:emcc.bat
    --clang.cpp.exe:emcc.bat
    --clang.cpp.linkerexe:emcc.bat

  --listCmd
  --gc:arc
  --exceptions:goto
  --define:noSignalHandler

  switch("passL", "-o web/index.html")

  # Emscripten must provide GLFW symbols for raylib web builds
  switch("passL", "-s USE_GLFW=3")
