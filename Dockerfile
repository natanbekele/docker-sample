ARG JL_BASE_VERSION=stable-22.04
ARG REGISTRY=scidockreg.esac.esa.int:62510
FROM ${REGISTRY}/datalabs/datalabs_base:${JL_BASE_VERSION}

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 10000 8000
WORKDIR /opt

RUN apt-get update \
  && apt-get install -y --no-install-recommends python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir aiohttp==3.7.4

COPY src/. ./
RUN chmod +x ./main.sh
CMD ["./main.sh"]
