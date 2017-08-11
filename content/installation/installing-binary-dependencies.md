---
date: 2017-03-13T00:05:13+03:00
title: Installing binary dependencies
toc: true
weight: 5
---

{{%notice info%}}
Supported `ghc-mod` versions are 5.6. and up.
{{%/notice%}}

{{%notice note%}}
These instructions assume you want to use `stylish-haskell` as a prettifier.
If you would like to use `hindent` or `brittany` instead, substitute that
in place of `stylish-haskell` below.

Bear in mind that prettifier has to be able to work as a unix filter, i.e.
accept input on STDIN and return output on STDOUT.
{{%/notice%}}

## With `stack`

The most reliable way to build these executable binaries is to use
`stack install`.

Run the following commands from a command line terminal after you finish
installing the minimal Haskell toolchain:

```bash
$ stack install stylish-haskell
...
Copied executables to {STACK_INSTALL_PATH}:
- stylish-haskell
$ stack install ghc-mod
...
Copied executables to {STACK_INSTALL_PATH}:
- ghc-mod
- ghc-modi
```

... where `STACK_INSTALL_PATH` depends on your operating system.  For example,
on OS X or Linux this path will usually be `~/.local/bin/`.

First, make sure that `STACK_INSTALL_PATH` is on your executable search path
(i.e. `$PATH` for OS X and Linux).

{{% notice warning %}}
On Linux, avoid setting `PATH` in `.bashrc`/`.zshrc`. These scripts are only executed in *interactive* shells, which means you'll have to start Atom from terminal session for it to pick `PATH` up correctly.
{{% /notice %}}

{{% notice warning %}}
On OSX, Atom can fail to set `PATH` correctly regardles.
{{% /notice %}}

If Atom fails to find a required executable (such as `stylish-haskell`) you will
get an error that reads something like this:

> Ide-haskell could not spawn stylish-haskell
>
> Error: spawn stylish-haskell ENOENT

If this happens, you will need to modify relevant package's settings to point to the absolute path to where you installed the executable.  For example,
if your `STACK_INSTALL_PATH` were `/home/johndoe/.local/bin/` then the
absolute path to the executable would be
`/home/johndoe/.local/bin/executable`.

## With `cabal`

{{%notice info%}}
You do not need to do this if you already installed with stack.
{{%/notice%}}

Alternatively, you can use `cabal-install` if you don't want to use stack for some reason.

It is advisable to first create a cabal sandbox for the installation to avoid global package database pollution and conflicts. This will also make updating easy.

To create a sandbox, create a directory, f.ex.

```bash
mkdir $HOME/ghc-mod-sandbox
```

{{%notice info%}}
Windows command line shell uses different syntax for environment variables, and there is usually no `HOME` defined anyway. We sincerely hope you can figure this out.
{{%/notice%}}

Then, `cd` into int:

```bash
cd $HOME/ghc-mod-sandbox
```

And run the following command

```bash
cabal sandbox init --sandbox=.
```

{{%notice tip%}}
The last part, namely `--sandbox=.`, is used to shorten paths. By default, `cabal` will create sandbox in `.cabal-sandbox` directory. This option tells it to use current directory instead.
{{%/notice%}}

{{%notice tip%}}
If you decide not to use sandbox for some reason, by default cabal will install binaries into `$HOME/.cabal/bin/` on Linux and `$HOME/Library/Haskell/bin` on OSX.
{{%/notice%}}

Now you can install ghc-mod and stylish-haskell. *In the same directory* run

```bash
cabal install ghc-mod stylish-haskell
```

Now you have ghc-mod and stylish-haskell installed. Binary files are in `$HOME/ghc-mod-sandbox/bin`. You can add this path to `PATH`, or put full path to **executables** in relevant `ide-haskell` and `haskell-ghc-mod` settings.

For example, assuming your `HOME` is `/home/user`:

* In ide-haskell settings, set 'Stylish Haskell Path' to `/home/user/ghc-mod-sandbox/bin/stylish-haskell`
* In haskell-ghc-mod settings, set 'Ghc Mod Path' to `/home/user/ghc-mod-sandbox/bin/ghc-mod`

{{%notice warning%}}
Don't forget to replace `$HOME` with actual path to home directory! Atom doesn't expand shell variables in package settings.
{{%/notice%}}

{{%notice tip%}}
On Linux and OSX, you can run
`echo $HOME/ghc-mod-sandbox/bin/*`
in the terminal to get actual paths to all executables, if not sure what those should look like.
{{%/notice%}}
