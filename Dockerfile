FROM alpine:3.14
RUN apk add openssl curl tar gzip bash ca-certificates coreutils 
RUN apk add ansible terraform aws-cli
# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN bash -c 'if echo "$(<kubectl.sha256)  kubectl" | sha256sum --check --status; \
            then \
                install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && rm kubectl kubectl.sha256; \ 
            else \
                echo "Error! CheckSum not match!"; \
            fi'
WORKDIR /root/
CMD ["/bin/bash"]