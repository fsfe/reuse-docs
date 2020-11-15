---
# SPDX-FileCopyrightText: 2019 Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Frequently Asked Questions"
---

{{< toc >}}

# General {#general}

## I am short on time. Can you give me the quickest possible summary? {#quick-summary}

To improve the way that people license their Free Software projects,
three steps are proposed:

### 1. Choose and provide licenses {#step-1}

Choose a [Free Software](https://fsfe.org/about/basics/freesoftware) license
for your project. Find the SPDX identifier of your license in the [SPDX
License List](https://spdx.org/licenses/). Download the license text for your
license from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text) repository
and put it in the `LICENSES/` folder.

### 2. Add copyright and licensing info to each file {#step-2}

Then, for all files, edit the header to contain the following:

```
# SPDX-FileCopyrightText: [year] [copyright holder] <[email address]>
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
that software is [Free Software](https://fsfe.org/about/basics/freesoftware).

## Which license should I choose? {#which-license}

Always choose a Free Software license, i.e., a license giving the recipient
the freedom to use, study, share, and improve the software. The license you
pick beyond that is up to you. If contributing to an existing project, release your
changes under the same license as the project, which is done by default.
Otherwise, the [Free Software Foundation](https://www.gnu.org/licenses/license-recommendations.html),
[choosealicense.com](https://choosealicense.com/), and
[joinup.eu](https://joinup.ec.europa.eu/collection/eupl/joinup-licensing-assistant-jla)
have some good recommendations. These resources each emphasise different values,
and come with their own biases.

Above all, if you value freedom, choose a license that makes your
software [Free Software](https://fsfe.org/about/basics/freesoftware.en.html).

<!-- ## Do I really need to include the license and copyright headers in all files? Why should I care? {#why-care}

TODO -->

## What is SPDX? {#what-is-spdx}

SPDX is the rock upon which REUSE is built and stands for
[Software Package Data Exchange](https://spdx.org/). It is a
project by the [Linux Foundation](https://www.linuxfoundation.org/).
SPDX defines a standardised way to share copyright
and licensing info between projects and people. Most importantly for
REUSE, SPDX maintains the [SPDX License List](https://spdx.org/licenses/), which
defines standardised identifiers for a lot of licenses.

# The REUSE tool {#tool}

## Install and use the REUSE tool {#install-tool}

The REUSE tool is a handy companion to verify your compliance with REUSE
and automate a lot of adjacent tasks. You can find the full documentation for
the tool at <https://reuse.readthedocs.io/>. But the short of it is:

```
$ pip3 install --user fsfe-reuse 
$ export PATH=~/.local/bin:$PATH
$ reuse --help
```

## Exclude a file from REUSE compliance testing {#exclude-file}

If the file is a build artifact and you use Git, ensure the file
is covered by your `.gitignore` file.

Otherwise, you cannot exclude files from REUSE compliance testing. It would go
entirely against the purpose of REUSE: to make sure every file has a
copyright and license tag.

License files are automatically excluded from compliance testing.

If you have an entire folder you want to "exclude" from REUSE compliance
testing, you can [use a DEP5 file](#bulk-license).

<!-- ## Spelling of DEP-5 / DEP5 unclear https://dep-team.pages.debian.net/deps/dep5/ https://wiki.debian.org/Proposals/CopyrightFormat -->

TODO -->

## Plans to support a version control system other than Git? {#no-git}

Currently no, but please [get in
touch](https://github.com/fsfe/reuse-tool/issues).

# Licensing and compliance {#licensing}

<!-- ## Which licenses are compatible? {#compatible-licenses} -->

## Is there a standard format for declaring copyright? {#standard-copyright}

Generally, it is recommended you use `SPDX-FileCopyrightText: [year] [copyright holder]
<[contact address]>`. You may choose to drop items beyond the copyright holder
(which must always be included). Our recommendation is to include all items.

The specification includes a section on the exact format of the copyright
notice. See [the specification](/spec) and [the next question](#copyright-symbol).

## Use SPDX-FileCopyrightText, Copyright, or ©? {#copyright-symbol}

The specification lists the following copyright notices as valid:

```
SPDX-FileCopyrightText: 2019 Jane Doe <jane@example.com>
SPDX-FileCopyrightText: © 2019 John Doe <joe@example.com>
© Example Corporation <https://corp.example.com>
Copyright 2016, 2018-2019 Joe Anybody
Copyright (c) Alice
```

Of those, the first two are highly recommended. The others exist primarily
to be compatible with existing conventions.

<!-- TODO: Link to another question about © -->

## Which years do I include in the copyright statement? {#years-copyright}

Generally, there are four options for you to choose:

1. The year of initial publication.

2. The year of the latest publication.

3. All years of publications, either as range (e.g., 2017–2019) or as separate
   entries (e.g., 2017, 2018, 2019).

4. Do not include any year.

Which option you choose is ultimately up to you.

## Do I need to include both GPL-3.0-or-later and GPL-3.0-only in my repository? {#gpl-plus}

Members of the GPL family are listed separately in the SPDX License List as
-only and -or-later, even though the license texts are identical. If you have
code under only one of these licenses, include only that one license.

If you have code under both an -only license and an -or-later license, it
is recommended you include both licenses separately.

## What are license exceptions and what do I do with them? {#license-exceptions}

License exceptions are additions or alterations to a license often working so as to
permit a certain use of the code that wouldn't otherwise be allowed under the original
one. It is often used by compilers, where a portion of the compiler code may end
up in the resulting binary. The exception may waive rights over portions of code
that end up in binaries.

Exceptions are treated almost identically to licenses. In order to combine a
license with an exception, you mark a file with the following tag:
`SPDX-License-Identifier: GPL-3.0-or-later WITH GCC-exception-3.1`.

## Which files are copyrightable? {#what-is-copyrightable}

All files that are original works of authorship are copyrightable. In essence,
if someone sat down typing their own original thoughts on a keyboard, then that
person holds copyright over the output. Common examples are source code,
documentation, audio, and video.

There are some edge cases, however. For instance, the program `print("Hello,
REUSE!")` does not meet the threshold of originality. Similarly, data
files and configuration files may not meet that threshold either.

## What to do with uncopyrightable files? {#uncopyrightable}

You can use your regular copyright and license header for this file.
There is nothing that stops you from claiming copyright over your own works.
However, a court would still likely find such files uncopyrightable.

It is important to note you are only permitted to do this for your own works. If the
file was authored by someone else, declare their copyright and license in the header.

## How do I copy someone else's work? {#copy-work}

If someone else has made their work available for you to use and copy, you can
incorporate their work into your project, as per the license of said work. When you put
the work in one of the files in your project, you should add an `SPDX-FileCopyrightText`
tag for the copyright holder(s) and an `SPDX-License-Identifier` tag for the license(s)
under which the work was made available.

If the work was licensed differently from your project, verify whether the licenses are
compatible, and add the new ones to your project if need be (and possible).

## Can I copy a work that has no copyright notice or license? {#no-copyright-license}

Before proceeding, always first ensure you can find the copyright and
licensing information elsewhere first. Some projects only include this info in
the root of the repository, or in their README file.

If you cannot find a copyright notice, then that is no problem. You can add the
copyright notice yourself.

If the work has no license, it means you do not have the right to copy it.
If you believe this is a mistake and the author clearly meant for
you to be able to copy this work, contact the author and ask the person to
license their work. Feel free to refer to <https://reuse.software>.

## Where else do I put my license information? {#where-else}

Marking all individual files with `SPDX-License-Identifier` tags goes a long way
towards unambiguously communicating the license info of your project, and helps
communicate it in natural language too. In the README of your project, feel free
to provide a summary of the licensing info, or simply redirect the reader to
your `LICENSES/` folder.

Additionally, many package hosting sites expect the licensing info of your package
to be declared. For instance, the [setup.py file of the REUSE
tool](https://github.com/fsfe/reuse-tool/blob/master/setup.py) declares all the
licenses it uses, in the format expected by the Python packaging
infrastructure.

## What is a copyright holder, and what is an author? {#copyright-holder-author}

In these resources, a distinction between the copyright holder and
the author is maintained. The author (also known as the creator) is the person who
sat down and created the work. Think of the author as a programmer, writer, or artist.

The copyright holder is the person who has the exclusive rights to that work.
Often the author and the copyright holder are the same. However, if the author
is paid by their employer to create a work, the employer is often the copyright holder.

Keep in mind the word "author" is used as a synonym for "copyright holder" in some jurisdictions.
In others, authors maintain some rights to their work even if not the copyright holder.

## I changed a single line of code. Should I add an SPDX-FileCopyrightText tag with my name? {#when-copyright}

The core question is: At what point should I consider myself a copyright
holder over a file? This is at your discretion. It might help adding the tag to
every file you touch for the sake of consistency, but perhaps a more
valuable approach is to reach a consensus about this within your project first.

## How do I deal with a file that has been edited by many people? {#many-copyright-statements}

Some files are edited by many people and would thus end up with an extremely long
list of copyright holders in the header. This may be aesthetically unpleasing, but
not incorrect.

If you would rather not deal with having so many copyright notices, some
projects such as Chromium circumvent this problem by using "Copyright (c) 2013
The Chromium Authors" as their copyright tag. You may consider doing this, but
in so doing, also keep a list of copyright holders and authors in a separate file
in your project.

## Why can't I just use version control to record copyright? {#vcs-copyright}

In [a previous question](#copyright-holder-author), you will find the distinction
between copyright holders and authors upheld, as they are not always the same.
Version control software typically only records authorship, making it unsuitable
for the task of recording copyright.

Another obstacle is that of version control history potentially containing errors,
and as fixing such errors requires rewriting the history, this causes all
contributors having to re-download the new trunk.

A further issue of version control software is the `blame` command is
typically (mis)used to find authorship, but line-by-line shows only the author of the
last commit of each line, even if the change only fixed a typo.

## Can I bulk-license whole folders? {#bulk-license}

With many files, it may not be easy or practical to edit each so that they all
contain a header. While doing this would be ideal, there is an alternative.
By creating the file `.reuse/dep5` in the root of your project, you can
bulk-license a folder recursively. Example:

```
Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
Upstream-Name: my-project
Upstream-Contact: Jane Doe <jane@example.com>
Source: https://git.example.com/jane/my-project

Files: resources/img/*
Copyright: 2017 Jane Doe <jane@example.com>
License: CC-BY-4.0

Files: resources/vid/*
Copyright: 2017 Jane Doe <jane@example.com>
           2017 John Doe <john@example.com>
License: CC0-1.0
```

You can read more about this file format by Debian
[here](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/).

## Can I license only a part of a file as being under a different license? {#partial-license}

The short answer is that yes, you can, but no, there is no standard way for
REUSE to recognize this. If you have a small segment of a file licensed
differently, you should list that license under a separate
`SPDX-License-Identifier` tag in the header.

You can use your own comments to specify which segment is separately licensed.
For instance: "The class Foo is copied from project Bar and licensed under MIT.
All changes are licensed under GPL-3.0-or-later."

A possible way to circumvent the problem is to extract the segment from the
file, and to keep it as its own file.

## How do I properly declare multi-licensing? {#multi-licensing}

You should always include all licenses in the `LICENSES/` folder.

The correct SPDX license expression applying to the file depends on
intent. If all the code within the file is licensed under multiple licenses, and the
licensee can choose which license they consume the work under, use
`SPDX-License-Identifier: MPL-1.1 OR GPL-2.0-or-later OR LGPL-2.1-or-later`, as
parts of Firefox do.

If all the code within the file is licensed under multiple licenses, and the
user must comply with all licenses simultaneously, use
`SPDX-License-Identifier: LGPL-2.0-or-later AND AML`, as is the case in the Simple
DirectMedia Layer (SDL).

If all the code within the file is licensed under either one license or another
(for instance, all code is under GPL-2.0-only, but one function is under MIT),
use separate tags `SPDX-License-Identifier: GPL-2.0-only` and
`SPDX-License-Identifier: MIT`.

You can read more about SPDX expressions [on the SPDX
wiki](https://wiki.spdx.org/view/LicenseExpressionFAQ).

<!-- ## How to deal with MIT/BSD licenses which include copyright info themselves? {#mit-bsd}

TODO: Figure this one out -->

## I only have a single license file. Should I still create a LICENSES folder? {#single-license}

Yes. This may seem extraneous, but prevents future confusion when differently
licensed code is adopted. By keeping all licenses in a single folder, any
user of your program can find all the licenses they need to comply with in the
blink of an eye.

## Should I put comment headers in my license files? {#header-in-license}

You should not edit license files. Please see [this question](#edit-license).

## How do I use a license not found in the SPDX License List? {#custom-license}

<!-- TODO: Explain that the user probably shouldn't use a custom license -->

If the SPDX License List does not have your unsuited, yet to be included, custom
or modified license, you could place your license in the file
`LICENSES/LicenseRef-MyLicense.txt`. By naming your license as such, tools speaking
SPDX will still be able to recognise your license.

## How do I use a custom exception? {#custom-exception}

It is not possible to create a custom exception. Instead, you may [create a
custom license](#custom-license) that embeds the exception.

## Should I edit my license files? {#edit-license}

You should never edit license files. When you use an existing license,
always copy it verbatim.

<!-- TODO: the linked section still needs to be written.
Some licenses, such as MIT and the BSD family of licenses, have a line that says
"Copyright (c) [year] [copyright holder]". Please see [this question](#mit-bsd)
about how to deal with those licenses.
-->

There are many reasons why you should not alter license texts, but if you do,
you should use a different SPDX identifier for this license.
See [the previous question](#custom-license).

## Can I edit copyright notices and license disclaimers? {#edit-copyright-and-licensing}

If you find some info is incorrect, you are free to adjust it.
Otherwise, it is usually a good idea to leave copyright notices and license
disclaimers intact. But there is no one-size-fits-all answer here.

## Can I remove the license and copyright information from minified code (e.g., JavaScript)? {#minified}

You can, but probably should not. Many minifiers have an option allowing
you to retain the header comment. If this option is present, use it,
especially if you use a license mandating you include a license disclaimer.

# For lawyers and legal experts {#lawyers}

## I am a lawyer and want a bill of materials {#bill-of-materials}

Install the REUSE tool and run `reuse spdx -o reuse.spdx` in the project root
to create an [SPDX document](https://spdx.org/spdx-specification-21-web-version).
