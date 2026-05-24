# fish-completions-pass-extensions

[![Lint status][badge-lint-status]][badge-lint-status-url]

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

## Licenses

- [`GPL-3.0-or-later`][license-gpl-3.0-or-later] (Code)
- [`CC-BY-SA-4.0`][license-cc-by-sa-4.0] (Documentation)
- [`CC0-1.0`][license-cc0-1.0] (Configuration files)

This project follows the [REUSE specification][reuse-spec].

[badge-lint-status]: https://github.com/mserajnik/fish-completions-pass-extensions/actions/workflows/lint.yaml/badge.svg
[badge-lint-status-url]: https://github.com/mserajnik/fish-completions-pass-extensions/actions/workflows/lint.yaml
[fisher]: https://github.com/jorgebucaran/fisher
[pass]: https://www.passwordstore.org
[pass-ln]: https://github.com/radian-software/pass-ln
[pass-otp]: https://github.com/tadfisher/pass-otp
[issues]: https://github.com/mserajnik/fish-completions-pass-extensions/issues
[license-cc-by-sa-4.0]: LICENSES/CC-BY-SA-4.0.txt
[license-cc0-1.0]: LICENSES/CC0-1.0.txt
[license-gpl-3.0-or-later]: LICENSES/GPL-3.0-or-later.txt
[maintainer]: https://github.com/mserajnik
[pull-requests]: https://github.com/mserajnik/fish-completions-pass-extensions/pulls
[reuse-spec]: https://reuse.software/spec/
