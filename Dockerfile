FROM debian:9

RUN apt-get update && apt-get -y install pandoc texlive-latex-base texlive-fonts-recommended

# create and change to non-privileged user
RUN useradd -ms /bin/bash docs
USER docs
RUN mkdir /home/docs/pdf

# copy source files
COPY --chown=docs practices /home/docs/practices

# copy and run generation script
COPY generate.sh /home/docs

# expand first argument to build more files
# last argument defines output. this is a volume shared with reuse-website
RUN ["/home/docs/generate.sh", "1.2.md 2.0.md", "/home/docs/practices", "/home/docs/pdf"]

# clean files
RUN rm -rf  /home/docs/generate.sh \
            /home/docs/practices
