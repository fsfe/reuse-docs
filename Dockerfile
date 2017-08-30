FROM publysher/hugo

COPY generate.sh /
RUN /generate.sh
RUN apt-get update && apt-get install pandoc
RUN pandoc -s /page-pdf.md -o /usr/share/blog/static/reuse.pdf

CMD hugo server --appendPort=false -b ${HUGO_BASE_URL} --bind=0.0.0.0
