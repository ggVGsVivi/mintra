type
  Tile = object
  Zone* = object
    width: int
    tiles: seq[Tile]

func tileAt*(zone: Zone; x, y: SomeUnsignedInt): ptr Tile =
  zone.tiles[y * zone.width + x].addr
