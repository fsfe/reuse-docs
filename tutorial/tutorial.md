# Tutorial: How to become REUSE compliant

This tutorial explains the basic methods of how to make a software project REUSE
compliant. By the end of this document, all your files will clearly have their
copyright and licensing marked, and you will be able to verify this using a
linter tool.

Making your project REUSE compliant can be done in three simple steps:

1. Set and provide a license
2. Add license headers to relevant files
3. Confirm compliance with linter

For the purpose of this tutorial, we will assume that the directory of your
project looks like this:

```
project/
├── img/
│   ├── cat.png
│   └── dog.png
├── src/
│   └── main.c
├── .gitignore
├── Makefile
└── README.md
```

If you would like to reproduce the steps in this tutorial on your own computer,
you can clone the example repository. The branch `uncompliant` matches the
structure above, while the `master` branch is the successful result of this
repository.

# 1. Set and provide a license

The first thing you need to do is to [choose a
license](https://choosealicense.com/). For this tutorial, we assume that you
chose the GNU General Public Licence v3.0 (GPL). More than simply choosing a
license, you need to put the licence in your project directory.

In the [SPDX License List](https://spdx.org/licenses/), you notice that the SPDX
Identifier of the license is GPL-3.0-or-later [TODO: explain SPDX identifier, or
link to explanation]. As such, you create a directory `LICENSES`, and put the
[license text from the Free Software Foundation
(FSF)](https://www.gnu.org/licenses/gpl-3.0.txt) in a file called
`GPL-3.0-or-later.txt`.

Note that the file name of the license texts should contain the SPDX Identifier,
suffixed by `.txt`.

# 2. Add license headers to relevant files

Now that you have a license, you need to indicate in the relevant files that
these files fall under that license.  You edit `src/main.c` as such:

```
/*
 * SPDX-Copyright: 2019 Jane Doe <jane@example.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
```

The `SPDX-Copyright` tag records the publication years and copyright holder
of the contents of the file.

The `SPDX-License-Identifier` tag is followed by a [valid SPDX License
Expression](https://spdx.org/specifications), typically just the SPDX
Identifier of the license. [TODO: move this information to step 1?]

Each file must always contain these two tags in the header. You are allowed
to repeat tags if you have multiple copyright holders or licenses.

You edit `Makefile` and `README.md` using this header information, though you
will need to use the correct comment syntax for each.

## FIXME: Binary and uncommentable files

You also want to license our image files under GPL-3.0-or-later.  Unfortunately,
images and other binary files do not have comment headers that one can easily
edit.

There is a simple trick to circumvent this.  Create the files `cat.png.license`
and `dog.png.license`, each containing the same information about license and
copyright holder as above.

TODO: Add link to DEP-5 possibility.

## Change licensing information

Assume you get a phone call from a photographer who says that the photo they
took of their cat, `img/cat.png`, was not licensed under the GPL at all but
under Creative Commons Attribution 4.0 International.

You discover that the SPDX Identifier of this license is CC-BY-4.0, and create
the file `LICENSES/CC-BY-4.0.txt`. You edit it to contain the [full text of the
license](https://creativecommons.org/licenses/by/4.0/legalcode.txt). [TODO:
clarify whether original text is needed or license texts by SPDX are sufficient]

You then edit `cat.png.license` to say:

```
SPDX-Copyright: 2018-2019 Joe Somebody <joe@example.com>

SPDX-License-Identifier: CC-BY-4.0
```

## Build artifacts

When you compile your program, you generate some build artifacts, such as
`src/main.o`.  You do not need to provide any licensing information for those
files.  Just use your `.gitignore` file to ignore these build artifacts.

## Insignificant files

You probably will have files in your project that you do not find particularly
copyrightable, for example configuration files or the `.gitignore`.  Intuitively
you may not want to license these files, but the fundamental idea of REUSE is
that all your files will clearly have their copyright and licensing marked.

One way to indicate that you do not exercise any copyright over this file is
by marking it as being in the public domain. The CC0 license is a good way to
do this. Edit the file to contain:

```
# SPDX-Copyright: 2019 Jane Doe <jane@example.com>
# SPDX-License-Identifier: CC0-1.0
```

[TODO: Link to FAQ explaining which files are probably not copyrightable]

## Result

Your project tree will now look like this:

```
project/
├── img/
│   ├── cat.png
│   ├── cat.png.license
│   ├── dog.png
│   └── dog.png.license
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

# 3. Check whether you did everything correctly

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
Used licenses: CC0-1.0, GPL-3.0-or-later
Read errors: 0
Files with copyright information: 6 / 6
Files with license information: 6 / 6

Congratulations! Your project is REUSE compliant :-)
```

As you can see in the last line, the tool confirms that your project is
compliant with REUSE now! To learn what the different numbers mean, please have
a look at the [full documentation of the REUSE
tool](https://reuse.readthedocs.io).

After going through this tutorial, you understood REUSE and the three basic
steps to properly license your software project – well done! But although we
have covered a few edge cases, you might run into more questions soon. But don't
worry, we are there to help! Our [Frequently Asked
Questions](https://reuse.software/faq) covers common questions as well as
extraordinary cases and will constantly extended. There is also the [full REUSE
specification](https://reuse.software/spec) which formally describes REUSE and
the methods to become compliant. For the REUSE tool, there also is a [full
documentation](https://reuse.readthedocs.io/) available.

If none of the links above were able to answer your question, please contact us
by:

- opening an issue on [reuse-docs](https://github.com/fsfe/reuse-docs) for
  questions on the tutorial, FAQs or specification,
- opening an issue on [reuse-tool](https://github.com/fsfe/reuse-tool) for
  questions on the REUSE tool,
- or [sending an email to the FSFE](https://fsfe.org/contact). Please note that
  we would prefer issues because they are publicly searchable for other people.

Thanks for valuable your contribution to making software reusable!
