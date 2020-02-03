---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Tutorial: How to become REUSE-compliant"
---

This tutorial explains the basic methods of how to make a software project
REUSE-compliant. By the end of this document, all your files will clearly have
their copyright and licensing marked, and you will be able to verify this using
the REUSE helper tool.

Making your project REUSE-compliant can be done in three simple steps:

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

For each of these steps, you will first learn how to achieve them
manually. However, the [REUSE helper
tool](https://github.com/fsfe/reuse-tool) supports you with most tasks,
and the necessary commands will be listed as well in the collapsible
boxes. We recommend to first understand the basic principle before just
executing the tool's commands.

## 1. Choose and provide licenses {#step-1}

The first thing you need to do is to [choose a license]({{< relref
"faq.md#which-license" >}}). For this tutorial, we assume that you chose the GNU
General Public License (GPL) v3.0 or any later version. More than simply
choosing a license, you need to put the license in your project directory.

You find your license in the [SPDX License List](https://spdx.org/licenses/).
SPDX is an open standard for communicating license and copyright information.
Each license is uniquely identified by a shortform [SPDX License
Identifier](https://spdx.org/licenses). The SPDX License Identifier for your
chosen license is GPL-3.0-or-later.

You create a `LICENSES` directory in your project root which will contain all
the licenses that you use in your project. You then download your license
from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository and put it in the `LICENSES` directory.

{{< box-tool >}}

You can initialise your project using `reuse init`. In an interactive
dialogue you can define certain information for your project and also
one or multiple licenses. At the end, these licenses will be
automatically downloaded to the correct location.

The `reuse download` command enables you to download a specific
license. `reuse download GPL-3.0-or-later` would fulfil the task
described in the manual instructions above. Running `reuse download
--all` automatically downloads all licenses the REUSE helper tools
detects as being used in your project.

{{< /box-tool >}}

## 2. Add copyright and licensing information to each file {#step-2}

Now that you have a license, you need to indicate in the relevant files that
these files fall under that license. You edit the comment header of
`src/main.c` as such:

```
/*
 * SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
```

The `SPDX-FileCopyrightText` tag records the publication years and copyright holder of
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

{{< box-tool >}}

The `reuse addheader` command helps with adding licensing and copyright
information to your files. For the task above, the following command
would do the job:

```bash
reuse addheader --year="2019" --copyright="Jane Doe <jane@example.com>" --license="GPL-3.0-or-later" src/main.c Makefile README.md
```

Please see the [tool's documentation about
addheader](https://reuse.readthedocs.io/en/stable/usage.html#addheader)
for more options like comment styles and templates

{{< /box-tool >}}

### Binary and uncommentable files

You also want to license your image files under GPL-3.0-or-later.
Unfortunately, images and other binary files do not have comment headers that
one can easily edit. Other examples include automatically generated files and
certain data and configuration files for which comments are non-trivial.

There is a simple trick to circumvent this. Create the files `cat.jpg.license`
and `dog.jpg.license`, each containing the same information about license and
copyright holder as above.

{{< box-tool >}}

The REUSE helper tool should automatically detect binary files and
therefore automatically create a corresponding `.license` file.

If you would like to enforce this, add the `--explicit-license`
argument to the addheader command. So the command for the above task
may look like this:

```bash
reuse addheader --year="2019" --copyright="Jane Doe <jane@example.com>" --license="GPL-3.0-or-later" --explicit-license img/cat.jpg img/dog.jpg
```

{{< /box-tool >}}

### Change licensing information

You discover that the photos of the cat and the dog were not licensed under the
GPL at all, but under Creative Commons Attribution 4.0 International, owned by
Max Mehl.

The SPDX License Identifier of this license is CC-BY-4.0. You create the file
`LICENSES/CC-BY-4.0.txt`, following the same steps you used for
GPL-3.0-or-later.

You then edit `cat.jpg.license` and `dog.jpg.license` to say:

```
SPDX-FileCopyrightText: 2019 Max Mehl <max.mehl@fsfe.org>

SPDX-License-Identifier: CC-BY-4.0
```

{{< box-tool >}}

The tool as of now does not provide a way to replace existing
REUSE-compliant copyright and licensing information. A modified run of
the `addheader` command would not replace but extend the `.license`
files with two additional lines stating the copyright of Max Mehl and
the CC-BY-4.0 license. So you would have to update these manually.

However, the `download` command afterwards would allow you to download
the new license automatically, so either with `reuse download
CC-BY-4.0` or simply `reuse download --all`.

{{< /box-tool >}}

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

If you do not exercise any copyright over this file, you can use the [CC0
license](https://creativecommons.org/publicdomain/zero/1.0/). This is
functionally identical to putting the file in the public domain. Edit the file to
contain:

```
# SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
#
# SPDX-License-Identifier: CC0-1.0
```

Consequently, you will have to provide the CC0-1.0 license in the `LICENSES/` directory as well, just like the GPL-3.0-or-later and CC-BY-4.0 before.

More information about copyrightable files can be found in the [REUSE FAQ]({{< relref
"faq.md#what-is-copyrightable" >}}).

{{< box-tool >}}

As before, a combination of the `addheader` and `download` commands will fulfil the above step:

```bash
reuse addheader --year="2019" --copyright="Jane Doe <jane@example.com>" --license="CC0-1.0" .gitignore

reuse download --all
```

{{< /box-tool >}}

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

## 3. Confirm REUSE compliance {#step-3}

Now that you have marked all files with their copyright and licensing, it is
time to check whether you did not miss anything. To do this, we provide a
helper tool for you to use. You can read the [full
documentation](https://reuse.readthedocs.io/), or read the quick steps below.

Follow the [installation instructions](https://github.com/fsfe/reuse-tool#install) available for multiple platforms. Now go to the project directory and run the linter.

```
$ cd path/to/project/
$ reuse lint
# SUMMARY

* Bad licenses:
* Deprecated licenses:
* Licenses without file extension:
* Missing licenses:
* Unused licenses:
* Used licenses: CC-BY-4.0, CC0-1.0, GPL-3.0-or-later
* Read errors: 0
* Files with copyright information: 6 / 6
* Files with license information: 6 / 6

Congratulations! Your project is compliant with version 3.0 of the REUSE Specification :-)
```

As you can see in the last line, the tool confirms that your project is
compliant with REUSE now! To learn what the different numbers mean,
please have a look at the [documentation of the lint command](https://reuse.readthedocs.io/en/stable/usage.html#lint).

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
