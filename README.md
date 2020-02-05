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

## sync_icloud.sh

Synchronize files between iCloud and local file systems.

Usage:

* Put files or dictories into iCloud:

    ```sh
    ./sync_icloud.sh --put <file> [<file2> <file3> ...]
    ```

* Get files or dictories from iCloud to current working directory:

    ```sh
    ./sync_icloud.sh --get <file> [<file2> <file3> ...]
    ```
