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

You might also want to look into configuring haskell-ghc-mod ([haskell-ghc-mod README](https://github.com/atom-haskell/haskell-ghc-mod#haskell-ghc-mod-atom-package)) and ide-haskell-cabal ([ide-haskell-cabal README](https://github.com/atom-haskell/ide-haskell-cabal#ide-haskell-cabal-package))

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

Refer to ([haskell-ghc-mod README](https://github.com/atom-haskell/haskell-ghc-mod#haskell-ghc-mod-atom-package)) and ([ide-haskell-cabal README](https://github.com/atom-haskell/ide-haskell-cabal#ide-haskell-cabal-package)) for details

Ide-Haskell comes with little pre-specified keybindings, so you will need to specify your own, if you want those.

You can edit Atom keybindings by opening 'Edit → Open Your Keymap'. Here is a template for all commands, provided by ide-haskell:

```cson
'atom-text-editor[data-grammar~="haskell"]':
  'escape': 'ide-haskell:close-tooltip' #this is set by default
  '':'ide-haskell:prettify-file'
  '':'ide-haskell:next-error'
  '':'ide-haskell:prev-error'

'atom-text-editor[data-grammar~="cabal"]':
  '': 'ide-haskell:prettify-file'

'atom-workspace':
  '': 'ide-haskell:toggle-output'
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
