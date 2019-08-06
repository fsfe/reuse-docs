<!--
SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.

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

## 3.0a1 - 2019-07-10

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
