# BASE OFF MY GADGET CHIP IO CHIPTAINER
FROM xtacocorex/gadget-chip-io

# INSTALL THE THINGS
RUN apk update && \
    # CLAPTTO SPECIFIC PACKAGES
    apk add gd && \
    apk add gd-dev && \
    apk add linux-headers && \
    apk add gifsicle && \
    apk add imagemagick && \
    # VU METER STUFF REQUIRED FOR CLAPTTO
    apk add git && \
    apk add gcc && \
    apk add g++ && \
    apk add gzip && \
    apk add make && \
    apk add alsa-lib-dev && \
    apk add py2-pip && \
    pip install --upgrade pip && \
    pip install pyalsaaudio && \
    # FSWEBCAM INSTALL
    git clone https://github.com/fsphil/fswebcam.git && \
    cd fswebcam && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd ../ && rm -rf fswebcam && \
    # CLAPTTO INSTALL
    git clone https://github.com/xtacocorex/claptto.git && \
    cd claptto && \
    cp claptto.py / && \
    cd ../ && rm -rf claptto && \
    # Remove unneeded packages once build is complete.
    apk del git && \
    apk del gcc && \
    apk del g++ && \
    apk del make && \
    apk del py2-pip && \
    apk del linux-headers && \
    apk del gd-dev && \
    apk del gzip

# THE ENTRY POINT
ENTRYPOINT echo "CLAPTTO IS STARTING" && \
    python claptto.py

