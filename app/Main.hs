import Graphics.Rendering.OpenGL
import Graphics.UI.GLUT
import DrawGraphics
import DataGenerator
import Aproximation
import Config

render :: ([(Double, Double)],[(Double, Double)],[(Double, Double)]) -> IO ()
render (variationData, originalData, algorithData) = do
    clear [ColorBuffer]

    color $ Color3 (1 :: GLfloat) (1 :: GLfloat) (1 :: GLfloat)
    writeLine originalData 1.0

    color $ Color3 (0 :: GLfloat) (1 :: GLfloat) (0 :: GLfloat)
    writeLine algorithData 1.0

    mapM_ (\(x, y) -> writeCircle ( round x ,  round y ) 10) variationData
    flush

display :: ([(Double, Double)],[(Double, Double)],[(Double, Double)]) -> IO ()
display (variationData, originalData, algorithData)  = do
    (_progName, _args) <- getArgsAndInitialize
    createWindow "Exemplo"
    clearColor $= Color4 0 0 0 1
    windowSize $= Size (round width) (round height)
    displayCallback $= render (variationData, originalData, algorithData)


---------------------------------------------------------

main :: IO ()
main = do
    putStrLn "---------------------------------------------------"
    putStrLn "            Algoritmos de Aproximação              "
    putStrLn "---------------------------------------------------"
    putStrLn " (1) - Aproximação por polinomial Bernstein "
    putStrLn "---------------------------------------------------"

    putStrLn "Selecione um dos Algoritmos para abrir a demonstração gráfica:"
    
    selectedAlgoritm <- getLine

    variationData <- createWithRandomVariationData (5.0, 2.0) cos
    originalData <- createDataFromFunction cos
    algorithData <- bernsteinPolynomialAproximation variationData
    print algorithData
    display (variationData, originalData, algorithData) 

    mainLoop