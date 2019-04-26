# SPDX-Copyright: 2019 Free Software Foundation Europe e.V.
#
# SPDX-License-Identifier: GPL-3.0-or-later

FROM debian:9

RUN apt-get update && apt-get -y install pandoc texlive-latex-base texlive-fonts-recommended

# copy source files
COPY practices /tmp/practices

# copy and run generation script
ADD generate.sh /tmp

# expand first argument to build more files
# last argument defines output. this is a volume shared with reuse-website
CMD ["/tmp/generate.sh", "1.2.md 2.0.md", "/tmp/practices", "/tmp/pdf"]
