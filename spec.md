---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "REUSE Specification – Version 3.0a1"
---

This specification defines a standardized method for declaring copyright and
licensing for software projects. The goal of the specification is to have
unambiguous, human- and machine-readable copyright and licensing information for
each individual file in a project. Ideally this information is embedded into
every file, so that the information is preserved when the file is copied and
reused by third parties.

This specification implements [IETF RFC 2119: Key words for use in RFCs to
Indicate Requirement Levels](https://tools.ietf.org/html/rfc2119).

## Definitions

These are the definitions for some of the terms used in this specification:

- Project --- any unit of content that can be associated with a distribution of
  software. Typically, a Project is composed of one or more files. Also
  sometimes called a package.

- License File --- a file containing the text of a license.

- Copyright and Licensing Information --- the information that lists the
  copyright holders of a file or work, and describes under which licenses the
  file or work is made available.

- SPDX Specification --- SPDX specification, version 2.1; as available on
  <https://spdx.org/specifications>.

- SPDX Identifier --- SPDX short-form identifier, as defined in SPDX
  Specification. See also <https://spdx.org/ids> for a short introduction and
  examples.

- SPDX License Expression --- as defined in SPDX Specification.

- SPDX License List --- a list of commonly found licenses and exceptions; as
  available on <https://spdx.org/licenses/>.

- DEP5 --- [Machine-readable `debian/copyright` file, Version
  1.0](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/).
  Where the REUSE Specification and DEP5 state different things, the REUSE
  Specification takes precedence. Specifically in the case of the `Copyright`
  and `License` tags.

- REUSE Tool --- helper tool for compliance with this Specification; available
  at <https://github.com/fsfe/reuse-tool>.

## License files

A Project MUST include a License File for every license under which files in the
Project are licensed.

Each License File MUST be placed in the `LICENSES/` directory in the root of
the Project. The name of the License File MUST be the SPDX identifier of the
license followed by an appropriate file extension (example:
`LICENSES/GPL-3.0-or-later.txt`). The License File MUST be in plain text format.

If a license does not exist in the SPDX License List, its SPDX Identifier
MUST be `LicenseRef-[idstring]` as defined by the SPDX Specification.

A Project MUST NOT include License Files for licenses under which none of the
files in the Project are licensed.

Everything that applies to licenses in this section also applies to license
exceptions, with the exception that it is NOT possible to have a license
exception that does not exist in the SPDX License List.

## Copyright and Licensing Information

Each file in the Project MUST have Copyright and Licensing Information
associated with it, except the following files:

- The License Files.

- The files belonging to the Project's version control system (example:
  `.git/`).

- The files ignored by the version control system (example: Files listed in
  `.gitignore`).

- The files in the `.reuse/` directory in the root of the Project. This
  directory MUST contain only files relevant for the operation of the REUSE
  Tool.

There are two ways to associate Copyright and Licensing Information with a
file.

### Comment headers

To implement this method, each plain text file that can contain comments MUST
contain comments at the top of the file (comment header) that declare that
file's Copyright and Licensing Information.

If a file is not a plain text file or does not permit the inclusion of
comments, the comment header that declares the file's Copyright and Licensing
Information SHOULD be in an adjacent file of the same name with the
additional extension `.license` (example: `cat.jpg.license` if the original
file is `cat.jpg`).

The comment header MUST contain one or more `SPDX-FileCopyrightText` tags, and one or
more `SPDX-License-Information` tags. A tag is followed by a colon, followed by
a text value, and terminated by a newline.

The `SPDX-FileCopyrightText` tag MUST be followed by a copyright notice as described
in <!-- FIXME: Refer to an internal section -->.

Instead of the `SPDX-FileCopyrightText` tag, the symbol `©`, or the word `Copyright` MAY
be used, in which case a colon is not needed.

The `SPDX-License-Identifier` tag MUST be followed by a valid SPDX License
Expression describing the licensing of the file (example:
`SPDX-License-Identifier: GPL-3.0-or-later OR Apache-2.0`). If separate sections
of the file are licensed differently, a different `SPDX-License-Identifier` tag
MUST be included for each section.

An example of a comment header:

```
# SPDX-FileCopyrightText: 2016, 2018-2019 Jane Doe <jane@example.com>
# SPDX-FileCopyrightText: 2019 Example Company
#
# SPDX-License-Identifier: GPL-3.0-or-later
```

### DEP5

Alternatively, Copyright and Licensing Information MAY be associated with a
file through a DEP5 file. The intended use case of this method is large
directories where including a comment header in each file (or in `.license`
companion files) is impossible or undesirable.

The DEP5 file MUST be named `dep5` and stored in the `.reuse/` directory in the
root of the Project (i.e. `.reuse/dep5`).

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

A copyright notice MUST be prefixed by a tag, symbol or word denoting a
copyright notice as described in this specification.

The copyright notice MUST contain the name of the copyright holder. The
copyright notice SHOULD contain the year of publication and the contact address
of the copyright holder. The order of these items SHOULD be: year, name, contact
address.

The year of publication MAY be a single year, multiple years, or a span of
years.

The copyright holder MAY be an individual, list of individuals, group, legal
entity, or any other descriptor by which one can easily identify the
copyright holder(s).

Any contact address SHOULD be in between angle brackets.

Examples of valid copyright notices:

```
SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
SPDX-FileCopyrightText: © 2019 John Doe <joe@example.com>
© Example Corporation <https://corp.example.com>
Copyright 2016, 2018-2019 Joe Anybody
Copyright (c) Alice
```
