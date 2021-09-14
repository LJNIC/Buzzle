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
  nextobjectid = 27,
  properties = {
    ["attack"] = "1",
    ["block"] = "2",
    ["disarm"] = "2",
    ["health"] = "5",
    ["move1"] = "1",
    ["move2"] = "4",
    ["move3"] = "5",
    ["push"] = "2"
  },
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
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 31, 51,
        51, 31, 31, 41, 31, 31, 31, 31, 31, 31, 31, 31, 31, 51,
        51, 31, 31, 31, 31, 41, 31, 31, 41, 31, 31, 31, 31, 51,
        51, 41, 31, 31, 31, 31, 31, 31, 31, 31, 31, 41, 31, 51,
        51, 51, 31, 31, 31, 31, 31, 31, 31, 31, 31, 51, 41, 51,
        51, 51, 41, 41, 41, 41, 41, 41, 41, 41, 41, 51, 51, 51
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
          x = 48,
          y = 64,
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
          type = "pudding",
          shape = "rectangle",
          x = 192,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 32,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 2,
            ["direction"] = "left"
          }
        },
        {
          id = 4,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 64,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = "1",
            ["direction"] = "down"
          }
        },
        {
          id = 5,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 80,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 2,
            ["direction"] = "left"
          }
        },
        {
          id = 9,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 176,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 3,
            ["direction"] = "left"
          }
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 50,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 112,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 3,
            ["direction"] = "up"
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 50,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 15,
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
            ["damage"] = "1",
            ["direction"] = "right"
          }
        },
        {
          id = 16,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 112,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 80,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 128,
          y = 96,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 144,
          y = 64,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 160,
          y = 80,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "trap",
          shape = "rectangle",
          x = 192,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 15,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "squar",
          shape = "rectangle",
          x = 144,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 39,
          visible = true,
          properties = {
            ["damage"] = 2,
            ["direction"] = "left"
          }
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 128,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 32,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 48,
          width = 16,
          height = 16,
          rotation = 0,
          gid = 49,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 96,
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
