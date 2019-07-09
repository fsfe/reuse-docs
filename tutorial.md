<!--
SPDX-Copyright: Free Software Foundation Europe e.V.

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# Tutorial: How to become REUSE compliant

This tutorial explains the basic methods of how to make a software project REUSE
compliant. By the end of this document, all your files will clearly have their
copyright and licensing marked, and you will be able to verify this using a
linter tool.

Making your project REUSE compliant can be done in three simple steps:

1. Choose and provide licenses
2. Add copyright and license information to each file
3. Confirm REUSE compliance

For the purpose of this tutorial, we will assume that the directory of your
project looks like this:

```
project/
├── img/
│   ├── cat.jpg
│   └── dog.jpg
├── src/
│   └── main.c
├── .gitignore
├── Makefile
└── README.md
```

If you would like to reproduce the steps in this tutorial on your own
computer, you can clone the [example
repository](https://github.com/fsfe/reuse-example). The branch `noncompliant`
matches the structure above, while the `master` branch is the successful
result of this repository.

## 1. Choose and provide licenses

The first thing you need to do is to [choose a license]({{< relref
"faq.md#which-license" >}}). For this tutorial, we assume that you chose the GNU
General Public License v3.0 or any later version (GPL). More than simply
choosing a license, you need to put the license in your project directory.

You find your license in the [SPDX License List](https://spdx.org/licenses/).
SPDX is an open standard for communicating license and copyright information.
Each license is uniquely identified by a shortform [SPDX License
Identifier](https://spdx.org/licenses). The SPDX License Identifier for your
chosen license is GPL-3.0-or-later.

<!-- TODO: Use tool instead -->

You create a `LICENSES` directory in your project root which will contain all
the licenses that you use in your project. You then download your license
from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository and put it in the `LICENSES` directory.

## 2. Add copyright and licensing information to each file

Now that you have a license, you need to indicate in the relevant files that
these files fall under that license. You edit the comment header of
`src/main.c` as such:

```
/*
 * SPDX-Copyright: 2019 Jane Doe <jane@example.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
```

The `SPDX-Copyright` tag records the publication years and copyright holder of
the contents of the file. You can read more about [which publication years to
use]({{< relref "faq.md#years-copyright" >}}) and [what copyright holders
are]({{< relref "faq.md#copyright-holder-author" >}}) in the FAQ.

The `SPDX-License-Identifier` tag is followed by a [valid SPDX License
Expression](https://spdx.org/specifications), typically just the SPDX
License Identifier of the license.

Each file must always contain these two tags in the header. You are allowed to
use the tags multiple times if you have multiple copyright holders or licenses.

In the example project, you also edit `Makefile` and `README.md` using this
header information, but of course with corresponding comment syntax.

### Binary and uncommentable files

You also want to license your image files under GPL-3.0-or-later.
Unfortunately, images and other binary files do not have comment headers that
one can easily edit. Other examples include automatically generated files and
certain data and configuration files for which comments are non-trivial.

There is a simple trick to circumvent this. Create the files `cat.jpg.license`
and `dog.jpg.license`, each containing the same information about license and
copyright holder as above.

### Change licensing information

You discover that the photos of the cat and the dog were not licensed under the
GPL at all, but under Creative Commons Attribution 4.0 International, owned by
Max Mehl.

The SPDX License Identifier of this license is CC-BY-4.0.  You create the file
`LICENSES/CC-BY-4.0.txt`, following the same steps you used for
GPL-3.0-or-later.

You then edit `cat.jpg.license` and `dog.jpg.license` to say:

```
SPDX-Copyright: 2019 Max Mehl <max.mehl@fsfe.org>

SPDX-License-Identifier: CC-BY-4.0
```

### Build artifacts

When you compile your program, you generate some build artifacts, such as
`src/main.o`.  You do not need to provide any licensing information for those
files.  Just use your `.gitignore` file to ignore these build artifacts.  The
REUSE tool will respect the contents of `.gitignore`.

### Insignificant files

You probably will have files in your project that you do not find
particularly copyrightable, for example configuration files such as
`.gitignore`. Intuitively you may not want to license these files, but the
fundamental idea of REUSE is that all your files will clearly have their
copyright and licensing marked.

One way to indicate that you do not exercise any copyright over this file is
by marking it as being in the public domain. The [CC0
license](https://creativecommons.org/publicdomain/zero/1.0/) is a good way to
do this. Edit the file to contain:

```
# SPDX-Copyright: 2019 Jane Doe <jane@example.com>
#
# SPDX-License-Identifier: CC0-1.0
```

<!-- [TODO: Link to FAQ explaining which files are probably not copyrightable] -->

### Result

Your project tree will now look like this:

```
project/
├── img/
│   ├── cat.jpg
│   ├── cat.jpg.license
│   ├── dog.jpg
│   └── dog.jpg.license
├── LICENSES/
│   ├── CC0-1.0.txt
│   ├── CC-BY-4.0.txt
│   └── GPL-3.0-or-later.txt
├── src/
│   └── main.c
├── .gitignore
├── Makefile
└── README.md
```

## 3. Confirm REUSE compliance

Now that you have marked all files with their copyright and licensing, it is
time to check whether you did not miss anything. To do this, we provide a
linter tool for you to use. You can read the [full
documentation](https://reuse.readthedocs.io/), or read the quick steps below.

```
$ # Install the dependencies for the tool.
$ sudo apt install python3 python3-pip
$
$ # Install the tool
$ pip3 install --user fsfe-reuse
```

The executable is now in `$HOME/.local/bin/`. Make sure that this is in your
`$PATH`. Now go to the project directory and run the linter.

```
$ cd path/to/project/
$ reuse lint
SUMMARY

Bad licenses: 0
Missing licenses: 0
Unused licenses: 0
Used licenses: CC-BY-4.0, CC0-1.0, GPL-3.0-or-later
Read errors: 0
Files with copyright information: 6 / 6
Files with license information: 6 / 6

Congratulations! Your project is REUSE compliant :-)
```

<!-- FIXME: Link to output explanation -->

As you can see in the last line, the tool confirms that your project is
compliant with REUSE now! To learn what the different numbers mean, please have
a look at the [full documentation of the reuse
tool](https://reuse.readthedocs.io).

## Getting help

After going through this tutorial, you understood REUSE and the three basic
steps to properly license your software project – well done! But although we
have covered a few edge cases, you might run into more questions soon. But
don't worry, we are here to help!:

- Our [Frequently Asked Questions](https://reuse.software/faq) covers common
questions as well as extraordinary cases and will constantly be updated.

- The full [REUSE specification](https://reuse.software/spec) formally
describes REUSE and the methods to become compliant.

- The [REUSE tool documentation](https://reuse.readthedocs.io/) describes
  installation and usage of the REUSE tool.

If none of the links above were able to answer your question, please contact us
by:

- opening an issue on [reuse-docs](https://github.com/fsfe/reuse-docs) for
  questions on the tutorial, FAQ or specification;

- opening an issue on [reuse-tool](https://github.com/fsfe/reuse-tool) for
  questions on the REUSE tool;

- or [sending an email to the FSFE](https://fsfe.org/contact). Please note that
  we would prefer issues because they are publicly searchable for other people.

Thank you for your valuable contribution towards making software reusable!
