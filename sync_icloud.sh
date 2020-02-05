#!/bin/bash

option=$1
shift
dst=$@
icloud=${HOME}/Library/Mobile\ Documents/com\~apple\~CloudDocs


case ${option} in
    --get)
        for file in ${dst}; do
            cp -rf "${icloud}/${file}" .
        done
        ;;
    --put)
        cp -rf ${dst} "${icloud}"
        ;;
    -h | --help)
        echo "Usage:"
        echo "--get <file> [<file2> <file3> ...]    Get files or dictories from iCloud to current working directory"
        echo "--put <file> [<file2> <file3> ...]    Put files or dictories into iCloud"
        ;;
    *)
        echo "Error: Invalid option: ${option}" >&2
        echo "Options available: '--get' '--put' '--help'" >&2
        exit 1
        ;;
esac
