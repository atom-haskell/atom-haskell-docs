---
title: IDE-Haskell-Cabal
weight: 10
---

The `ide-haskell-cabal` package provides a build backend for `ide-haskell`
package based on `cabal` or `stack`.

It supports easy switching between multiple versions of GHC by having a set of configuration settings for each version of GHC, plus a drop-down box to pick a GHC version. For each GHC version you can specify:

* The path (either adding to your system path or replacing it completely)
* The sandbox file (cabal `CABAL_SANDBOX_CONFIG` environment variable)
* The build directory (cabal `--builddir` parameter). This defaults to `dist/`.

It also provides support for build target selection by reading and parsing the cabalfile and extracting the available targets (it uses a thin `ghcjs`-compiled wrapper around the `Cabal` library to read the `.cabal` file).

## Switching between `cabal` and `stack`

When you first try building your project (by running `ide-haskell-cabal:build` command from command palette, for example), you will be asked to specify a builder to use:

![Command palette-like dialog window with text "Select builder to use with current project" and three options "cabal", "stack" and "none"](/images/399a3ad33f6f603f28703824b4595ea6.png)

You can select one you'd like to use then. Atom will remember your choice. If you wish to choose another builder afterwards, you can do this by running `ide-haskell-cabal:set-active-builder` command. Alternatively, this same command is available in **Haskell IDE -> Builder -> Set Active Builder** menu item, or via a `🔨` button on ide-haskell panel:

![Header part of ide-haskell panel, button with hammer icon and text "stack" highlighted](/images/c52fab5e72d0afff5f835cc03ec2465d.png)

Currently-selected builder is also shown on that exact button, either as button text, or as tooltip (this is configurable from package settings).

## Selecting a build target

You can also select which target (of the ones defined in cabalfile) to build. You can do that by either running `ide-haskell-cabal:set-build-target` command, choosing **Haskell IDE -> Builder -> Set Build Target** menu item, or clicking the `🎯` button on ide-haskell panel:

![Header part of ide-haskell panel, button with target icon and text "Auto" highlighted](/images/305c4065f8a41b3d5b61455409268114.png)

If you do, you will be presented with the list of all available targets in all currently-open Atom project directories:

![Command palette-like dialog window with text "Select target to build" and several options, "Auto: Auto", "lambda: Auto", "lambda: All", "lambda: lambda", "lambda: lambda-exe", "lambda:lambda-test"](/images/f0a7f35533a3c5d15c4ff676f57f426f.png)

{{%notice note%}}
Before ide-haskell-cabal v2.1.0, `Auto` targets were confusingly called `All`, and there were no actual `All` targets.
{{%/notice%}}

Default setting is `Auto: Auto`, which will automatically select which project and which target to build based on currently-active editor.

Each detected project directory also has target `Auto` in addition to targets defined in cabalfile. That target constrains automatic selection algorithm to selected project directory, but the target for that project is selected based on currently-active editor.

Finally, detected project directory has the target `All`, which will build *all* targets for selected project.

## Keybindings

Ide-Haskell-Cabal comes with little pre-specified keybindings, so you will need to specify your own, if you want those.

You can edit Atom keybindings by opening **Edit → Keymap...**. Here is a template for all commands, provided by ide-haskell-cabal:

```cson
'atom-workspace':
  '': 'ide-haskell-cabal:build'
  '': 'ide-haskell-cabal:clean'
  '': 'ide-haskell-cabal:test'
  '': 'ide-haskell-cabal:bench'
  '': 'ide-haskell-cabal:deps' # builds only dependencies
  '': 'ide-haskell-cabal:set-build-target'
  '': 'ide-haskell-cabal:set-active-builder'
```
