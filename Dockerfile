FROM eclipse-temurin:24-jre
USER root
RUN apt update && \
    apt install -y libpod2-base-perl && \
    mkdir /root/tmp && export TMPDIR=/root/tmp && cd /root/tmp && \
    wget -q "https://yihui.org/tinytex/install-bin-unix.sh" && chmod +x install-bin-unix.sh && \
    TINYTEX_DIR=/opt ./install-bin-unix.sh && \
    /root/bin/tlmgr install soul xtab pgf fancyhdr babel-german koma-script datetime marvosym fmtcount bookmark courier && \
    ln -s /opt/.TinyTeX/bin/*/* /usr/local/bin/ && \
    apt remove --purge -y libgdbm-compat4 libgdbm6 libperl5.34 netbase perl perl-modules-5.34 && \
    rm -r /root/tmp

