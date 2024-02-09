
module DataGenerator where
import System.Random
import Config

createWithRandomVariationData :: (Double, Double) -> (Double -> Double) -> IO [(Double, Double)]
createWithRandomVariationData (variation, density) func = do
    let distance = 100/density
    randomNumbers <- mapM (\_ -> randomRIO (-10 :: Double, 10 :: Double)) [0,distance..width]
    let variationData = [(x, y) | (vx, randomNum) <- zip [0,distance..width] randomNumbers,
                                let x = vx,
                                let y = (func (x / 100))*100 + variation * randomNum + 400]
    return variationData

createDataFromFunction :: (Double -> Double) -> IO [(Double, Double)]
createDataFromFunction func = do
    let variationData = [(x, y) | vx <- [0,1..width] ,
                                let x = vx,
                                let y = (func (x / 100))*100 + 400]
    return variationData
