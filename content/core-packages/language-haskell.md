---
title: Language-Haskell
weight: 1
---

Language-Haskell adds syntax highlighting and snippets to Haskell files in Atom.

## Auto-indent

If you don't like current auto-indentation settings, you can define your own regular expression in `config.cson` (**Edit -> Open Your Config**), or disable it altogether.

{{%notice note%}}
Atom is using oniguruma for regular expression, and, as such, expression has to be a string, not a javascript regexp. You'll also have to escape `\`.
{{%/notice%}}

To disable auto-indent:

```cson
".haskell.source":
  editor:
    increaseIndentPattern: ''
```

By default, `increaseIndentPattern` has the following value:

```cson
".haskell.source":
  editor:
    increaseIndentPattern: '(((=|\\bdo|\\bwhere|\\bthen|\\belse|\\bof)\\s*)|(\\bif(?!.*\\bthen\\b.*\\belse\\b.*).*))$'
```

## Configuring highlighting

{{%notice tip%}}
You may need to reopen currently opened files (or restart Atom) for your new stylesheet to be applied.
{{%/notice%}}

### Module names

`language-haskell` uses `support.other.module.haskell` scope for module names, both in `import` statements and when using qualified identifiers (like `Prelude.foldl`). Your syntax theme might not support this scope. If you want to highlight module names in this case, you can add the following to your stylesheet (Edit → Stylesheet...):

```less
.syntax--support.syntax--other.syntax--module.syntax--haskell {
  color: #C0A077; //or whatever color you like
}
```

### Operators and infix function application

`language-haskell` uses `keyword.operator.haskell` scope for operators and `keyword.operator.infix.haskell` for infix function application, e.g.

```haskell
negate `map` [1..10]
```

Not all syntax themes support these scopes (almost none support `keyword.operator.infix` particularly)

If you want to highlight operators and infix function applications you can add the following to your stylesheet (Edit → Stylesheet...):

```less
.syntax--keyword.syntax--operator.syntax--haskell {
  color: #CF8C00; // or whatever color you like
}
.syntax--keyword.syntax--operator.syntax--infix.syntax--haskell {
  color: #CC77AC; // if you want to highlight infix application differently
}
```

### Special `Prelude` treatment

For historical and other reasons (see [#85](https://github.com/atom-haskell/language-haskell/issues/85) for discussion), `Prelude` identifiers (functions, types, etc) are treated slightly differently and, depending on your highlighting theme, can be highlighted differently.

Scopes that are used:

* `support.function.prelude.haskell` for functions and values
* `support.class.prelude.haskell` for types
* `support.operator.prelude.haskell` for infix operators (like `++`)
* `entity.other.inherited-class.prelude.haskell` for typeclasses
* `support.tag.prelude.haskell` for type constructors

If you want `Prelude` identifiers highlighted differently from all the rest, you can define different colors for all or some of those, f.ex. by adding something like this to your stylesheet (**Edit → Stylesheet...**):

```less
.syntax--support.syntax--function.syntax--prelude.syntax--haskell {
  color: #56b6c2; // or whatever color you like
}
.syntax--support.syntax--tag.syntax--prelude.syntax--haskell {
  color: #e9969d;
}
```

If you *don't* want `Prelude` identifiers highlighted differently, you can override it by adding something like this to your stylesheet (**Edit → Stylesheet...**):

```less
.syntax--prelude.syntax--haskell {
  color: inherit;
}
```

#### Different highlighting for different Prelude identifiers

Every Prelude identifier except operators has a scope corresponding to its name added, so you can add special highlighting to particular identifiers only.

For example, if you would like to highlight `undefined` and `error` in angry bold red, you can add something like this to your stylesheet:

```less
.syntax--support.syntax--function.syntax--prelude.syntax--haskell {
  &.syntax--undefined, &.syntax--error {
    color: red;
    font-weight: bold;
  }
}
```

All identifier scopes are case-sensitive, so, if you want to highlight, f.ex. `IO`, you would use `support.class.prelude.IO.haskell` scope.
