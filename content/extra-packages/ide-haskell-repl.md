---
title: IDE-Haskell-REPL
weight: 5
---

This package provides a way to interact with `ghci` (or, alternatively, `cabal repl` or `stack ghci`) from Atom.

Repl is opened in the context of the current Atom editor, so there is no need to load the file (even though `:l filename` will work).

Type any ghci command in the bar at the bottom of the window and press `shift+enter` (on Win and Linux) or `cmd+enter` (on macOS) to execute it.

Take a look at [ide-haskell-repl.cson](https://github.com/atom-haskell/ide-haskell-repl/blob/master/keymaps/ide-haskell-repl.cson) for other default bindings.

Four buttons alongside the command bar (outlined green in the picture below) allow for further actions

![Action buttons](/images/e1316f16efe8dcacd42aedccc3f8ff63.png)

Left to right:

- reload file and repeat last command
- automatic reload file and repeat last command on file save (toggle)
- interrupt current computation
- clear window

## Repl backend selection

ide-haskell-repl will try to automatically select the correct repl backend (`stack`/`cabal`/`ghci`) based on current builder chosen in `ide-haskell-cabal`. You can choose `none` builder to use `ghci` in plain projects (a.k.a. projects with no `*.cabal` file).

If `ide-haskell-cabal` is unavailable (e.g. disabled), ide-haskell-repl will fall back to `defaultRepl` specified in settings.

## Using ide-haskell-repl as IDE backend

ide-haskell-repl can be used to employ GHCi as an IDE backend (in place of ghc-mod etc). At the
moment of writing, this mode is somewhat limited, but it does provide
types on mouse hover and checking for errors/warnings on save.

To enable, go to ide-haskell-repl settings, and enable "Show Types" and "Check on Save" options:
!["Show Types" and "Check on Save" checkmarks are enabled](/images/537aff42dc9252e648ec924c15fafdc3.png)

Make sure ide-haskell-repl is the only active backend (that is, disable haskell-ghc-mod package if it's installed)

Bear in mind that GHCi can be, at times, a memory hog.

## Using on Windows

On Windows, interrupting ghci will kill it. There is no good solution to this problem at the moment, but there is a "bad" solution.

You need to get `ghci-wrapper.exe` executable from https://github.com/atom-haskell/win-ghci-wrapper/releases (or if you don't trust random binaries you've downloaded from the Internet, you can build it from source -- you only really need ghc for that)

Then you need to specify full path to this executable in `ghciWrapperPath` setting of this package.

For example, if you placed `ghci-wrapper.exe` in `C:\Downloads` directory, you need to put `C:\Downloads\ghci-wrapper.exe` in `ghciWrapperPath` setting.

Finally, restart any open REPL sessions.

## Repl-specific commands

To send command, or move through history, you can use the following commands when focused on repl command editor:

* `ide-haskell-repl:exec-command`
* `ide-haskell-repl:history-back`
* `ide-haskell-repl:history-forward`
* `ide-haskell-repl:ghci-reload`

Note that this commands are bound specifically to repl editor, which has CSS selector of `atom-text-editor.ide-haskell-repl`.

You can rebind those in your keymap, e.g.

```cson
"atom-text-editor.ide-haskell-repl":
  'ctrl-enter': 'ide-haskell-repl:exec-command'
  'ctrl-up': 'ide-haskell-repl:history-back'
  'ctrl-down': 'ide-haskell-repl:history-forward'
```

Just don't forget to disable default bindings in ide-haskell-repl settings, if you don't want them.
