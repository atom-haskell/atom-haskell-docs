---
date: 2017-03-13T00:05:13+03:00
# next: /next/path
# prev: /prev/path
title: Haskell-ghc-mod
toc: true
weight: 15
---

Haskell ghc-mod opens pipe to `ghc-mod` and queries types, info, typechecks and lints current file.

{{%notice warning%}}
When using with stack, see https://github.com/atom-haskell/haskell-ghc-mod/wiki/Using-with-stack
{{%/notice%}}

## Configuration

Only configuration option you will likely need to set is `ghcModPath`. It needs to be set to full path to `ghc-mod` executable, if it is not in your PATH. For example, if you have `ghc-mod` in `/home/user/.cabal/bin/`, you need to write `/home/user/.cabal/bin/ghc-mod` in `ghcModPath`. Note that shell expansions are *not* suported, i.e. you can't use `~` or `$HOME`.

You may also consider adding path to directory containing ghc/ghci executable to
`additionalPathDirectories` configuration option. It is a comma-separated list
of directories that will be added to your search path when invoking ghc-mod.
For example, if you have `ghc` installed to `/usr/local`, then you would add
`/usr/local/bin` to `additionalPathDirectories`.

## Keybindings

Haskell-ghc-mod comes with little pre-specified keybindings, so you will need to specify your own, if you want those.

You can edit Atom keybindings by opening 'Edit → Open Your Keymap'. Here is a template for all commands, provided by haskell-ghc-mod:

```cson
'atom-text-editor[data-grammar~="haskell"]':
  '': 'haskell-ghc-mod:check-file'
  '': 'haskell-ghc-mod:lint-file'
  'ctrl-alt-t': 'haskell-ghc-mod:show-type' #this is an example binding
  'ctrl-alt-i': 'haskell-ghc-mod:show-info' #this is an example binding
  'ctrl-alt-T': 'haskell-ghc-mod:insert-type' #this is an example binding
  '': 'haskell-ghc-mod:case-split'
  '': 'haskell-ghc-mod:sig-fill'
  '': 'haskell-ghc-mod:show-info-fallback-to-type'
  '': 'haskell-ghc-mod:show-type-fallback-to-info'
  '': 'haskell-ghc-mod:show-type-and-info'
  '': 'haskell-ghc-mod:insert-import'
  '': 'haskell-ghc-mod:go-to-declaration'

'atom-workspace':
  '': 'haskell-ghc-mod:shutdown-backend'
```

## Advanced configuration

In some cases, it could be useful to disable ghc-mod completely for a given project (e.g. GHCJS), or suppress error pop-ups (e.g. in case of known ghc-mod bugs where some features don't work, or don't always work).

You can create `.haskell-ghc-mod.json` file in project root (i.e. directory containing a `*.cabal` file, or -- in case of plain projects -- Atom's project root directory).

`.haskell-ghc-mod.json` from Atom project root will also be honored, if it exists, with lower priority.

You can also create a global config file in `${ATOM_CONFIG_DIR}/haskell-ghc-mod.json`. `${ATOM_CONFIG_DIR}` is usually `${HOME}/.atom`, but you can check it's path by running `atom.getConfigDirPath()` in Atom's developer console (View → Developer → Toggle Developer Tools → Console).

Config file is a JSON file with the following fields:

- `"disable"` -- `true`/`false`. Will disable all ghc-mod functions entirely. If omitted, defaults to `false`.
- `"suppressErrors"` -- `true`/`false`. Will suppress error pop-ups. Those still will be displayed in Atom's console (View → Developer → Toggle Developer Tools), so if someting seems wierd, one could check there.
- `"ghcOptions"` -- Array of Strings. Options to pass to GHC. Can be useful to explicitly suppress warnings, e.g. `-fno-warn-unused-do-bind` or anything else.
- `"ghcModOptions"` -- Array of Strings. Arbitrary options to pass to ghc-mod. Bear in mind that you shouldn't *really* change most ghc-mod options, since the package makes some assumptions on that part. Also only global ghc-mod options will work (i.e. no command-specific ones)

Example:

```json
{
  "disable": false,
  "suppressErrors": true,
  "ghcOptions": ["-fno-warn-unused-do-bind", "-fno-warn-name-shadowing"],
  "ghcModOptions": ["--with-ghc", "/path/to/custom/ghc"]
}
```
