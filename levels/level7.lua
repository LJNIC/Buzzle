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
  nextobjectid = 59,
  properties = {
    ["attack"] = 1,
    ["block"] = 1,
    ["disarm"] = 1,
    ["move1"] = 1,
    ["move2"] = 1,
    ["move3"] = 1,
    ["push"] = 1
  },
  tilesets = {
    {
      name = "tileset1",
      firstgid = 1,
      filename = "tileset1.tsx",
      exportfilename = "tileset1.lua"
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
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 31, 31, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 31, 31, 31, 31, 31, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 31, 31, 31, 41, 31, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 31, 31, 31, 31, 31, 31, 51, 51, 51, 51,
        51, 51, 51, 51, 41, 41, 31, 31, 31, 41, 51, 51, 51, 51,
        51, 51, 51, 51, 51, 51, 41, 41, 41, 51, 51, 51, 51, 51
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
          id = 51,
          name = "",
          type = "player",
          shape = "rectangle",
          x = 64,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 38,
          visible = true,
          properties = {
            ["health"] = 2
          }
        },
        {
          id = 52,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 80,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 1,
            ["direction"] = "left"
          }
        },
        {
          id = 53,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 96,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 1,
            ["direction"] = "down"
          }
        },
        {
          id = 54,
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
          id = 55,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 56,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 57,
          name = "",
          type = "",
          shape = "rectangle",
          x = 96,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 58,
          name = "",
          type = "pudding",
          shape = "rectangle",
          x = 128,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
