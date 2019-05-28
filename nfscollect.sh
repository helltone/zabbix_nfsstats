#!/usr/bin/env bash

SECONDS=$2
TOFILE=$1

# be portable regarding number format
LC_ALL=C ; export LC_ALL

[[ $# -lt 2 ]] && { echo "FATAL: some parameters not specified"; exit 1; }

SHARE=$( nfsiostat-sysstat 1 $2 |grep -v Linux |grep -v Filesystem |grep -v -e "^$" )
echo "$SHARE" > "$TOFILE"