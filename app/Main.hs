module Main where

import Graphics.Gloss

-- Window configuration
window :: Display
window = InWindow "Nice Window" (400, 400) (10, 10)

-- Background color
background :: Color
background = white

origine :: Point
origine = (0, 0)

theta :: Float
theta = pi / 18 

scalar :: Float
scalar = 100

domaineRestreint :: [(Float, Float)] 
domaineRestreint = [(-1, 1)]

rotatePoint :: Float -> (Float, Float) -> (Float, Float)
rotatePoint angle (x, y) = (x * cos angle - y * sin angle, y * cos angle + x * sin angle)

generateRotatedPoints :: Float -> [(Float, Float)] -> [(Float, Float)]
generateRotatedPoints angle points
  | angle > 2 * pi = []  -- Stop recursion after completing a full rotation (360 degrees)
  | otherwise = map (rotatePoint angle) points ++ generateRotatedPoints (angle + theta) points

-- Scale the points by the scalar
scalePoints :: [(Float, Float)] -> [(Float, Float)]
scalePoints = map (\(x, y) -> (scalar * x, scalar * y))

chemins :: [(Float, Float)] -> [Path]
chemins = map (\p -> [origine, p])

--Creates the star (list of lines)
star :: [Picture]
star = (map line (chemins (generateRotatedPoints 0 (scalePoints domaineRestreint))))

image :: [Picture]
image  = star ++ [circle (scalar)]

drawing :: Picture
drawing = pictures image

-- Main function to display the window
main :: IO ()
main = display window background drawing
