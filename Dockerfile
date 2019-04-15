FROM publysher/hugo

COPY generate.sh /
RUN /generate.sh
RUN apt-get update && apt-get -y install pandoc texlive-latex-base texlive-fonts-recommended
RUN pandoc -s /page-pdf-2.0.md -o /usr/share/blog/static/reuse-2.0.pdf
RUN pandoc -s /page-pdf-1.2.md -o /usr/share/blog/static/reuse-1.2.pdf
