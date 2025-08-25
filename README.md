# fish-completions-pass-extensions

> fish completions for pass extensions

This repository contains fish completions for the following [pass][pass]
password manager extensions:

- [pass-ln][pass-ln]
- [pass-otp][pass-otp]

## Install

The easiest way to install the completions is to use the [Fisher][fisher]
plugin manager:

```fish
fisher install mserajnik/fish-completions-pass-extensions
```

To manually install instead, copy
[`completions/pass.fish`](completions/pass.fish) into your
`~/.config/fish/completions` directory.

## Caveats

Due to how completions for pass are implemented, it is currently not possible
to cleanly add completions for extensions without sourcing the main pass
completions. This is done with a semi-dynamic approach by checking common
locations. If your pass completions are not in one of those locations, it will
not work.

## Maintainer

[Michael Serajnik][maintainer]

## Contribute

You are welcome to help out!

[Open an issue][issues] or [make a pull request][pull-requests].

## License

[GPL-3.0-or-later](LICENSE) © Michael Serajnik, Milan Oberkirch

[fisher]: https://github.com/jorgebucaran/fisher
[pass]: https://www.passwordstore.org
[pass-ln]: https://github.com/radian-software/pass-ln
[pass-otp]: https://github.com/tadfisher/pass-otp

[issues]: https://github.com/mserajnik/fish-completions-pass-extensions/issues
[maintainer]: https://github.com/mserajnik
[pull-requests]: https://github.com/mserajnik/fish-completions-pass-extensions/pulls
