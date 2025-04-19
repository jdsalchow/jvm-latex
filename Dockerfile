FROM eclipse-temurin:24-jre
USER root
RUN apt update && \
    apt install -y libpod2-base-perl && \
    mkdir /root/tmp && export TMPDIR=/root/tmp && cd /root/tmp && \
    wget -q "https://yihui.org/tinytex/install-bin-unix.sh" && chmod +x install-bin-unix.sh && \
    TINYTEX_DIR=/opt ./install-bin-unix.sh && \
    /root/bin/tlmgr install soul xtab pgf fancyhdr babel-german koma-script datetime marvosym fmtcount bookmark courier && \
    ln -s /opt/.TinyTeX/bin/*/* /usr/local/bin/ && \
    rm -rf /var/lib/apt/lists/* && \
    apt remove --purge --allow-remove-essential -y libgdbm-compat4t64 libgdbm6t64 libperl5.38t64 netbase perl perl-base && \
    rm -r /root/tmp
