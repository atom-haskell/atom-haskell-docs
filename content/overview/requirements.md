---
date: 2017-03-13T00:05:13+03:00
# next: /next/path
# prev: /prev/path
title: Requirements
toc: true
weight: 10
---

The Atom-Haskell packages assume that you have a minimal Haskell toolchain
installed on your system. You can install this toolchain by following the
instructions here:

* [Minimal Haskell installers](https://www.haskell.org/downloads#minimal)

## Core Atom-Haskell packages

* [`language-haskell`](https://atom.io/packages/language-haskell) -- Syntax highlighting and Haskell autodetection **ABSOLUTELY REQUIRED!**
* [`ide-haskell`](https://atom.io/packages/ide-haskell) -- GUI and minimal utilities **ABSOLUTELY REQUIRED!**
* [`ide-haskell-cabal`](https://atom.io/packages/ide-haskell-cabal) -- Build Haskell projects with either `cabal` or `stack`. Reports errors/warnings on build.
* [`haskell-ghc-mod`](https://atom.io/packages/haskell-ghc-mod) -- `ghc-mod` integration. Typecheck and lint sources without building, query type information and more.
* [`autocomplete-haskell`](https://atom.io/packages/autocomplete-haskell) -- Autocompletion support. This plugin depends on `haskell-ghc-mod`.

## Extra Atom-Haskell packages

* [`haskell-pointfree`](https://atom.io/packages/haskell-pointfree) -- convert selection to pointfree/pointful representation
* [`ide-haskell-hasktags`](https://atom.io/packages/ide-haskell-hasktags) -- go to declaration, list all symbols defined in file/project
* [`ide-haskell-hoogle`](https://atom.io/packages/ide-haskell-hoogle) -- lookup hoogle documentation via local hoogle database
* [`ide-haskell-profiteurjs`](https://atom.io/packages/ide-haskell-profiteurjs) -- display GHC profiling results in Atom
* [`ide-haskell-repl`](https://atom.io/packages/ide-haskell-repl) -- GHCi REPL in Atom
* [`language-haskell-scoped`](https://atom.io/packages/language-haskell-scoped) -- highlight known identifiers in editor

## Binary dependencies

* [`stylish-haskell`](https://github.com/jaspervdj/stylish-haskell), [`hindent`](https://github.com/commercialhaskell/hindent) or [`brittany`](https://github.com/lspitzner/brittany) -- prettify/format your source code. Used by `ide-haskell`
* [`ghc-mod`](https://github.com/DanielG/ghc-mod) -- backend that does heavy lifting. Used by `haskell-ghc-mod`
* [`hasktags`](https://github.com/MarcWeber/hasktags) -- indexes your sources for easy navigation. Used by `ide-haskell-hasktags` (Optional)
* [`pointfree`](https://hackage.haskell.org/package/pointfree) and [`pointful`](https://hackage.haskell.org/package/pointful) -- convert source to pointfree or pointful representation. Used by `haskell-pointfree`
* [`hoogle`](https://hackage.haskell.org/package/hoogle) -- Haskell API search engine. Used by `ide-haskell-hoogle`
