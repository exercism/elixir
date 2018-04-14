FROM elixir:1.6.4-alpine

# Download and install Exercism CLI
RUN set -ex; \
    oldwd=$(pwd); \
    mkdir -p /tmp/exercism-install; \
    cd /tmp/exercism-install; \
    wget https://github.com/exercism/cli/releases/download/v2.4.1/exercism-linux-64bit.tgz; \
    tar -xzvf exercism-linux-64bit.tgz; \
    mv exercism /usr/local/bin/exercism; \
    cd $oldwd; \
    rm -rfv /tmp/exercism-install; \
    exercism fetch elixir; \
    export PATH=/usr/local/bin:$PATH; \
    echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bashrc

# Create working directory
WORKDIR /root/exercism/elixir
VOLUME /root/exercism/elixir

CMD ["sh"]
