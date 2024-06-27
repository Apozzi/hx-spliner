module DrawGraphics where
import Graphics.Rendering.OpenGL
import Config

writeCircle :: (Int, Int) -> Int -> IO ()
writeCircle (x, y) radius = do
    let radius' = fromIntegral radius
        x' = fromIntegral x
        y' = fromIntegral y
    color $ Color3 (1 :: GLfloat) (0 :: GLfloat) (0 :: GLfloat)
    lineWidth $= 3.0
    renderPrimitive LineLoop $ do
        let vertices = makeCircleVertices x' y' radius'
        mapM_ (\(x'', y'') -> vertex $ Vertex2 (x'' / ((realToFrac width) / 2) - 1) (y'' / ((realToFrac height) / 2) - 1)) vertices
makeCircleVertices :: Int -> Int -> Int -> [(GLfloat, GLfloat)]
makeCircleVertices xc yc r = [(x, y) | theta <- [0,0.05..2 * pi], 
                            let x = fromIntegral (xc + round (fromIntegral r * cos theta)), 
                            let y = fromIntegral (yc + round (fromIntegral r * sin theta))]


writeLine:: [(Double, Double)] -> Double -> IO ()
writeLine dataobjs radius = do
    lineWidth $= 2.0
    renderPrimitive LineStrip $ do
        mapM_ (\(x'', y'') -> vertex $ Vertex2 (x'' / ((realToFrac width) / 2) - 1) (y'' / ((realToFrac height) / 2) - 1)) dataobjs
        
