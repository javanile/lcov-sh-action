#!/usr/bin/env bash







curl -X "PUT" \
     -H "Authorization: token " \
     -d "{\"branch\": \"gh-pages\", \"message\": \"uploading a sample pdf\", \"content\": \"$(cat package.json | base64 -w 0)\"}" \
     -i "https://api.github.com/repos/javanile/ci.lcov.sh/contents/dir/sample.pdf"

