# Homebrew Tap for DisplayModeSwitcher

A [homebrew](https://brew.sh/) [tap](https://docs.brew.sh/Taps) for installing [DisplayModeSwitcher](https://github.com/bellbind/DisplayModeSwitcher).

## Howto 

At first, you should add this tap as:

```sh
$ brew tap bellbind/displaymodeswitcher
```

Then, build and install the DisplayModeSwicther.app as:

```sh
$ brew install --no-sandbox displaymodeswitcher
$ ln -sf /usr/local/opt/displaymodeswitcher/DisplayModeSwitcher.app ~/Applications/DisplayModeSwitcher.app
```

Or the [hidden API version](https://github.com/bellbind/DisplayModeSwitcher/tree/hidden-api) as:

```sh
$ brew install --devel --no-sandbox displaymodeswitcher
$ ln -sf /usr/local/opt/displaymodeswitcher/DisplayModeSwitcher.app ~/Applications/DisplayModeSwitcher.app
```

NOTE: for convert PNG from SVG, `qlmanage` command is required outside of sandbox.
