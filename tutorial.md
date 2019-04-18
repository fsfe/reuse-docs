# Our goal

By the end of this tutorial, all your files will clearly have their copyright
and licensing marked, and you will be able to verify this using a linter tool.

# Your project

For the purpose of this tutorial, we will assume that the directory of your
project looks like this:

```
project/
├── img/
│   ├── cat.png
│   └── dog.png
├── po/
│   ├── de.po
│   ├── en_GB.po
│   ├── eo.po
│   ├── fr.po
│   ├── nl.po
│   └── POTFILES.in
├── src/
│   └── main.c
├── .gitignore
├── Makefile
└── README.md
```

# A license

The first thing you need to do is to [choose a
license](https://choosealicense.com/). For this tutorial, we assume that you
chose the GNU General Public Licence v3.0 (GPL). More than simply choosing a
license, you need to put the licence in your project directory.

In the [SPDX License List](https://spdx.org/licenses/), you notice that the
SPDX Identifier of the license is GPL-3.0-or-later. As such, you create a
directory `LICENSES`, and put the [license text from the Free Software
Foundation (FSF)](https://www.gnu.org/licenses/gpl-3.0.txt) in a file called
`GPL-3.0-or-later.txt`.

# Header blurb

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
Identifier of the license.

Each file must always contain these two tags in the header. You are allowed
to repeat tags if you have multiple copyright holders or licenses.

You edit `Makefile` and `README.md` using this header blurb, though we will
need to use the correct comment syntax for each.

# FIXME: Binary files

You also want to license our image files under GPL-3.0-or-later.  Unfortunately,
images and other binary files do not have comment headers that one can easily
edit.

There is a simple trick to circumvent this.  Create the files `cat.png.license`
and `dog.png.license`, each containing the same blurb as above.

TODO: Add link to DEP-5 possibility.

# A different license

You get a phone call from a photographer who says that the photo they took of
their cat was not licensed under the GPL at all. They say it was licensed
under Creative Commons Attribution 4.0 International.

You discover that the SPDX Identifier of this license is CC-BY-4.0, and
create the file `LICENSES/CC-BY-4.0.txt`. You edit it to contain the [full
text of the
license](https://creativecommons.org/licenses/by/4.0/legalcode.txt).

You then edit `cat.png.license` to say:

```
SPDX-Copyright: 2018-2019 Joe Somebody <joe@example.com>

SPDX-License-Identifier: CC-BY-4.0
```

# Build artifacts

When you compile your program, you generate some build artifacts, such as
`src/main.o`.  You do not need to provide any licensing information for those
files.  Just use your `.gitignore` file to ignore these build artifacts.

# Insignificant files

You have a `.gitignore` file in your project that you do not find particularly
copyrightable.  You do not want to license this file, but at the beginning of
this tutorial, we said that "all your files will clearly have their copyright
and licensing marked."  Skipping this file would break that promise.

One way to indicate that you do not exercise any copyright over this file is
by marking it as being in the public domain. The CC0 license is a good way to
do this. Edit the file to contain:

```
# SPDX-Copyright: 2019 Jane Doe <jane@example.com>
# SPDX-License-Identifier: CC0-1.0
```

# Checking whether you did everything correctly

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
$
$ # The executable is now in $HOME/.local/bin/.  Make sure that this is in your
$ # $PATH.
$
$ # Go to the directory and run the linter.
$ cd path/to/project/
$ reuse lint
TODO: Figure out human-friendly output maybe.
```

# Result

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
├── po/
│   ├── de.po
│   ├── en_GB.po
│   ├── eo.po
│   ├── fr.po
│   ├── nl.po
│   └── POTFILES.in
├── .reuse/
│   └── dep5
├── src/
│   └── main.c
├── .gitignore
├── Makefile
└── README.md
```

TODO: Better finishing note.

TODO: Maybe create the above project for real in a read-only repo?
