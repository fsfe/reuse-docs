FROM publysher/hugo

COPY generate.sh /
RUN /generate.sh
RUN apt-get update && apt-get -y install pandoc texlive-latex-base
RUN pandoc -s /page-pdf.md -o /usr/share/blog/static/reuse.pdf

CMD hugo server --appendPort=false -b ${HUGO_BASE_URL} --bind=0.0.0.0
