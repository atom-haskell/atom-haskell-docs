# atom-haskell-docs ![](https://david-dm.org/atom-haskell/atom-haskell-docs.svg)

This is Atom-Haskell documentation project.

It uses [HUGO](https://gohugo.io/) static site generator in conjunction with GitHub pages.

Pull requests are welcome!

## Building the site

Clone this repo.

```
git clone https://github.com/atom-haskell/atom-haskell-docs
cd atom-haskell-docs
```

Update theme submodule:

```
git submodule update --init -- themes
```

Get [HUGO](https://gohugo.io/) (>=v0.25; v0.31.1 is known to work)

Run `hugo serve` to serve the site locally from memory.

Run `hugo` to build site in `public`.

## License

Documentation text and media are licensed under Creative Commons Attribution-ShareAlike 4.0 International License. See [CC-BY-SA.txt](https://github.com/atom-haskell/atom-haskell-docs/blob/master/CC-BY-SA.txt) or visit https://creativecommons.org/licenses/by-sa/4.0/ for details.

Source code examples are licensed under MIT License. See [MIT.txt](https://github.com/atom-haskell/atom-haskell-docs/blob/master/MIT.txt) for details.

Contributors (by number of commits):

<!-- BEGIN CONTRIBUTORS LIST -->
* Nikolay Yakimov
* Erik Sutherland

<!-- END CONTRIBUTORS LIST -->
