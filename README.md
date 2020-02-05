# shellthings

## brew_repo_mirror.sh

Set Homebrew repositories with ustc's mirrors, so that *brew* can obtain software packages on a stable network connection. It may be useful for Chinese people.

Usage:

```sh
./brew_repo_mirror.sh --set
```

If you want to set Homebrew repositories back to original settings, use:

```sh
./brew_repo_mirror.sh --reset
```

> Note that it only supports bash and zsh well.

