# lcov-sh-action

[![coverage](https://ci.lcov.sh/javanile/lcov-sh-action/master/badge.svg)](https://ci.lcov.sh/javanile/lcov-sh-action/master)

A GitHub Action to push code coverage report to <https://ci.lcov.sh>.

This action is useful to share with your team every code coverage results after for better review.

Usage:

```
- uses: javanile/ci-lcov-sh-action@master
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
