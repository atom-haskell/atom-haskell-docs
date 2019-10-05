---
title: IDE-Haskell-HLint
weight: 6
---

This package is intended to replace the functionality of running HLint originally provided by Haskell-ghc-mod, without requiring ghc-mod.

The package requires IDE-Haskell, which provides GUI and other niceties. It also requires you to have a working `hlint` binary on your system.

## Installing HLint

Installation follows the standard pattern of any Haskell library or program: run `cabal v2-update` to update your local Hackage database, then `cabal v2-install hlint` to install HLint.

You can of course also install HLint using your favorite package manager (brew, nix, etc). This does _not_ have the same strict requirements as ghc-mod.

## Installing the package

You can install the package from Atom's Settings window, just search for `ide-haskell-hlint` and click 'Install'. Alternatively, run `apm install ide-haskell-hlint` in a terminal.

## Package configuration

The package does not have much in terms of configuration. The only three options that are currently present are these:

-  `checkAllFilesInProject` (boolean, default value: `false`)

    Try to check all `*.hs` files in current Atom project whenever a Haskell file is saved.

    Use with care, this may cause intermittent freezes on large code bases.

    When disabled, only runs hlint on the last saved file.

- `checkOnChange` (boolean, default value: `false`)

    Re-check current file on each change. Can be extremely distracting, but provides near-immediate feedback.

- `hlintPath` (string, default value: `hlint`)

    Full path to `hlint` binary, e.g. `C:\Users\myuser\bin\hlint.exe`, or`/usr/local/bin/hlint`. You only need to change this if the directory where your `hlint` binary is located is not on your system PATH, otherwise the default value of `hlint` will let Node to use the usual OS-specific PATH lookup algorithm for locating the binary.

All of the options are configurable via Atom's settings interface. To find package settings, open `Edit → Preferences` Atom main menu item, or run `Settings View: Open` command from the command palette, then go to 'Packages' tab, find `ide-haskell-hlint`, click 'Settings':

![Image showing Atom Settings window, Packages tab, with ide-haskell-hlint package card visible, and Settings button highlighted with green outline](/images/2e330734b2cb0e16c48e0fe84158a5de.png)
