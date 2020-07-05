#!/bin/sh

# check values
if [ -z "${GITHUB_TOKEN}" ]; then
    echo "error: not found GITHUB_TOKEN"
    exit 1
fi

# initialize git
git config http.sslVerify false
git config user.name "Automated Publisher"
git config user.email "actions@users.noreply.github.com"

remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/javanile/ci.lcov.sh.git"
tmp=$(mktemp -d -t ci-lcov-sh-XXXXXXXXXX)

mkdir -p ${tmp}/${GITHUB_REPOSITORY}
mv coverage ${tmp}/${GITHUB_REPOSITORY}

cd ${tmp}
git init
git add ${GITHUB_REPOSITORY}/coverage
git commit -m "Your message about the commit"
git remote add origin "${remote_repo}"
git push -u origin gh-pages
git push origin gh-pages
