---
date: 2017-03-13T00:05:13+03:00
# next: /next/path
# prev: /prev/path
title: Implemented features
toc: true
weight: 5
---

#### Sytnax highlighting

Grammars:

* Haskell (\*.hs)
* Literate Haskell (\*.lhs)
* Cabal (\*.cabal)

![image](https://cloud.githubusercontent.com/assets/7275622/8120540/f16d7ee6-10a8-11e5-9b9d-223ff05a54c6.png)


#### Errors, warnings and lints

After saving the current file the check and linter processes will be executed.
After processes are finished, the results can be seen in output panel. You can
see different kind of results by switching Errors, Warnings and Lints tab
buttons. If you click on message's file name in output panel, Atom will open
this file and put cursor near problem that triggered output message.

Check results can also be seen in left editor gutter (near line numbers) as
icons. If you hover mouse pointer over such an icon, a tooltip will be shown
with problem description. Results are highlighted inside editor as well, so you
can easily determine where the problem is.

![errors](https://cloud.githubusercontent.com/assets/7275622/9705079/52b38f7c-54c1-11e5-9b23-6b932100e876.gif)

#### Get type/info

If you have `haskell-ghc-mod` or similar package installed, you can get type of any expression and get info on any symbol.

There are two options to do so.

First one is to hover mouse pointer over any Haskell source in editor, or any
selection. By default, this will show type for expression/selecton under cursor.
You can change this behavior to show info for symbol, or disable it completely
in IDE-Haskell settings.

Another option is to use keyboard to get type/info under cursor. No default
bindings are specified, but you can specify them in your Atom keymap.

See [Configuration](#configuration) for more information.

![typeinfo](https://cloud.githubusercontent.com/assets/7275622/9705082/52daa81e-54c1-11e5-88a8-99c8029eb14e.gif)

![typeins](https://cloud.githubusercontent.com/assets/7275622/9705080/52cd7e64-54c1-11e5-8ee3-120641da2f85.gif)

#### Autocompletion

You can show auto-completions for hole `_`. This will try to find replacements
based on type. It's no magic though, so if hole has some crazy type, it won't
find anything. You can also refine hole completions based on name by using named holes, e.g. `_from`

Current autocompletion scopes:

* Import module name
* Import module symbols
* Language pragmas
* OPTIONS_GHC pragma
* Type name
* Class name
* Symbol name

Autocompletion:

![autocomplete](https://cloud.githubusercontent.com/assets/7275622/9704861/e4474ec4-54bc-11e5-92f4-84a3995e45cb.gif)

Import autocompletion:

![import](https://cloud.githubusercontent.com/assets/7275622/9704865/ff39f79a-54bc-11e5-9912-5fb2884b749b.gif)

Hole autocompletion:

![hole](https://cloud.githubusercontent.com/assets/7275622/9704890/5581ccae-54bd-11e5-8ec6-8aa289e5a099.gif)

#### Code beautify

You can use `stylish-haskell` utility to indent pragmas, imports and data type
definitions. Simply select `Prettify` from Haskel IDE menu to apply
`stylish-haskell` to current file.

![prettify](https://cloud.githubusercontent.com/assets/7275622/9705081/52d97cf0-54c1-11e5-94f0-96f09e43ada3.gif)

#### Build and test project

If you have `ide-haskell-cabal` or similar package installed, you can build,
clean and test your project from ide-haskell (stack and cabal supported)
