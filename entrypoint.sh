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
   echo "FILE: ${file}"
   curl -X "PUT" \
        -H "Authorization: token ${GITHUB_TOKEN}" \
        -d "{\"branch\": \"gh-pages\", \"message\": \"uploading a sample pdf\", \"content\": \"$(cat ${file} | base64 | tr '\\n' ' ')\"}" \
        -i "https://api.github.com/repos/javanile/ci.lcov.sh/contents/${GITHUB_REPOSITORY}/${GITHUB_REF}/$file"
done
