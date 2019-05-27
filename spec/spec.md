<!--
SPDX-Copyright: 2019 Free Software Foundation Europe e.V.

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# REUSE Specification

This specification defines a standardized method for declaring copyright and
licensing for software projects. The goal of the specification is to have
unambiguous, machine-readable copyright and licensing information for each
individual file in a project.

This specification implements [IETF RFC 2119: Key words for use in RFCs to
Indicate Requirement Levels](https://tools.ietf.org/html/rfc2119).

## Definitions

These are the definitions for some of the terms used in this specification:

- Project --- ...

- License File --- a file containing the text of a license.

- SPDX Identifier --- SPDX short-form identifier, as defined in SPDX
  Specification. See also <https://spdx.org/ids> for a short introduction and
  examples.

- SPDX License Expression --- as defined in SPDX Specification.

- SPDX Specification --- SPDX specification, version 2.1; as available on
  <https://spdx.org/specifications>.

<!-- DEP5 -->

## License files

A project MUST include a license file for every license under which files in the
project are licensed.

Each license file SHOULD be placed in the `LICENSES/` directory in the root of
the project. The name of the license file SHOULD be the SPDX identifier of the
license followed by an appropriate file extension (example:
`LICENSES/GPL-3.0-or-later.txt`). The License File SHOULD be in plain text
format.

<!-- FIXME: Rephrase "above recommendation". Maybe use paragraph numbers? -->

A License File whose file name does not conform to the above recommendation MUST
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

A project MAY contain a single license file outside of the `LICENSES/` directory
in the file `COPYING`, `COPYRIGHT`, `LICENSE` or `LICENCE` in the root of the
project.

If a license does not exist in the SPDX License List, its SPDX identifier
MUST be `LicenseRef-[idstring]` as defined by the SPDX Specification.

A project MUST NOT include license files for licenses under which none of the
files in the project are licensed.

Everything that applies to licenses in this section also applies to license
exceptions, with the following exceptions:

- Exception files MUST be placed in the `LICENSES/` directory in the root of the
  project.

- The tags `Valid-Exception-Identifier` and `Exception-Text` MUST be used
  instead of `Valid-License-Identifier` and `License-Text`.

<!-- Can we use LicenseRef for exceptions? -->

<!-- TODO: Change "copyright and licensing information" to something shorter?
Shorten it to CALI? -->

## Copyright and licensing information

Each file in the project MUST have copyright and licensing information
associated with it, except the following files:

- The license files.

- The files belonging to the project's version control system (example:
  `.git/`).

- The files ignored by the version control system (example: `.gitignore`).

- The files in the `.reuse/` directory in the root of the project.

<!-- TODO: The files inside of a git submodule -->

There are various ways to associate copyright and licensing information with a
file.

### Comment headers

Each plain text file that can contain comments SHOULD contain comments at the
top of the file (comment header) that declare that file's copyright and
licensing information.

If a file is not a plain text file or does not permit the inclusion of
comments, the comment header that declares the file's copyright and licensing
information SHOULD be in an adjacent file of the same name with the
additional extension `.license` (example: `cat.jpg.license` if the original
file is `cat.jpg`).

The comment header MUST contain one or more `SPDX-Copyright` tags, and one or
more `SPDX-License-Information` tags. A tag is followed by a colon, followed by
a text value, and terminated by a newline.

The `SPDX-Copyright` tag MUST be followed by a copyright notice as described
in <!-- FIXME: Refer to an internal section -->.

Instead of the `SPDX-Copyright` tag, the symbols `Copyright`, `Copyright (c)`,
`Copyright (C)`, `Copyright ©` or `©` MAY be used.

The `SPDX-License-Identifier` tag MUST be followed by a valid SPDX License
Expression describing the licensing of the file (example:
`SPDX-License-Identifier: GPL-3.0-or-later OR Apache-2.0`). If separate sections
of the file are licensed differently, a different `SPDX-License-Identifier` tag
SHOULD be included for each section.

An example of a comment header:

```
# SPDX-Copyright: 2016, 2018-2019 Jane Doe <jane@example.com>
# SPDX-Copyright: 2019 Example Company
#
# SPDX-License-Identifier: GPL-3.0-or-later
```

### DEP5

Copyright and licensing information MAY be associated with a file through a DEP5
file. The intended use case of this method is large directories where including
a comment header in each file (or in `.license` companion files) is impossible
or undesirable.

The DEP5 file MUST be in `.reuse/dep5` from the root of the project.

<!-- TODO: How to do multiple licenses without AND and OR. -->

The `License` tag MUST be followed by a valid SPDX License Expression describing
the licensing of the associated files.

The `Copyright` tag MUST be followed by a copyright notice as described in <!--
FIXME: Refer to an internal section -->.

An example of a DEP5 file:

```
Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: Project
Upstream-Contact: Jane Doe <jane@example.com>
Source: https://example.com/jane/project

Files: po/*
Copyright: 2019 Translation Company
License: GPL-3.0-or-later
```

## Format of copyright notices

A copyright notice MUST start with the copyright symbol (©), the word
"Copyright", or an equivalent tag, followed by the year(s) of publication, the
name of the copyright holder, and the e-mail address of the copyright holder.
The order of these items MAY be changed, but SHOULD be consistent within the
project. The items except the name of the copyright holder MAY be omitted.

Examples of valid copyright notices:

```
SPDX-Copyright: 2019 Jane Doe <jane@example.com>
© Jane Doe
Copyright 2016, 2018-2019 Jane Doe
```
