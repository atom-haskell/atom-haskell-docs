---
date: 2017-03-13T00:05:13+03:00
# next: /next/path
# prev: /prev/path
title: Autocomplete-Haskell
toc: true
weight: 20
---

Autocomplete-haskell provides autocompletion facilities for your Haskell
hacking.
It relies on scope names provided by `language-haskell` and `haskell-completion-backend` service, provided by `haskell-ghc-mod`

You can show auto-completions for hole `_`. This will try to find replacements
based on type. It's no magic though, so if hole has some crazy type, it won't
find anything. You can also refine hole completions based on name by using named holes, e.g. `_from`

Sadly, it does not pick up types and/or other symbols defined in current file
(ghc-mod seems to be incapable of this feat), so for this you have to rely on
default autocomplete-plus SymbolProvider.
