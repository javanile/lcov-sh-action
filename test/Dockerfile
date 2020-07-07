FROM javanile/lcov-sh-action

#RUN echo http://nl.alpinelinux.org/alpine/edge/main >> /etc/apk/repositories
#RUN echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories
RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk add --update --no-cache lcov

RUN which getopt

RUN curl -fsSL https://git.io/lcov.sh -o /usr/local/bin/lcov.sh && chmod +x /usr/local/bin/lcov.sh

COPY entrypoint.test.sh /test/entrypoint.test.sh

ENTRYPOINT []
