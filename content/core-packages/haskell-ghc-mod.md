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
When using with stack, see [Using with stack](#using-with-stack)
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

## Using with stack

Stack support is limited. This section contains some tricks that can help to coerce ghc-mod into cooperation.

{{%notice warning%}}
DO NOT specify full path to ghc-mod/ghc-modi in haskell-ghc-mod settings. Do not add anything to 'Additional Path Directories' as well, unless you need to (i.e. know what you're doing). Make sure 'Stack Sandbox' option is *enabled* (this is the default)
{{%/notice%}}

### Remove `dist` folder in project root

Ghc-mod assumes you want to use cabal if it finds `dist/setup-config` in project root. In any case, if you want to use stack, you don't need `dist` directory anyway (unless you're using it to store sources, in which case, it's strongly advised you don't)

### Maintain a separate ghc-mod installation for each stack resolver

Ghc-mod requires that it must be built with the same version of GHC that you use to build your project. In most cases this means that you need a separate ghc-mod installation for every distinct stack resolver you're using.

Simplest way to achieve this would be to install ghc-mod locally for every stack project you want to use it with, i.e. run `stack build ghc-mod` in project directory (if you have multiple `stack.yaml` configs, do this for each one). If this fails for some reason, try to use stack-installed ghc (with `stack --no-system-ghc --install-ghc build ghc-mod`). Note that some resolvers seemingly can't build ghc-mod at all. You might also want to install newer ghc-mod version than a given resolver offers. Refer to stack documentation on how exactly you could do that.

If you enable 'Stack Sandbox' in haskell-ghc-mod settings (enabled by default), and leave 'Ghc Mod Path' as default `ghc-mod` (i.e. no actual path), Atom should automatically pick up local stack installation.

With lts-4.1 resolver (and probably later), you can also install ghc-mod into 'global project' (essentially run `stack build ghc-mod` outside any project directory). This will automatically provide ghc-mod executables to all projects using this resolver (so you don't need to install it per-project). Note this does *not* work with lts-3.22.

Later stack versions (and resolvers) install packages per-resolver globally, regardless of if you run `stack build ghc-mod` in stack project directory or not. Not sure which version changed that, but stack 1.0.2 with lts-5.6 resolver does that.

### Avoid mixing stack- and cabal-installed packages

This should go without saying. It's always a bad idea to mix packages installed with stack and cabal-install. At least avoid mixing those in the same project, i.e. if you're using stack, use stack-installed ghc-mod. If you're using cabal-install, use cabal-installed ghc-mod. Yes, it is not exactly simple.

### Run Atom with `stack exec atom` (***deprecated***)

{{%notice warning%}}
This is a last-ditch workaround, is deprecated and can lead to unexpected problems.

Should not be required with haskell-ghc-mod 1.6.0 and up. Please create issue if it doesn't work

This can lead to ghc-mod complaining about GHC_PACKAGE_PATH, so avoid this workaround if at all possible
{{%/notice%}}

Stack manages multiple ghc installations using environment hacking. So, in order to bring this environment into scope when using Atom, the most straightforward way is to run Atom with `stack exec atom` from project directory.
Under Windows it will be something like: `stack exec "%USERPROFILE%\AppData\Local\atom\app-1.7.3\atom.exe"`
