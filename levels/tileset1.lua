return {
  version = "1.5",
  luaversion = "5.1",
  tiledversion = "1.7.2",
  name = "tileset1",
  tilewidth = 16,
  tileheight = 16,
  spacing = 0,
  margin = 0,
  columns = 10,
  image = "tileset1.png",
  imagewidth = 160,
  imageheight = 128,
  objectalignment = "unspecified",
  tileoffset = {
    x = 0,
    y = 0
  },
  grid = {
    orientation = "orthogonal",
    width = 16,
    height = 16
  },
  properties = {},
  wangsets = {},
  tilecount = 80,
  tiles = {
    {
      id = 14,
      type = "trap"
    },
    {
      id = 27,
      type = "pudding"
    },
    {
      id = 37,
      type = "player",
      properties = {
        ["health"] = 1
      }
    },
    {
      id = 38,
      type = "squar",
      properties = {
        ["damage"] = 1,
        ["direction"] = "left"
      }
    }
  }
}
