# Use an Ubuntu x86_64 base image (64-bit)
FROM ubuntu:20.04

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install essential tools
RUN apt-get update && apt-get install -y \
    gcc \
    nasm \
    make \
    build-essential \
    gdb \
    vim \
    && apt-get clean

# Set the working directory inside the container
WORKDIR /workspace

# Default command is to start a shell
CMD ["/bin/bash"]
