module Main where

import Graphics.Gloss

window :: Display
window = InWindow "Nice Window" (200, 200) (10, 10)

background :: Color
background = white

origine :: Point
origine  = (0,0)

chemin :: Path
chemin = [(-100,-100), origine, (100, 100)]

drawing :: Picture
drawing = pictures
    [ circleSolid 10
    , line chemin
    ]

main :: IO ()
main = display window background drawing
