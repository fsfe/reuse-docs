# General

## What is copyright?

## What are licenses?

## Which license should I choose?

## Do I really need to include the license and copyright headers in all files? Why should I care?

## What is SPDX?

# The tool

## How do I install and use the REUSE tool?

The REUSE tool is a handy companion that can verify your compliance with
REUSE and automate a lot of adjacent tasks. You can find the full
documentation for the tool at <https://reuse.readthedocs.io/>. But the short
of it is:

```
$ pip3 install --user fsfe-reuse 
$ export PATH=~/.local/bin:$PATH
$ reuse --help
```

## How do I exclude a file from REUSE compliance testing?

CC0
gitignore

A few files are automagically excluded

# Licensing and compliance

## Is there a standard format for declaring copyright?

Copyright year copyright holder email

## Which years do I include in the copyright statement?

## How do I declare a file as being under a certain license?

Find the SPDX identifier of your license in the [SPDX License
List](https://spdx.org/licenses/). Download the license text for your license
from the
[license-list-data](https://github.com/spdx/license-list-data/tree/master/text)
repository and put it in `LICENSES/<identifier>.txt`, where `<identifier>` is
equal to the SPDX identifier.

Then, edit the header of your file to contain the following:

```
# SPDX-Copyright: <year> <copyright holder> <email address>
#
# SPDX-License-Identifier: <identifier>
```

## Do I need to include both GPL-3.0-or-later and GPL-3.0-only in my repository?

## What are license exceptions and what do I do with them?

## Do I use SPDX-Copyright, Copyright, or ©?

## Which files are copyrightable?

README

LICENSE (strange exception)

## What to do with uncopyrightable files?

## Where else do I put my license information?

README

## What is a copyright holder, and what is an author?

## How do I deal with a file that has been edited by many people?

## Can I use DEP5 to declare licensing and copyright?

See next question.

## Can I bulk-license whole directories?

DEP5

## Can I license only a part of a file as being under a different license?

## How to deal with MIT/BSD licenses which include copyright information themselves?

Since files are different, use multiple of them if they are different 
and from different copyright holders

## Should I move my existing LICENSE or COPYING file?

## Should I put comment headers in my license files?

## I only have a single license file. Should I still create a LICENSES directory?

Maybe

## Should I edit my license files?

NOOOOOOOOOOOOOO

## Can I remove the license and copyright information from minified code (e.g., JavaScript)?

Probably shouldn't

(but REUSE only applies to source repositories)

# For lawyers and legal experts

## I am a lawyer and want a bill of materials

Install the reuse tool and run `reuse spdx -o reuse.spdx` in the project root
to create an [SPDX
document](https://spdx.org/spdx-specification-21-web-version).
