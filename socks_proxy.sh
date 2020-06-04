#!/bin/bash

option=$1
network=$2
host=$3
port=$4


case ${option} in
    --on)
        networksetup -setsocksfirewallproxy "${network}" "${host}" "${port}" 
        ;;
    --off)
        networksetup -setsocksfirewallproxystate "${network}" off
        ;;
    -h | --help)
        echo "Usage:"
        echo "--on <network> [<host> <port>]    Turn on socks proxy with specified proxy arguments"
        echo "--off <network>                   Turn off socks proxy"
        ;;
    *)
        echo "Error: Invalid option: ${option}" >&2
        echo "Options available: '--on' '--off' '--help'" >&2
        exit 1
        ;;
esac
