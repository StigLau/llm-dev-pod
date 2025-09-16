# Summary
Simple Podman/Docker environment for developing/performing agentic development.

# Adaptations 
My specific flavour is to support Java development, supported by python and Typescript.
Make your own version for your usage. 
Scripts are targeted to podman (a Docker alternative), but should be easy to adapt to Docker. 

# Building and running
```
make build 
make run
# This should place you inside the docker image.

# As an alternative, this shell script will start the container from "anywhere" and add relevant environment variables from inside your host environment
./start-claude

## Want to go all the way? Inside the container, run:
claude --dangerously-skip-permissions
```

# Security / Risks
NEVER TRUST ANYONE REGARDING CODE YOU DOWNLOAD FROM THE INTERNET. INCLUDING THIS!

Read the code, understand it. 

You can of course get an LLM to help, but it will not always catch the nuances.

Also, this containerization does not necessarily protect your host system. Using Claude Code or running code inside the container can still spill out and cause devestation. 
The point is to have a nicer, simpler abstraction for your development environment.