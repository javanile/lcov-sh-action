FROM alpine:3.9

LABEL "com.github.actions.name"="Push coverage data to ci.lcov.sh."
LABEL "com.github.actions.description"="A GitHub Action to push your coverage report online to ci.lcov.sh"
LABEL "com.github.actions.icon"="arrow-up"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="https://github.com/javanile/ci-lcov-sh-action"
LABEL "homepage"="https://github.com/javanile/ci-lcov-sh-action"
LABEL "maintainer"="francescobianco"
LABEL "release"="9"

RUN apk --no-cache add openssl git curl openssh-client bash
    
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
