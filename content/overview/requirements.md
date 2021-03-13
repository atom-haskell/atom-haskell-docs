---
title: Requirements
weight: 10
---

The Atom-Haskell packages assume that you have at least a minimal Haskell toolchain installed on your system. See <https://www.haskell.org/downloads> for your options.

## Core Atom-Haskell packages

* [`language-haskell`](https://atom.io/packages/language-haskell) -- Syntax highlighting and Haskell autodetection **ABSOLUTELY REQUIRED!**
* [`ide-haskell`](https://atom.io/packages/ide-haskell) -- GUI and minimal utilities **ABSOLUTELY REQUIRED!**
* [`ide-haskell-cabal`](https://atom.io/packages/ide-haskell-cabal) -- Build Haskell projects with either `cabal` or `stack`. Reports errors/warnings on build.

## Extra Atom-Haskell packages

* [`ide-haskell-hls`](https://atom.io/packages/ide-haskell-hls) -- Haskell Language Server support: autocompletion, on-line code typechecking and linting, etc. See <https://github.com/haskell/haskell-language-server> for more information.
* [`haskell-pointfree`](https://atom.io/packages/haskell-pointfree) -- convert selection to pointfree/pointful representation
* [`ide-haskell-hasktags`](https://atom.io/packages/ide-haskell-hasktags) -- go to declaration, list all symbols defined in file/project
* [`ide-haskell-hoogle`](https://atom.io/packages/ide-haskell-hoogle) -- lookup hoogle documentation via local hoogle database
* [`ide-haskell-profiteurjs`](https://atom.io/packages/ide-haskell-profiteurjs) -- display GHC profiling results in Atom
* [`ide-haskell-repl`](https://atom.io/packages/ide-haskell-repl) -- GHCi REPL in Atom

## Binary dependencies

* [`stylish-haskell`](https://github.com/jaspervdj/stylish-haskell), [`hindent`](https://github.com/commercialhaskell/hindent), [`brittany`](https://github.com/lspitzner/brittany) or [`ormolu`](https://hackage.haskell.org/package/ormolu) -- prettify/format your source code. Used by `ide-haskell`
* [`haskell-language-server`](https://github.com/haskell/haskell-language-server) -- backend that does heavy lifting. Used by `ide-haskell-hls`. Refer to <https://github.com/haskell/haskell-language-server#installation> for installation instructions.
* [`hasktags`](https://github.com/MarcWeber/hasktags) -- indexes your sources for easy navigation. Used by `ide-haskell-hasktags` (Optional)
* [`pointfree`](https://hackage.haskell.org/package/pointfree) and [`pointful`](https://hackage.haskell.org/package/pointful) -- convert source to pointfree or pointful representation. Used by `haskell-pointfree` (Optional)
* [`hoogle`](https://hackage.haskell.org/package/hoogle) -- Haskell API search engine. Used by `ide-haskell-hoogle` (Optional)
