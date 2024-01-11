# syntax=docker/dockerfile:1
ARG ALPINE_IMAGE
FROM alpine:latest

# Copy kubectl-testkube binary
COPY kubectl-testkube /bin/kubectl-testkube

# Create symbolic links for 'testkube' and 'tk' as aliases for 'kubectl-testkube'
RUN ln -s /bin/kubectl-testkube /bin/testkube
RUN ln -s /bin/kubectl-testkube /bin/tk

# Create and set permissions for /.testkube directory
RUN mkdir /.testkube && echo "{}" > /.testkube/config.json && chmod -R 755 /.testkube && chown -R 1001:1001 /.testkube && chmod 660 /.testkube/config.json

# # Create /project directory and set ownership
# RUN mkdir -p /project && chown -R 1001:1001 /project

# Specify the user to use when running the image
USER 1001

# Set the entrypoint to the kubectl-testkube binary
ENTRYPOINT ["/bin/kubectl-testkube"]
