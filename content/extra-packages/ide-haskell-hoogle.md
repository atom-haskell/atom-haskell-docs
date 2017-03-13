---
date: 2017-03-13T03:03:47+03:00
title: IDE-Haskell-Hoogle
toc: true
weight: 5
---


Install package `ide-haskell-hoogle`. Refer to [Atom Flight Manual](http://flight-manual.atom.io/using-atom/sections/atom-packages/) for details on installing packages.

Package requires `hoogle` executable, plus you will need to build hoogle database for hoogle itself to work.

## Setup

### Install `hoogle`

You can use `cabal`, `stack`, or your favorite package manager.

Cabal:
```
cabal install hoogle
```

Stack:
```
stack install hoogle
```

### Build local hoogle database

You have a choice between installing basic database and extended database.

{{%notice warning%}}
Installing extended database will take a lot of time and memory!
{{%/notice%}}

To install basic database, run
```
hoogle data
```

To install extended database, run
```
hoogle data all
```

### Point the package to `hoogle` executable

{{%notice info%}}
You don't need to do this if `hoogle` is in `PATH`, i.e. if you can type `hoogle` in the terminal, and won't get 'File not found' error.
{{%/notice%}}

Open Atom's settings, Packages, find ide-haskell-hoogle, then set **Hoogle Path** to full path to `hoogle` executable. For example, if your `hoogle` executable is located in `/home/user/.local/bin/` directory, put `/home/user/.local/bin/hoogle` into **Hoogle Path**.
