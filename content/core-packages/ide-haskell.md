---
date: 2017-03-13T00:05:13+03:00
title: IDE-Haskell
toc: true
weight: 5
---

IDE-Haskell Atom package provides basic capabilities, as well as a backend for other Atom-Haskell packages to use.

## Known conflicts

This package relies on grammar defined by `language-haskell`. Any other Haskell grammar packages (such as `haskell-grammar`) may conflict with it.

## Configuration

Package is fully configurable via **Edit → Preferences → Packages → ide-haskell
→ Settings**

You will likely need to specify full path to prettifier executable, at the very least.

You might also want to look into [configuring haskell-ghc-mod](/core-packages/haskell-ghc-mod) and [ide-haskell-cabal](/core-packages/ide-haskell-cabal)

{{%notice note%}}
Since version 1.0.0, some configuration options have been moved to
backends, in particular, haskell-ghc-mod. Migration should be automatic, but
please check if your configuration is correct just in case.
{{%/notice%}}

### Keyboard shortcuts

{{%notice note%}}
Since version 1.0.0, most commands are provided by
backends, in particular, haskell-ghc-mod and ide-haskell-cabal. Please revise
your keymap accordingly.
{{%/notice%}}

Refer to sections on [haskell-ghc-mod](/core-packages/haskell-ghc-mod#keybindings) and [ide-haskell-cabal](/core-packages/ide-haskell-cabal#keybindings) for details

Ide-Haskell comes with little pre-specified keybindings, so you will need to specify your own, if you want those.

You can edit Atom keybindings by opening 'Edit → Open Your Keymap'. Here is a template for all commands, provided by ide-haskell:

```cson
'atom-text-editor.ide-haskell--has-tooltips':
  'escape': 'ide-haskell:close-tooltip' #this is set by default

'atom-text-editor.ide-haskell':
  '':'ide-haskell:prettify-file'

'atom-workspace':
  '': 'ide-haskell:toggle-output'
  '': 'ide-haskell:next-error'
  '': 'ide-haskell:prev-error'
```

### Changing output panel look

Changing output panel look can be achieved with Atom stylesheets. You can open your stylesheet with Edit → Stylesheet...

Syntax is [Less](http://lesscss.org/). You can use the following selectors:

* `ide-haskell-panel` -- whole panel
* `ide-haskell-panel-heading` -- panel heading (control elements)
* `ide-hashell-panel-items` -- output area
* `ide-haskell-item-position` -- file/line/column of individual message
* `ide-haskell-item-description` -- message itself

Please note, that to change font face in `ide-haskell-item-description`, you need to target it specifically, or use `!important` specifier.

For example, to change font size in whole panel:

```less
ide-haskell-panel {
  font-size: 18pt;
}
```

Or only in output area:

```less
ide-haskell-panel-items {
  font-size: 18pt;
}
```

To change font face in panel heading:

```less
ide-haskell-panel-heading {
  font-family: "Comic Sans MS";
}
```

To change font face in messages themselves:

```less
ide-haskell-item-description {
  font-family: "Fira Mono";
}
```

You are free to write any CSS, of course. Bear in mind, however, that any selectors not listed above are subject to sudden change.

### Using [atom-linter](https://atom.io/packages/linter) for output

You can use linter package for displaying some messages. Install linter package, and then change `messageDisplayFrontend` in ide-haskell settings to `linter`. Restart Atom.

### Advanced configuration (since v2.2.0)

Some `ide-haskell` settings are root scope-sensitive, meaning they can have different values defined in config depending on editor grammar.

Atom Flight Manual gives a brief introduction into scoped settings [here](http://flight-manual.atom.io/behind-atom/sections/scoped-settings-scopes-and-scope-descriptors/), but here's a short refresher.

You can define setting overrides in your config file (**Edit → Config...**) under specific scope selectors. For example, imagine this is your config:

```cson
"*":
  "ide-haskell":
    stylishHaskellPath: "stylish-haskell"
```

Now, consider you would like to use `hindent`, but only for Literate Haskell files (since `stylish-haskell` doesn't support `lhs`). You can do that by extending your config like so:

```cson
"*":
  "ide-haskell":
    stylishHaskellPath: "stylish-haskell"
".text.tex.latex.haskell":
  "ide-haskell":
    stylishHaskellPath: "hindent"
```

You can learn scope name for a given grammar by opening a file using that grammar and running `editor:log-cursor-scope` command. The first (topmost) entry in the message would be the root scope, the rest are syntax scopes.

Bear in mind ide-haskell isn't sensitive to syntax scopes (since it's either overly complicated to support or doesn't make much sense).

Here's a list of settings that are sensitive to root scope:

* `onSavePrettify`
* `onSavePrettifyFormats`
    * `source*c2hs`
    * `source*cabal`
    * `source*hsc2hs`
    * `source*haskell`
    * `text*tex*latex*haskell`
    * `source*hsig`
* `expressionTypeInterval`
* `onCursorMove`
* `stylishHaskellPath`
* `stylishHaskellArguments`
* `cabalPath`

{{%notice warning%}}
This list can be incomplete.
{{%/notice%}}
