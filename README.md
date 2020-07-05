# `ci-lcov-sh-action`

A GitHub Action to push any local file changes, including new files, back to master.

This action is useful to put *after* other actions that modify files in the local checkout
that you'd then like to persist back into the repository.

Usage:

```
- uses: javanile/ci-lcov-sh-action@master
  env:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

