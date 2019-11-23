FROM nvcr.io/nvidia/l4t-base:r32.2.1
COPY qemu-aarch64-static /usr/bin

RUN wget https://dl.google.com/go/go1.13.4.linux-arm64.tar.gz
RUN tar -C /usr/local -xzf go1.13.4.linux-arm64.tar.gz
RUN export PATH=$PATH:/usr/local/go/bin
ENV GOPATH /usr/local/go
ENV CGO_ENABLED 0
ENV GO111MODULE on
ENV GOPROXY https://proxy.golang.org

RUN  \
     apt update && \
     apt install git -yq && \
     git clone https://github.com/minio/minio

RUN  cd minio && /usr/local/go/bin/go install -v -ldflags "$(/usr/local/go/bin/go run buildscripts/gen-ldflags.go)"

FROM nvcr.io/nvidia/l4t-base:r32.2.1
COPY qemu-aarch64-static /usr/bin
ENV MINIO_UPDATE off
ENV MINIO_ACCESS_KEY_FILE=access_key \
    MINIO_SECRET_KEY_FILE=secret_key \
    MINIO_KMS_MASTER_KEY_FILE=kms_master_key

EXPOSE 9000

COPY --from=0 /usr/local/go/bin/minio /usr/bin/minio
COPY docker-entrypoint.sh /usr/bin/

RUN  apt update && apt install ca-certificates curl -yq

RUN  echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

RUN rm /usr/bin/qemu-aarch64-static
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
VOLUME ["/data"]
CMD ["minio"]
