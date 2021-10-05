FROM ubuntu:20.04
LABEL maintainer="John Gruber <j.gruber@f5.com>"

WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y python3-pip \
    python3-setuptools \
    python3-wheel \
    git

## INJECT_PATCH_INSTRUCTION ##
RUN git clone https://github.com/jgruberf5/ibmcloud_volterra_ce_uploader && \
    pip3 install -r /ibmcloud_volterra_ce_uploader/requirements.txt

VOLUME ["/CEImages"]

ENV CE_IMAGE_DIR '/CEImages'
ENV COS_BUCKET_PREFIX 'volterra-ce'

ENTRYPOINT [ "/ibmcloud_volterra_ce_uploader/ibmcloud_cos_image_uploader.py" ]

