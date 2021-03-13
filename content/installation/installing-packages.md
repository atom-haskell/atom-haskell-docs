---
title: Installing packages
weight: 1
---

{{%notice info%}}
Refer to [Atom Flight Manual section on packages](http://flight-manual.atom.io/using-atom/sections/atom-packages/) for more detailed information
{{%/notice%}}

{{%notice tip%}}
You can find a complete list of Atom-Haskell packages on [atom.io package registry](https://atom.io/users/atom-haskell/packages)
{{%/notice%}}

{{%notice warning%}}
There are binary dependencies which are not touched upon in this section. Refer to the [requirements list](/overview/requirements#binary-dependencies) for more information.
{{%/notice%}}

You can pick and choose what packages you want and do not want to install. However, bear in mind that `language-haskell` is *absolutely mandatory*, and `ide-haskell` is most likely required too.

Most people would want at least core Atom-Haskell packages, which can be installed with a simple `apm` (Atom Package Manager) command. From terminal, run:

```bash
apm install language-haskell ide-haskell ide-haskell-cabal
```

You can install other packages on case-by-case basis.
