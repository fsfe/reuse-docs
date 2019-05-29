<!--
SPDX-Copyright: 2019 Free Software Foundation Europe e.V.

SPDX-License-Identifier: CC-BY-SA-4.0
-->

# General {#general}

## I am short on time. Can you give me the quickest possible summary? {#quick-summary}

We want to improve the way that people license their software projects. We
propose three steps to achieve this:

### 1. Choose and provide licenses {#step-1}

Find the SPDX identifier of your license in the [SPDX License
List](https://spdx.org/licenses/). Download the license text for your license
from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository and put it in the `LICENSES/` directory.

### 2. Add copyright and license information to each file {#step-2}

Then, for all files, edit the header to contain the following:

```
# SPDX-Copyright: [year] [copyright holder] <[email address]>
#
# SPDX-License-Identifier: [identifier]
```

### 3. Confirm REUSE compliance {#step-3}

Use the [REUSE tool](https://github.com/fsfe/reuse-tool) to automate some of
these steps, and to check whether you did everything correctly.

## What is copyright? {#what-is-copyright}

Copyright is a legal construct that grants someone exclusive rights over a
creative work. The most important exclusive right is in the name: The right
to produce copies. Only the copyright holder is allowed to give new copies of
their work to people.

Usually the author is the copyright holder, but often copyright is
transferred to the author's employer. In most places, you do not need to do
anything to gain copyright. As soon as you make a creative work, you (or your
employer) instantly gain copyright over it.

Creative Commons provides a better and lengthier answer in their [Frequently
Asked
Questions](https://creativecommons.org/faq/#what-is-copyright-and-why-does-it-matter).

## What is a license? {#what-is-license}

One problem with copyright as it pertains to software is that it makes software
unshareable by default. A license changes that. A license defines the terms
under which the copyright holder allows the recipient of the license to use the
software.

If the license allows the recipient to [use, study, share and
improve](https://fsfe.org/freesoftware/basics/4freedoms.html) the software, then
that software is Free Software.

## Which license should I choose? {#which-license}

## Do I really need to include the license and copyright headers in all files? Why should I care? {#why-care}

## What is SPDX? {#what-is-spdx}

SPDX stands for [Software Package Data Exchange](https://spdx.org/). It is a
project by the [Linux Foundation](https://www.linuxfoundation.org/) and the rock
upon which REUSE is built. SPDX defines a standardized way to share copyright
and licensing information between projects and people. Most importantly for
REUSE, SPDX maintains the [SPDX License List](https://spdx.org/licenses/), which
defines standardized identifiers for a lot of licenses.

# The tool {#tool}

## How do I install and use the REUSE tool? {#install-tool}

The REUSE tool is a handy companion that can verify your compliance with REUSE
and automate a lot of adjacent tasks. You can find the full documentation for
the tool at <https://reuse.readthedocs.io/>. But the short of it is:

```
$ pip3 install --user fsfe-reuse 
$ export PATH=~/.local/bin:$PATH
$ reuse --help
```

## How do I exclude a file from REUSE compliance testing? {#exclude-file}

If the file is a build artifact and you use Git, simply make sure that the file
is covered by your `.gitignore` file.

Otherwise, you cannot exclude files from REUSE compliance testing. It would go
entirely against the purpose of REUSE: making sure that every file has a
copyright and license tag.

If you really want to exclude a file, consider using the
[CC0](https://creativecommons.org/publicdomain/zero/1.0/) license for this
file.  By doing this, you put the file in the public domain, or your country's
equivalent.

There is one exception: License files are automatically excluded from compliance
testing.

<!-- FIXME: Link to uncopyrightable question and DEP5 question -->

## Do you support a version control system other than Git? {#no-git}

Currently we do not, but please [get in
touch](https://github.com/fsfe/reuse-tool/issues).

# Licensing and compliance {#licensing}

## Which licenses are compatible? {#compatible-licenses}

## Is there a standard format for declaring copyright? {#standard-copyright}

Copyright year copyright holder email

## Which years do I include in the copyright statement? {#years-copyright}

## Do I need to include both GPL-3.0-or-later and GPL-3.0-only in my repository? {#gpl-plus}

Members of the GPL family are listed separately in the SPDX License List as
-only and -or-later, even though the license texts are identical. If you have
code under only one of these licenses, we recommend that you only include that
one license.

If you have code under both an -only license and an -or-later license, we
recommend that you include both licenses separately.

If you do not want to include both licenses separately, you can create the file
`LICENSES/GPL-3.0.txt` and add the following header:

```
Valid-License-Identifier: GPL-3.0-only
Valid-License-Identifier: GPL-3.0-or-later
License-Text:

[license text]
```

## What are license exceptions and what do I do with them? {#license-exceptions}

## Do I use SPDX-Copyright, Copyright, or ©? {#copyright-symbol}

The specification lists the following copyright notices as valid:

```
SPDX-Copyright: 2019 Jane Doe <jane@example.com>
SPDX-Copyright: © 2019 John Doe <joe@example.com>
© Example Corporation <https://corp.example.com>
Copyright 2016, 2018-2019 Joe Anybody
Copyright (c) Alice
```

Out of those, the first two are highly recommended. The others exist primarily
to be compatible with existing conventions.

<!-- TODO: Link to another question about © -->

## Which files are copyrightable? {#what-is-copyrightable}

All files that are original works of authorship are copyrightable. In essence,
if someone sat down typing their own original thoughts on a keyboard, then that
person holds copyright over the output. Common examples are source code,
documentation, audio, and video.

There are some edge cases, however. For instance, the program `print("Hello,
REUSE!")` probably does not meet the threshold of originality. Similarly, data
files and configuration files may not meet that threshold either.

## What to do with uncopyrightable files? {#uncopyrightable}

There are two things that you can do with such a file to make sure that its
copyright and licensing is recorded. The first option is to simply use your
regular copyright and license header for this file. There is nothing that stops
you from claiming copyright over your own works. However, a court would still
likely find such files uncopyrightable.

The alternative is to waive your copyright by using the
[CC0-1.0](https://creativecommons.org/publicdomain/zero/1.0/) license.

It is important to note that you can only do this for your own works. If the
file was authored by someone else, you must declare their copyright and license
in the header.

## How do I copy someone else's work? {#copy-work}

If someone else has made their work available for you to use and copy, you can
incorporate their work into your project. When you put the work in one of the
files in your project, you should add an `SPDX-Copyright` tag for the copyright
holder(s) and an `SPDX-License-Identifier` tag for the license(s) under which
the work was made available.

If the work was licensed differently from your project, you should verify
whether the licenses are compatible, and add the new licenses to your project.

## Can I copy a work that has no copyright notice or license? {#no-copyright-license}

Before you proceed, always first make sure that you can find the copyright and
licensing information elsewhere. Some projects only include this information in
the root directory or in their README file.

If you can find no copyright notice, then that is no problem. You can add the
copyright notice yourself.

If the work has no license, then that means that you do not have the right to
copy it. If you believe that this is a mistake and the author clearly meant for
you to be able to copy this work, you should contact the author and ask them to
license their work.

## Where else do I put my license information? {#where-else}

README

## What is a copyright holder, and what is an author? {#copyright-holder-author}

## I changed a single line of code. Should I add an SPDX-Copyright tag with my name? {#when-copyright}

The core question here is: At what point should I consider myself a copyright
holder over a file? This is up to your discretion. It might help to be
consistent and add the tag to every file you touch, but it is perhaps more
valuable to reach a consensus about this within your project.

## How do I deal with a file that has been edited by many people? {#many-copyright-statements}

Some files are edited by many people and would have an extremely long list of
copyright holders in the header. This may be aesthetically unpleasing, but is
not incorrect.

If you would rather not deal with having so many copyright notices, some
projects such as Chromium circumvent this problem by using "Copyright (c) 2013
The Chromium Authors" as their copyright tag. You may consider doing this, but
you should keep a list of authors in your project.

## Why can't I just use version control to record copyright? {#vcs-copyright}

In [a previous question](#copyright-holder-author), we distinguished between
copyright holders and authors, which are not always the same. Version control
typically only records authorship, which makes it unsuitable for the task of
recording copyright.

Another obstacle is that version control history may contain errors, and fixing
such an error would require rewriting the history, causing all contributors to
have to re-download the new trunk.

## Can I use DEP5 to declare licensing and copyright? {#dep5}

See next question.

## Can I bulk-license whole directories? {#bulk-license}

DEP5

## Can I license only a part of a file as being under a different license? {#partial-license}

The short answer is that yes, you can, but no, there is no standard way for
REUSE to recognize this. If you have a small segment of a file that is licensed
differently, you should list that license under a separate
`SPDX-License-Identifier` tag in the header.

You can use your own comments to specify which segment is separately licensed.
For instance: "The class Foo is copied from project Bar and licensed under MIT.
All changes are licensed under GPL-3.0-or-later."

A possible way to circumvent the problem is to extract the segment from the
file, and to keep it in its own file.

## How do I properly declare multi-licensing? {#multi-licensing}

You should always include all licenses in the `LICENSES/` directory.

The correct SPDX license expression that applies to the file depends on the
intent. If all the code within is licensed under multiple licenses, and the
licensee can choose under which license they consume the work, use
`SPDX-License-Identifier: MPL-1.1 OR GPL-2.0-or-later OR LGPL-2.1-or-later`, as
parts of Firefox do.

If all the code within the file is licensed under multiple licenses, and the
user must comply with all licenses simultaneously, use
`SPDX-License-Identifier: LGPL-2.0-or-later AND AML`, as can be found in Simple
DirectMedia Layer (SDL).

If all the code within the file is licensed under either one license or another
(for instance, all code is under GPL-2.0-only, but one function is under MIT),
use separate tags `SPDX-License-Identifier: GPL-2.0-only` and
`SPDX-License-Identifier: MIT`.

You can read more about SPDX expressions [on the SPDX
wiki](https://wiki.spdx.org/view/LicenseExpressionFAQ).

## How to deal with MIT/BSD licenses which include copyright information themselves? {#mit-bsd}

TODO: Figure this one out

## Should I move my existing LICENSE or COPYING file? {#move-license}

If you use multiple licenses in your project, we recommend that you put all of
your licenses in the `LICENSES/` directory.

If you only have a single license file, see [the next
question](#single-license).

## I only have a single license file. Should I still create a LICENSES directory? {#single-license}

You do not strictly need to put your license in the `LICENSES/` directory,
though we recommend that you do. If you want to keep your license in a single
file (`LICEN[CS]E`, `COPYING`, `COPYRIGHT`), you should edit the file to signal
what licence you are actually using.

Preface your license with the following header:

```
Valid-License-Identifier: [identifier]
License-Text:

[license text]
```

## Should I put comment headers in my license files? {#header-in-license}

## How do I use a license that is not on the SPDX License List? {#custom-license}

<!-- TODO: Explain that the user probably shouldn't use a custom license -->

If you have a custom or modified license that does not appear in the SPDX
License List, place your license in the file
`LICENSES/LicenseRef-MyLicense.txt`, and/or preface your license text with the
tag `Valid-License-Identifier: LicenseRef-MyLicense`. By doing this, SPDX will
still be able to recognise your license.

## Should I edit my license files? {#edit-license}

You should never edit license files. When you use an existing license, you
should always copy it verbatim.

Some licenses, such as MIT and the BSD family of licenses, have a line that says
"Copyright (c) [year] [copyright holder]". Please see [this question](#mit-bsd)
about how to deal with those licenses.

There are many reasons for why you should not alter license texts, but if you do
alter the texts, you should use a different SPDX identifier for this license.
See [the previous question](#custom-license).

## Can I edit copyright and licensing tags? {#edit-tags}

TODO: If erroneous, sure.

## Can I remove the license and copyright information from minified code (e.g., JavaScript)? {#minified}

Probably shouldn't

(but REUSE only applies to source repositories)

# For lawyers and legal experts {#lawyers}

## I am a lawyer and want a bill of materials {#bill-of-materials}

Install the reuse tool and run `reuse spdx -o reuse.spdx` in the project root
to create an [SPDX
document](https://spdx.org/spdx-specification-21-web-version).
