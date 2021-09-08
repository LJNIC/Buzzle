return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 14,
  height = 7,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 3,
  nextobjectid = 9,
  properties = {},
  tilesets = {
    {
      name = "tileset1",
      firstgid = 1,
      filename = "tileset1.tsx"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 14,
      height = 7,
      id = 1,
      name = "tiles",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 31, 31, 31, 31, 31, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 41, 31, 31, 31, 31, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 31, 31, 31, 31, 31, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 31, 31, 31, 31, 31, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 41, 41, 31, 31, 31, 52, 52, 52, 52, 52,
        52, 52, 52, 52, 53, 53, 41, 41, 41, 52, 52, 52, 52, 52
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "player",
          shape = "rectangle",
          x = 128,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 38,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        }
      }
    }
  }
}