# Pull base image.
FROM ubuntu:18.04

# Set default WORKDIR in container
WORKDIR /usr/src/app

# Update the repository
COPY . .

# For log message in container
ENV PYTHONUNBUFFERED 1

# Install python 3.7
RUN apt-get update -y && \
    apt-get install -y python3.7 python3-pip python3.7-dev

# Install package requirements
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# EXPOSE 8100 port
EXPOSE 8100

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
