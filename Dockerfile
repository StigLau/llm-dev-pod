# Corretto 21 base (Debian slim) chosen for Java development. Choose your own poison
FROM amazoncorretto:21-alpine-jdk

# Set non-interactive mode
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies:
RUN apk add --no-cache \
    bash \
    curl \
    wget \
    unzip \
    git \
    python3 \
    py3-pip \
    maven \
    ca-certificates \
    gnupg \
    fish \
    github-cli \
    aws-cli \
    make

# Create non-root user for security
RUN adduser -D -s /bin/bash -h /home/developer developer \
    && mkdir -p /home/developer/.claude \
    && chown -R developer:developer /home/developer

# Install Bun (JS/TS runtime) as root, then move to system location
RUN curl -fsSL https://bun.sh/install | bash \
    && mv /root/.bun /usr/local/bun \
    && ln -s /usr/local/bun/bin/bun /usr/local/bin/bun \
    && chmod 755 /usr/local/bun/bin/bun

RUN apk add --no-cache nodejs npm
# Install Claude Code CLI globally via npm
RUN npm install -g @anthropic-ai/claude-code
RUN claude --version

# Environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto
ENV PATH="$JAVA_HOME/bin:/usr/local/bun/bin:/usr/local/claude/bin:$PATH"

# Add health check and keep-alive settings
ENV CLAUDE_KEEP_ALIVE=1
ENV TERM=xterm-256color

EXPOSE 8080
EXPOSE 3000

# Copy GitHub CLI token management scripts
# This allows saving/restoring GH tokens across container restarts
COPY scripts/save-gh-token.sh scripts/restore-gh-token.sh scripts/startup-with-gh-token.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/save-gh-token.sh /usr/local/bin/restore-gh-token.sh /usr/local/bin/startup-with-gh-token.sh

# Switch to non-root user inside container
USER developer

# Default working directory
WORKDIR /workspace

# Use startup script as entrypoint
ENTRYPOINT ["/usr/local/bin/startup-with-gh-token.sh"]

# Default shell
CMD ["/bin/bash"]

