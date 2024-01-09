# syntax=docker/dockerfile:1
ARG ALPINE_IMAGE
FROM ${ALPINE_IMAGE}
COPY kubectl-testkube /bin/kubectl-testkube
RUN mkdir /.testkube && echo "{}" > /.testkube/config.json && chmod -R 755 /.testkube
RUN mkdir -p /home/testkube && chown -R 1001:1001 /home/testkube
USER 1001
ENTRYPOINT ["/bin/kubectl-testkube"]
