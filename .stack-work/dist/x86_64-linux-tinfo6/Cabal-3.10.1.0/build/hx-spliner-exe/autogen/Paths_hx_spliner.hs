{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_hx_spliner (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/bin"
libdir     = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/lib/x86_64-linux-ghc-9.6.4/hx-spliner-0.1.0.0-6Ek8ROegex77S7TUwEkhnd-hx-spliner-exe"
dynlibdir  = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/lib/x86_64-linux-ghc-9.6.4"
datadir    = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/share/x86_64-linux-ghc-9.6.4/hx-spliner-0.1.0.0"
libexecdir = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/libexec/x86_64-linux-ghc-9.6.4/hx-spliner-0.1.0.0"
sysconfdir = "/home/Pozzi/Documentos/GitHub/hx-spliner/.stack-work/install/x86_64-linux-tinfo6/c4052c023e463a2d31737963ceaa81c9f6332665cb291284d2f9195cea53f5cd/9.6.4/etc"

getBinDir     = catchIO (getEnv "hx_spliner_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "hx_spliner_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "hx_spliner_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "hx_spliner_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hx_spliner_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hx_spliner_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
