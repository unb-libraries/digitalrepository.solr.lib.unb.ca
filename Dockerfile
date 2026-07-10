FROM solr:8.11

ENV TZ="America/Moncton"
ENV SOLR_LOG_LEVEL="warn"

USER root
COPY ./build/ /build/
RUN /build/scripts/container/setSolrLogLevels.sh ${SOLR_LOG_LEVEL} \
  && mv /build/conf /opt/solr/server/solr/configsets/digitalrepository
USER $SOLR_UID

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="solr" \
  org.opencontainers.image.title="digitalrepository.solr.lib.unb.ca" \
  org.opencontainers.image.description="digitalrepository.solr.lib.unb.ca is the solr application serving digitalrepository instances at UNB Libraries." \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.authors="libsupport@unb.ca" \
  org.opencontainers.image.source="https://github.com/unb-libraries/digitalrepository.solr.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"