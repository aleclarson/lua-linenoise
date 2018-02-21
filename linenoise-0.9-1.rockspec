package = 'linenoise'
version = '0.9-1'
source = {
  url = 'https://github.com/aleclarson/lua-linenoise',
}
description = {
  summary  = 'A binding for the linenoise command line library',
  homepage = 'https://github.com/hoelzro/lua-linenoise',
  license  = 'MIT/X11',
}
dependencies = {
  'lua >= 5.1'
}

build = {
  type    = 'builtin',
  modules = {
    linenoise = {
      sources   = { 'linenoise.c', 'linenoiselib.c' },
    },
  },
  platforms = {
    win32 = {
      modules = {
        linenoise = {
          sources   = { 'linenoise.c', 'linenoiselib.c', 'win32fixes.c' },
          libraries = { 'ws2_32' },
        },
      },
    },
  },
}
