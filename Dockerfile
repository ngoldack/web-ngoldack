FROM gohugoio/hugo
COPY . .
CMD ["hugo", "server"]