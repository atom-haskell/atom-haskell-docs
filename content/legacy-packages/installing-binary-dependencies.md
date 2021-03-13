---
title: Installing binary dependencies
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

{{%notice warning%}}
The Atom-Haskell packages (and this instructions) assume that you have at least a minimal Haskell toolchain installed on your system. See <https://www.haskell.org/downloads> for your options.

Please bear in mind that official release ghc-mod v5.8.0.0 doesn't support GHC 8.2. If installing GHC separately, make sure to get GHC 8.0, otherwise, you might run into problems.

Note that stackage lts-10.x uses GHC 8.2. If you want to use stack with official release of ghc-mod, stick to lts-9 for now.

If feeling adventurous, you can try building
an unstable ghc-mod for your chosen GHC version. \
[master branch](https://github.com/DanielG/ghc-mod) should work with GHC 8.2 \
[lierdakil/ghc-8.4.3 branch](https://github.com/DanielG/ghc-mod/pull/942) seems to work with GHC 8.4.3 (in particular, stack LTS-12)

Alternatively, you can use ide-haskell-repl to employ plain old GHCi as a backend provider. This is a rather limited option compared to ghc-mod, but it might work better for newer GHC versions. Refer to [ide-haskell-repl page](/extra-packages/ide-haskell-repl#using-ide-haskell-repl-as-ide-backend) for more information.

{{%/notice%}}

{{%notice info%}}
This guide only touches on installing prettifier (like `stylish-haskell`) and `ghc-mod` (which you need for all the "good stuff", like type tooltips and autocompletion). Extra packages, however, can have other binary dependencies. Installation procedure is rather similar, so no detailed guide is provided. Refer to [requirements list](/overview/requirements#binary-dependencies) for more information.
{{%/notice%}}

## With `stack`

{{%notice warning%}}
See also [section on using haskell-ghc-mod with stack](/core-packages/haskell-ghc-mod#using-with-stack)
{{%/notice%}}

{{%notice warning%}}
Latest stack lts resolver (which is used by default) uses GHC 8.2, which ghc-mod isn't compatible with as of yet. Please stick to lts-9 for now if you want to use ghc-mod.
{{%/notice%}}

Probably a simpler way to start with is to build binary dependencies with
`stack`. Refer to [stack documentation](https://docs.haskellstack.org/) to get more information about it.

Run the following commands from a command line terminal after you get yourself a minimal Haskell toolchain (either via Haskell Platform, or with `stack setup`):

```bash
$ stack install stylish-haskell
...
Copied executables to {STACK_INSTALL_PATH}:
- stylish-haskell
$ stack --resolver lts-9 install ghc-mod
...
Copied executables to {STACK_INSTALL_PATH}:
- ghc-mod
- ghc-modi
```

{{%notice info%}}
Note the `--resolver lts-9` part in `ghc-mod` example -- this ensures that
stack uses GHC 8.0 to build ghc-mod. Since ghc-mod will only work for the GHC
version it was built with, you might also want to tell stack to use `lts-9.x`
resolver. You can do that by running `stack config set resolver lts-9` either
in a project (which will change the project's `stack.yaml`) or outside of any
project, which will modify settings in stack's global config. See [stack
documentation](https://docs.haskellstack.org/en/stable/yaml_configuration) for
more information.
{{%/notice%}}

... where `STACK_INSTALL_PATH` depends on your operating system.  For example,
on OS X or Linux this path will usually be `~/.local/bin/`.

First, make sure that `STACK_INSTALL_PATH` is on your executable search path
(i.e. `$PATH` for OS X and Linux).

{{% notice warning %}}
On Linux, avoid setting `PATH` in `.bashrc`/`.zshrc`. These scripts are only executed in *interactive* shells, which means you'll have to start Atom from terminal session for it to pick `PATH` up correctly.
{{% /notice %}}

{{% notice warning %}}
On OSX, Atom can fail to set `PATH` correctly regardless.
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

{{%notice warning%}}
A notable exception is `haskell-ghc-mod` package. Avoid setting 'Ghc Mod Path' to anything but `ghc-mod` (i.e. plain executable name) if at all possible. Instead, add the *directory* containing `ghc-mod` executable to 'Additional Path Directories', so, using the example above, add `/home/johndoe/.local/bin` to 'Additional Path Directories'.
{{%/notice%}}

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

Now you have ghc-mod and stylish-haskell installed. Binary files are in `$HOME/ghc-mod-sandbox/bin`. You can add this path to `PATH`, or put full path to **executables** in relevant `ide-haskell` settings and full path to **directory** in `haskell-ghc-mod` 'Additional Path Directories'.

For example, assuming your `HOME` is `/home/user`:

* In ide-haskell settings, set 'Stylish Haskell Path' to `/home/user/ghc-mod-sandbox/bin/stylish-haskell`
* In haskell-ghc-mod settings, set 'Additional Path Directories' to `/home/user/ghc-mod-sandbox/bin`

{{%notice warning%}}
Avoid setting 'Ghc Mod Path' in `haskell-ghc-mod` settings to anything but `ghc-mod` (i.e. plain executable name) if at all possible. Instead, use 'Additional Path Directories'.
{{%/notice%}}

{{%notice tip%}}
'Cabal Sandbox' option will make `haskell-ghc-mod` look for `ghc-mod` executable in the current project's Cabal sandbox first, so *if* using Cabal sandboxes, you can install ghc-mod per-project.
{{%/notice%}}

{{%notice warning%}}
Don't forget to replace `$HOME` with actual path to home directory! Atom doesn't expand shell variables in package settings.
{{%/notice%}}

{{%notice tip%}}
On Linux and OSX, you can run
`echo $HOME/ghc-mod-sandbox/bin/*`
in the terminal to get actual paths to all executables, if not sure what those should look like.
{{%/notice%}}

## With `Nix`

On [NixOS](https://nixos.org/), or with [Nix package manager](https://nixos.org/nix/manual/), Haskell binaries are available in the
[haskellPackages](https://nixos.org/nixpkgs/manual/#users-guide-to-the-haskell-infrastructure)
attribute set.

{{%notice tip%}}
You can query the list of all available Haskell packages with:
`nix-env -f "<nixpkgs>" -qaP -A haskellPackages`
{{%/notice%}}

Install `ghc-mod` and `stylish-haskell`.

```bash
nix-env -f "<nixpkgs>" -iA haskellPackages.ghc-mod haskellPackages.stylish-haskell
```

You should now have `ghc-mod` and `stylish-haskell` available in your profile.
