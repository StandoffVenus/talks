ARG NIXPKGS_VERSION=24.11
FROM nixpkgs/nix:nixos-${NIXPKGS_VERSION}

# Create a non-root user
ARG USERNAME="demo"
ARG USER_ID=1001
ARG GROUP_ID=1001
ARG USER_HOME="/home/${USERNAME}"
ARG USER_SHELL="/bin/bash"

# Set up requirements for a new user
RUN echo "${USERNAME}:x:${GROUP_ID}:" >> /etc/group
RUN echo "${USERNAME}:x:${USER_ID}:${GROUP_ID}::${USER_HOME}:${USER_SHELL}" >> /etc/passwd
RUN mkdir -p "${USER_HOME}"
RUN chown "${USER_ID}:${GROUP_ID}" "${USER_HOME}"

# Nix configuration
RUN mkdir -p "/nix/var/nix/profiles/per-user/${USERNAME}"
RUN chown -R "${USER_ID}:${GROUP_ID}" "/nix" # This is pretty insecure but w/e
RUN mkdir -p "${USER_HOME}/.config/nix"
RUN echo "experimental-features = nix-command flakes" >> "${USER_HOME}/.config/nix/nix.conf"

ENV SHELL="${USER_SHELL}"
ENV PATH="/nix/store/*/bin:${PATH}"
USER "${USERNAME}"

WORKDIR /src/demo
ENTRYPOINT [ "/bin/sh", "-c" ] # Run whatever command is provided
CMD        [ "exec ${SHELL}" ] # By default, run the user's shell
