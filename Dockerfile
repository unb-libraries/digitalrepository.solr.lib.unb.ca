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
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="digitalrepository.solr.lib.unb.ca is the solr application serving digitalrepository instances at UNB Libraries." \
  org.label-schema.name="digitalrepository.solr.lib.unb.ca" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/unb-libraries/digitalrepository.solr.lib.unb.ca" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.authors="libsupport@unb.ca" \
  org.opencontainers.image.source="https://github.com/unb-libraries/digitalrepository.solr.lib.unb.ca"