#!/usr/bin/env bash

[[ -z "${LCOV_DEBUG}" ]] || set -x

if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

if [ ! -d "coverage" ]; then
    echo "error: coverage data not found"
    ls
    exit 1
fi

branch=$(basename "${GITHUB_REF}")

upload() {
   echo "Upload: ${file}"
   curl -X "PUT" \
        -H "Authorization: token ${GITHUB_TOKEN}" \
        -d "{\"branch\": \"gh-pages\", \"message\": \"uploading a sample pdf\", \"content\": \"$(cat $1 | base64 | tr -d \\n)\"}" \
        -fsSL "https://api.github.com/repos/javanile/ci.lcov.sh/contents/${GITHUB_REPOSITORY}/${branch}/$1"
}

curl https://img.shields.io/badge/coverage-90%25-green -o badge.svg && upload badge.svg

find coverage -type f | while IFS= read -r file; do
    upload "${file}"
done
