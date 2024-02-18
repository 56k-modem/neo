# Use a base image with necessary dependencies
FROM debian:bullseye-slim

# Install required packages
RUN apt-get update && \
    apt-get install -y build-essential libncurses-dev autoconf git man

# Clone the neo repository
RUN git clone https://github.com/st3w/neo.git /neo

# Set working directory
WORKDIR /neo

# Build and install neo
RUN ./autogen.sh && \
    ./configure && \
    make -j3 && \
    make install

# Set bash as default command and prompt user to run neo
CMD ["/bin/bash", "-c", "echo 'Type \"neo\" to run the program' && /bin/bash"]
