#!/bin/bash

set -e

option=$1
cur_shell=$(basename $SHELL)

if [ "${cur_shell}" = "zsh" ]; then
    rc_file="${HOME}/.zshrc"
elif [ "${cur_shell}" = "bash" ]; then
    rc_file="${HOME}/.bash_profile"
else
    rc_file=""
fi


set_repositories() {
    cd "$(brew --repo)"
    git remote set-url origin https://mirrors.ustc.edu.cn/brew.git

    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

    if cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask" 2> /dev/null; then
        git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
    fi

    if [ "${rc_file}" = "" ]; then
        echo "Warning: bottle mirror is not set. Add 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' to your rc file manually, then execute command 'source <rc_file>'"
    else
        sed -i '' '/export HOMEBREW_BOTTLE_DOMAIN=/d' ${rc_file}
        echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles" >> ${rc_file}
        ${cur_shell} -c "source ${rc_file}"
    fi
}

reset_repositories() {
    cd "$(brew --repo)"
    git remote set-url origin https://github.com/Homebrew/brew.git

    cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
    git remote set-url origin https://github.com/Homebrew/homebrew-core.git

    if cd "$(brew --repo)/Library/Taps/homebrew/homebrew-cask" 2> /dev/null; then
        git remote set-url origin https://github.com/Homebrew/homebrew-cask.git
    fi

    if [ "${rc_file}" != "" ]; then
        sed -i '' '/export HOMEBREW_BOTTLE_DOMAIN=/d' ${rc_file}
        ${cur_shell} -c "source ${rc_file}"
    fi
}

case ${option} in
    -s | --set)
        echo "Set the repositories with ustc's mirrors"
        set_repositories
        ;;
    -r | --reset)
        echo "Reset to the original reposities"
        reset_repositories
        ;;
    -h | --help)
        echo "Usage:"
        echo "-s | --set       Set the repositories with ustc's mirrors"
        echo "-r | --reset     Reset to the default repositories"
        ;;
    *)
        echo "Error: Invalid option: ${option}" >&2
        echo "Options available: '--set' '--reset' '--help'" >&2
        exit 1
        ;;
esac
