FROM debian:stretch-slim

RUN set -eux && \
    apt-get update && \
    apt-get install -yq openssl python3 git make &&\
    apt-get clean && apt-get autoremove -y && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src
RUN git clone https://github.com/michaelklishin/tls-gen tls-gen

# Defaults
ENV GEN_TYPE basic
ENV CA_CERTIFICATE ca_certificate.pem
ENV CA_KEY ca_key.pem
ENV CLIENT_CERTIFICATE client_certificate.pem
ENV CLIENT_KEY_PEM client_key.pem
ENV CLIENT_KEY_P12 client_key.p12
ENV SERVER_CERTIFICATE server_certificate.pem
ENV SERVER_KEY_PEM server_key.pem
ENV SERVER_KEY_P12 server_key.p12
#ENV GEN_TYPE separate_intermediates
ENV CHAINED_CLIENT_CA_CERTIFICATE chained_client_ca_certificate.pem
ENV CHAINED_SERVER_CA_CERTIFICATE chained_server_ca_certificate.pem
#ENV GEN_TYPE separate_intermediates
ENV CHAINED_CA_CERTIFICATE chained_ca_certificate.pem

ENV REGEN true
ENV OUTPUTDIR /opt/output

#RUN mkdir -p OUTPUTDIR

COPY docker-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]