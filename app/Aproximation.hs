module Aproximation where
import Data.List (nub, zip4)

binomial :: Int -> Int -> Int
binomial _ 0 = 1
binomial 0 _ = 0
binomial n k = binomial (n-1) (k-1) * n `div` k

bernstein :: Int -> Int -> Double -> Double -> Double
bernstein n i t u = fromIntegral (binomial n i) * (t^i) * ((1-t)^(n-i)) * u

bernsteinPolynomialAproximation :: [(Double, Double)] -> IO [(Double, Double)]
bernsteinPolynomialAproximation points = do
    let degree = length points - 1
        domain = map fst points
        ts = [fromIntegral i / fromIntegral degree | i <- [0..degree]]
        ys = map snd points
        coefficients = [sum [bernstein degree i t y | (i, t, y) <- zip3 [0..degree] (repeat t) ys] | t <- ts]
    return $ zip domain coefficients
