#!/bin/bash
nfs_mounts=($(findmnt -lo source -n -t nfs4))
len="${#nfs_mounts[@]}"
i=0
echo "{"
echo "\"data\":["
for nfs_mount in ${nfs_mounts[@]}; do
    let i++
    echo -e '{'
    echo -e '\t' "\"{#MOUNT_POINT}\":\"$nfs_mount\""
    if (( $i < $len )); then
        echo -e '},'
    else
        echo -e '}'
    fi

done
echo "]"
echo "}"