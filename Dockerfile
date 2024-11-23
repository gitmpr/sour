FROM ubuntu:22.04
# FROM alpine..
# bullseye-slim and bookwork-slim give glibc version compatibility errors

ENV APP_DIR=/app
ENV ASSETS_DIR=/app/assets

# Create app directory in the container
WORKDIR ${APP_DIR}

# COPY ./sour .
COPY ./sour /app/

# COPY ./sour ./assets/
# COPY ./assets ${ASSETS_DIR}
COPY ./assets /app/assets/

# 1337 (tcp) for https web application and 28785/udp for native sauerbraten
EXPOSE 1337
EXPOSE 28785/udp

CMD ["./sour"]

## To run this:
#  docker build -t sourtest:ubuntu22.04 .
#  docker run --name sourtest -p 1337:1337 -p 28785:28785/udp sourtest:ubuntu22.04
