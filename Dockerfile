FROM alpine:latest

# Upgrade and install packages
RUN \
  apk update --no-cache && \ 
  apk upgrade && \
  apk add \
    curl \
    git \
    util-linux \
    util-linux-misc \
    wget \
    bash \
    shadow \    
    terraform \
    sudo && \
  mkdir terraform 

# Initialise Terraform
COPY \
   ./terraform_configs/ ./terraform/
RUN \
  terraform -chdir=/terraform init

# Add command aliases
RUN \
  touch $HOME/.bashrc && chmod 755 $HOME/.bashrc && \
  echo "alias l='ls -larth'" >> $HOME/.bashrc && \
  echo "alias c='clear'" >> $HOME/.bashrc && \
  echo "alias up='apk update && apk upgrade'" >> $HOME/.bashrc && \
  echo "alias s='apk search'" >> $HOME/.bashrc && \
  echo "alias in='apk add'" >> $HOME/.bashrc

HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=2 \
  CMD /bin/bash -c 'terraform -version || exit 1' 

ENTRYPOINT ["/bin/bash"]
