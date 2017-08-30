FROM publysher/hugo

RUN ./generate.sh
RUN apt-get update && apt-get install pandoc
RUN pandoc -s page-pdf.md -o site/static/reuse.pdf

CMD hugo server --appendPort=false -b ${HUGO_BASE_URL} --bind=0.0.0.0
