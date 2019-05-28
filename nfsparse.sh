#!/bin/bash
ZBX_REQ_DATA="$2"
ZBX_REQ_DATA_MOUNT_POINT="$1"
PARSE_FILE=/tmp/nfsstats

# Missing device to get data from
if [ -z "$ZBX_REQ_DATA_MOUNT_POINT" ]; then
  echo $ERROR_MISSING_PARAM
  exit 1
fi


case $ZBX_REQ_DATA in
  rkB_nor/s)     cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT |awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$2;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  wkB_nor/s)     cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$3;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  rkB_dir/s)        cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$4;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  wkB_dir/s)        cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$5;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  rkB_svr/s)      cat $PARSE_FILE | grep -E $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$6;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  wkB_svr/s)      cat $PARSE_FILE | grep -E $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$7;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  ops/s)   cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$8;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  rops/s)   cat $PARSE_FILE | grep $ZBX_REQ_DATA_MOUNT_POINT | tail -1 | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$9;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  wops/s)      cat $PARSE_FILE | grep -E $ZBX_REQ_DATA_MOUNT_POINT | awk 'BEGIN {sum=0.0;count=0;} {sum=sum+$10;count=count+1;} END {printf("%.2f\n", sum/count);}';;
  *) echo $ERROR_WRONG_PARAM; exit 1;;
esac

exit 0