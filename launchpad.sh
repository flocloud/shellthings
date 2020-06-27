#!/bin/bash

option=$1


case ${option} in
    --layout)
        defaults write com.apple.dock springboard-rows -int $2
        defaults write com.apple.dock springboard-columns -int $3
        killall Dock
        ;;
    -h | --help)
        echo "Usage:"
        echo "--layout <rows> <colums>      Change the layout of Launchpad with the number of rows and columns"
        ;;
    *)
        echo "Error: Invalid option: ${option}" >&2
        echo "Options available: '--layout' '--help'" >&2
        exit 1
        ;;
esac
