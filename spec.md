---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "REUSE Specification – Version 3.2"
---

This specification defines a standardised method for declaring copyright and
licensing for software projects. The goal of the specification is to have
unambiguous, human- and machine-readable copyright and licensing information for
each individual file in a project. Ideally this information is embedded into
every file, so that the information is preserved when the file is copied and
reused by third parties.

This specification implements [IETF RFC 2119: Key words for use in RFCs to
Indicate Requirement Levels](https://tools.ietf.org/html/rfc2119).

For the revision history of this specification, please see [the change
log](https://git.fsfe.org/reuse/docs/src/branch/stable/CHANGELOG.md).

## Definitions

These are the definitions for some of the terms used in this specification:

- REUSE Tool --- helper tool for compliance with this Specification; available
  at <https://github.com/fsfe/reuse-tool>.

- Project --- any unit of content that can be associated with a distribution of
  software. Typically, a Project is composed of one or more files. Also
  sometimes called a package.

- License File --- a file containing the text of a license.

- Copyright and Licensing Information --- the information that lists the
  copyright holders of a file or work, and describes under which licenses the
  file or work is made available.

- Copyright Notice --- a line of text that conveys copyright of a copyright
  holder.

- Covered File --- any file in a Project, except for
    - The License Files.
    - The files belonging to the Project's version control system (example:
      `.git/`).
    - The files ignored by the version control system (example: files listed in
      `.gitignore`).
    - Submodules of the Project's version control system and Meson subprojects.
      Each submodule and Meson subproject is understood as a separate Project.
    - The files in the `.reuse/` directory in the root of the Project. This
      directory MUST contain only files relevant for the operation of the REUSE
      Tool.
    - Symlinks and files with no data (zero-byte).
    - SPDX documents in their various formats as defined in the [SPDX
      Specification, Clause
      4.4](https://spdx.github.io/spdx-spec/v2.3/conformance/#44-standard-data-format-requirements)
      (example: `sbom.spdx.json`).

- Commentable File --- a plain text file that can contain comments.

- Snippet --- a portion of text in a Commentable File to which different
  Copyright and Licensing Information applies.

- Uncommentable File --- either a plain text file that cannot contain comments
  or a file that is not a plain text file.

- SPDX Specification --- SPDX specification, version 2.3; as available on
  <https://spdx.org/specifications>.

- SPDX License Identifier --- SPDX short-form identifier, as defined in SPDX
  Specification. See also <https://spdx.org/ids> for a short introduction and
  examples.

- SPDX License Expression --- as defined in SPDX Specification, Annex D, at <https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/>.

- SPDX License List --- a list of commonly found licenses and exceptions; as
  available on <https://spdx.org/licenses/>.

- DEP5 --- [Machine-readable `debian/copyright` file, Version
  1.0](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/).
  Where the REUSE Specification and DEP5 state different things, the REUSE
  Specification takes precedence. Specifically in the case of the `Copyright`
  and `License` tags.

## License Files

A Project MUST include a License File for every license under which Covered
Files are licensed.

Each License File MUST be placed in the `LICENSES/` directory in the root of
the Project. The name of the License File MUST be the SPDX License Identifier of the
license followed by an appropriate file extension (example:
`LICENSES/GPL-3.0-or-later.txt`). The License File MUST be in plain text format.

If a license does not exist in the SPDX License List, its SPDX License Identifier
MUST be `LicenseRef-[idstring]` as defined by the SPDX Specification, Clause 10 available at <https://spdx.github.io/spdx-spec/v2.3/other-licensing-information-detected/>.

A Project MUST NOT include License Files for licenses under which none of the
files in the Project are licensed.

Everything that applies to licenses in this section also applies to license
exceptions, with the exception that it is NOT possible to have a license
exception that does not exist in the SPDX License List.

For avoidance of doubt, in practice this means that for every license and
exception that is part of any SPDX License Expression in any Copyright and
Licensing Information associated with any Covered File, there MUST exist a
License File as defined in this section.

## Copyright and Licensing Information

Each Covered File MUST have Copyright and Licensing Information associated with
it. There are two ways to associate Copyright and Licensing Information with a
file. In addition, there is a way to associate Copyright and Licensing
Information with a Snippet.

### Comment headers

To implement this method, each Commentable File SHOULD
contain comments at the top of the file (comment header) that declare that
file's Copyright and Licensing Information.

For Uncommentable Files, the comment header that declares the file's Copyright
and Licensing Information MUST be in an adjacent UTF-8 encoded text file of the same 
name with the additional extension `.license` (example: `cat.jpg.license` if the 
original file is `cat.jpg`).

`.license` files MAY be used with Commentable Files, but it is still RECOMMENDED
that comment headers be put inside Commentable Files.

The comment header MUST contain one or more Copyright Notices and one or more
`SPDX-License-Identifier` tag-value pairs. A tag is followed by a colon,
followed by a text value, and terminated by a newline.

The `SPDX-License-Identifier` tag MUST be followed by a valid SPDX License
Expression describing the licensing of the file (example:
`SPDX-License-Identifier: GPL-3.0-or-later OR Apache-2.0`). If separate sections
of the file are licensed differently, a different `SPDX-License-Identifier` tag
MUST be included for each section.

An example of a comment header:

```
# SPDX-FileCopyrightText: 2016, 2018-2019 Jane Doe <jane@example.com>
# SPDX-FileCopyrightText: 2019 Example NGO
#
# SPDX-License-Identifier: GPL-3.0-or-later
```

If these tags are additionally used in the file without describing the file's
actual license or copyright (for example: as part of an output command or
documentation), these occurrences SHOULD be put between two comments:
`REUSE-IgnoreStart` and `REUSE-IgnoreEnd`. The REUSE Tool then ignores all
Copyright and Licensing Information between these comments. This technique MUST
NOT be used to ignore valid Copyright and Licensing Information.

An example for an ignored block:

```
# SPDX-FileCopyrightText: 2021 Jane Doe
#
# SPDX-License-Identifier: GPL-3.0-or-later

# REUSE-IgnoreStart
echo "SPDX-FileCopyrightText: $(date +'%Y') John Doe" > file.txt
echo "SPDX-License-Identifier: MIT" > file.txt
# REUSE-IgnoreEnd
```

### In-line Snippet comments

If some Copyright and Licensing Information is to apply only to a certain
Snippet instead of the whole Commentable File, SPDX snippet tags MUST be used
(as defined in [SPDX Specification, Annex
H](https://spdx.github.io/spdx-spec/v2.3/file-tags/#h3-snippet-tags-format)).

Such an annotated Snippet block MUST start with `SPDX-SnippetBegin` to mark its
beginning and end with `SPDX-SnippetEnd` to mark the Snippet's end.

Do note that SPDX snippet tags MUST start with `SPDX-Snippet`, meaning that the
correct SPDX copyright tag in a Snippet is `SPDX-SnippetCopyrightText`.

Example:

```
# SPDX-SnippetBegin
# SPDX-License-Identifier: MIT
# SPDX-SnippetCopyrightText: 2022 Jane Doe <jane@example.com>

{$snippet_code_goes_here}

# SPDX-SnippetEnd
```

Snippets may nest, and this is denoted by having
`SPDX-SnippetBegin`/`SPDX-SnippetEnd` pairs within other pairs, in the same way
that parentheses nest in mathematical expressions. In the case of nested
Snippets, the SPDX snippet tags are considered to apply to the inner-most Snippet.

### DEP5

Alternatively, Copyright and Licensing Information MAY be associated with a
file through a DEP5 file. The intended use case of this method is large
directories where including a comment header in each file (or in `.license`
companion files) is impossible or undesirable.

The DEP5 file MUST be named `dep5` and stored in the `.reuse/` directory in the
root of the Project (i.e. `.reuse/dep5`).

The `License` tag MUST be followed by a valid SPDX License Expression describing
the licensing of the associated files.

The `Copyright` tag MUST be followed by a Copyright Notice. The prefix of the
Copyright Notice MAY be omitted.

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

## Order of precedence

Copyright and Licensing Information is considered according to the
following order of precedence:

1. Information defined in the `.license` file.
2. Information defined in the Commentable File.
3. Information defined in `.reuse/dep5`.

There is no merging of information from different sources. Only the
source with the highest precedence is considered.

## Format of Copyright Notices

A Copyright Notice MUST start with a tag, word or symbol (collectively:
prefixes) from the following list:

- `SPDX-FileCopyrightText` (or `SPDX-SnippetCopyrightText` in Snippets)
- Copyright
- ©

It is RECOMMENDED to use the `SPDX-FileCopyrightText` tag. You MAY add '(C)',
'(c)' or '©' after the prefix.

A Copyright Notice MUST be terminated by a newline.

The Copyright Notice MUST contain the name of the copyright holder. The
copyright notice SHOULD contain the year of publication and the contact address
of the copyright holder. The order of these items SHOULD be: year, name, contact
address.

The year of publication MAY be a single year, multiple years, or a span of
years.

The copyright holder SHOULD be an individual, list of individuals, group, legal
entity, or any other descriptor by which one can easily identify the copyright
holder(s).

Any contact address SHOULD be in between angle brackets.

You MAY add any further information to the Copyright Notice.

Examples of valid Copyright Notices:

```
SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
SPDX-FileCopyrightText: © 2019 John Doe <joe@example.com>
SPDX-SnippetCopyrightText: (C) Example Cooperative <info@coop.example.com>
© Example Corporation <https://corp.example.com>
Copyright 2016, 2018-2019 Joe Anybody
Copyright (c) Alice, some rights reserved
```
