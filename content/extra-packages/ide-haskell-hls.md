---
title: IDE-Haskell-HLS
weight: 4
---

This package provides Haskell Language Server powered IDE features like autocompletion, type/info tooltips, etc.

This package depends on the Haskell Language Server binary being available on PATH. More specifically, it runs `haskell-language-server-wrapper` by default.

By far the easiest way to get HLS is to use [ghcup](https://www.haskell.org/ghcup/) via `ghcup install hls`. However, ghcup isn't available on Windows (except through WSL). Refer to [HLS documentation](https://github.com/haskell/haskell-language-server#haskell-language-server) for more detailed installation instructions.

## Package Dependencies

IDE-Haskell-HLS depends on some Atom packages. If those packages are not installed, a prompt should be shown asking if you'd like to install them. The dependencies are also listed here for documentation purposes and can be installed manually:

- `language-haskell`: a single dependency that can't be installed automatically. Haskell Language definitions.
- `ide-haskell`: provides most UI elements
- `atom-ide-markdown-service`: will be used to render documentation tooltips
- `ide-haskell-hoogle`: will be used to open documentation links from tooltips directly in Atom.
- `atom-ide-definitions`: provides "go to definition" functionality
- `atom-ide-outline`: provides outline functionality

## Configure path to the binary

Path to the binary can be configured via `ide-haskell-hls.binaryPath` option. It is recommended you do not touch this option however and instead add the directory containing your HLS binaries to system PATH.

## Commands

IDE-Haskell-HLS provides the following utility commands:

- `ide-haskell-hls:restart-all-severs` will attempt to restart all HLS processes managed by Atom.
- `ide-haskell-hls:clear-messages` will clear out the error message cache on the Atom side. This is useful if you've, say, removed or renamed a file, and HLS didn't clear the messages for that file automatically.

## Project structure

Due to some idiosyncrasies of how language server protocol is implemented in Atom, HLS will pick up the project correctly only when the project root is open as a project directory in Atom, i.e. not as a subdirectory.

The project root can be either:

1. the directory containing the `cabal.project` file,
2. the directory containing a `*.cabal` file.

For the common case of a single "root" directory directly containing multiple directories with loosely-related projects, as, for instance, for course exercises, a `cabal.project` file with the following contents:

```cabal
packages: */*.cabal
```

should suffice. That is to say, with this `cabal.project`, the directory tree should look something like this:

```
.
├── cabal.project
├── project01
│   ├── project01.cabal
│   └── ...
├── project02
│   ├── project02.cabal
│   └── ...
├── ...
└── projectN
    ├── projectN.cabal
    └── ...
```
