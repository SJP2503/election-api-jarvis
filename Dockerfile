FROM r-base:4.3.1

RUN apt-get update && \
    apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libsodium-dev && \
    Rscript -e "install.packages(c('sodium', 'plumber', 'jsonlite'), repos='https://cloud.r-project.org')"

COPY . /app
WORKDIR /app

EXPOSE 8000

CMD ["Rscript", "entrypoint.R"]
