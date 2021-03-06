FROM alpine
RUN apk add git openssl curl tar gzip bash ca-certificates coreutils openssh-client 
RUN apk add ansible terraform aws-cli py3-pip
RUN ansible-galaxy collection install community.general
# install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
RUN bash -c 'if [[ $(echo $(echo "$(<kubectl.sha256) kubectl")|sha256sum --check) == *"OK"*  ]]; \
            	then \
                	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && rm kubectl kubectl.sha256; \
					echo "kubectl installed!"; \
            	else \
                	echo "Error! CheckSum not match!"; \
            fi'

# install eksctl
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /usr/local/bin
#install aws-iam-authenticator
RUN curl --silent -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator && chmod +x /usr/local/bin/aws-iam-authenticator
#install jq
RUN curl --silent -o /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux && chmod +x /usr/local/bin/jq
WORKDIR /root/
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh
ENTRYPOINT ["/bin/docker-entrypoint.sh"]
CMD ["/bin/bash"]
