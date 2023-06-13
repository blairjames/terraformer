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

# Copy terraform files to container
COPY \
   ./terraform_configs/ ./terraform/

# Create non-privileged user, permit terraform commands
RUN \  
  echo $(head -n1 /etc/passwd) > /etc/passwd && \
  echo $(head -n1 /etc/shadow) > /etc/shadow && \
  adduser terra;echo 'terra:terra' | chpasswd && \
  echo "terra ALL=(ALL) NOPASSWD:/usr/bin/terraform" > /etc/sudoers.d/terra

# Change to non-privileged user 'terra'
USER terra

# Add command aliases and initialise terraform
RUN \
  touch $HOME/.bashrc && chmod 755 $HOME/.bashrc && \
  echo "alias l='ls -larth'" >> $HOME/.bashrc && \
  echo "alias c='clear'" >> $HOME/.bashrc && \
  echo "alias up='apk update && apk upgrade'" >> $HOME/.bashrc && \
  echo "alias s='apk search'" >> $HOME/.bashrc && \
  echo "alias in='apk add'" >> $HOME/.bashrc && \
  echo "alias terraform='sudo terraform -chdir=/terraform'" >> $HOME/.bashrc && \
  echo "alias tf='sudo terraform -chdir=/terraform'" >> $HOME/.bashrc 

HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=2 \
  CMD /bin/bash -c 'terraform -version || exit 1' 

WORKDIR /terraform
ENTRYPOINT ["/bin/bash"]
