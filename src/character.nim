import space
# import player

type
  CharacterClass* = enum
    ccWanderer
    ccWarrior
    ccKnight
    ccThief
    ccAlchemist
    ccSunWizard
    ccMoonWizard
  GovernAttr* = enum
    gaStr
    gaDex
    gaVit
    gaAgi
    gaInt
    gaMnd
    gaChr
  DirectAttr* = enum
    daHP
    daMP
    daAtk
    daAcc
    daDef
    daEva
    daMag
    daMAcc
    daMDef
    daMEva
  Character* = object
    # controlledBy: ref Player
    classXP: array[CharacterClass, int]
    currentClass: CharacterClass
    governAttr: array[GovernAttr, int]
    directAttr: array[DirectAttr, int]
    pos: Vec3f
    path*: seq[Vec3f]
