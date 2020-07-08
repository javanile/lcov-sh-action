# lcov-sh-action

[![coverage](http://ci.lcov.sh/javanile/lcov-sh-action/master/badge.svg)](http://ci.lcov.sh/javanile/lcov-sh-action/master)

A GitHub Action to push code coverage report to <https://ci.lcov.sh>.

This action is useful to share with our team all code coverage results after every review.

Usage:

```
- uses: javanile/ci-lcov-sh-action@master
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
