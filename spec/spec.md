# REUSE Specification

This specification defines a standardized method for declaring copyright and
licensing for software projects. The goal of the specification is to have
unambiguous, machine-readable copyright and licensing information for each
individual file in a project.

## Definitions

These are the definitions for some of the terms used in this specification:

- Project --- ...

- License file --- ...

<!-- Also put a link to the SPDX Specification here somewhere -->

<!-- Also DEP5 -->

## License files

A project must include a license file for every license under which files in the
project are licensed.

Each license file should be placed in the `LICENSES/` directory in the root of
the project. The name of the license file should be the SPDX identifier of the
license followed by a file extension (example: `GPL-3.0-or-later.txt`).

<!-- FIXME: Rephrase "above recommendation". Maybe use paragraph numbers? -->

A license file whose name does not conform to the above recommendation must
contain, at the start of the file, one or more `Valid-License-Identifier` tags,
followed by a `License-Text` tag, followed by the license text. Example:

```
Valid-License-Identifier: GPL-3.0-only
Valid-License-Identifier: GPL-3.0-or-later
License-Text:

                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

[...]
```

A project may contain a single license file outside of the `LICENSES/` directory
in the file `COPYING`, `COPYRIGHT`, `LICENSE` or `LICENCE` in the root of the
project.

If a license does not exist in the SPDX License List, its SPDX identifier is
`LicenseRef-[idstring]` as defined by the SPDX Specification.

A project must not include license files for licenses under which none of the
files in the project are licensed.
