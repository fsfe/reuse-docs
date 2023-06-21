<!--
SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
SPDX-FileCopyrightText: 2023 DB Systel GmbH

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Change log

This change log follows the [Keep a
Changelog](http://keepachangelog.com/) spec. Every release contains the
following sections:

-   `Added` for new features.
-   `Changed` for changes in existing functionality.
-   `Deprecated` for soon-to-be removed features.
-   `Removed` for now removed features.
-   `Fixed` for any bug fixes.
-   `Security` in case of vulnerabilities.

The versions follow [semantic versioning](https://semver.org).

## Unreleased - YYYY-MM-DD

### Added

- Definition for Commentable and Uncommentable Files. (#123, thanks @Jayman2000)

- Introduce support of in-line snippet comments using
  `SPDX-SnippetBegin`/`SPDX-SnippetEnd`. (#107)

- Introduce `REUSE-IgnoreStart`/`REUSE-IgnoreEnd` to make the REUSE helper tool
  not consider the enclosed content for detecting copyright and licensing
  information. (#104)

- Definition for Covered File and clarify for which file copyright and licensing
  information is required. (#85, thanks @Jayman2000)

- Remove SPDX documents from list of Covered Files. (#103)

- Remove symlinks and zero-byte files from list of Covered Files. (#101)

- Remove submodules and Meson subprojects from list of Covered Files. (#99)

- Clarify which license text files are needed if a SPDX license expression
  contains more than one license and/or exception. (#96)

- URLs to currently applicable SPDX specification. (#49)

- Define current order or precedence. (#131)

### Changed

- Allow `.license` files for commentable files, but strongly recommend adding
  copyright/licensing information in header. (#123, thanks @Jayman2000)

- Bump referenced SPDX version to 2.3, and update links. (#103) (#107)

### Deprecated

### Removed

### Fixed

- Minor typos and grammar mistakes. Thanks @jlovejoy and @Jayman2000!

### Security


## 3.0 - 2019-08-07

### Added

- `SPDX-FileCopyrightText: Jane Doe` is now the recommended way to mark a copyright
  notice instead of `Copyright (C) Jane Doe`. `Copyright` and `©` are still
  supported as prefixes.

- The specification now makes a recommendation on the format of copyright
  notices, but does not mandate anything other than that the copyright notice
  contain the name of the copyright holder. The format is roughly:
  `SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>`

- An FAQ and much-needed tutorial are added to help people along, instead of
  letting the specification do double duty as a tutorial.

- The tool has been updated to be a lot friendlier to use, and to print more
  helpful linting output. In a future release it will automate some tasks (e.g.,
  adding copyright and licensing information headers to specified files).

### Changed

- The DEP5 file which bulk-licenses directories as a sort of global
  configuration file was moved from `debian/copyright` to `.reuse/dep5`.

- The three steps have been changed from

  1. Provide the exact text of each license used
  2. Include a copyright notice and license in each file
  3. Provide an inventory for included software

  to

  1. Choose and provide licenses
  2. Add copyright and licensing information to each file
  3. Confirm REUSE compliance

### Removed

- The specification no longer makes a recommendation on how to deal with
  licenses such as BSD and MIT that themselves contain editable copyright
  notices.

- License files can now only be placed in `LICENSES/[spdx-identifier].[ext]`
  files, instead of the default `LICENSE`, `COPYING`, etc.. As a result, the
  `Valid-License-Identifier` tag is no longer needed.

- The specification no longer makes any mention of version control systems to
  track copyright.

- The specification no longer mentions a bill of materials (SPDX Document).
