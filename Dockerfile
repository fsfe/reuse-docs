FROM publysher/hugo

CMD hugo server --append-port=False -b ${HUGO_BASE_URL} --bind=0.0.0.0
