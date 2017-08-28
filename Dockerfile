FROM publysher/hugo

CMD hugo server --appendPort=false -b ${HUGO_BASE_URL} --bind=0.0.0.0
