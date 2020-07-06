#!/bin/sh

if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

if [ ! -d "coverage" ]; then
    echo "error: coverage data not found"
    exit 1
fi

find coverage -type f | while IFS= read -r file; do
   curl -X "PUT" \
        -H "Authorization: token " \
        -d "{\"branch\": \"gh-pages\", \"message\": \"uploading a sample pdf\", \"content\": \"$(cat ${file} | base64 -w 0)\"}" \
        -i "https://api.github.com/repos/javanile/ci.lcov.sh/contents/${GITHUB_TOKEN}/${GITHUB_REF}/$file"
done
