#!/bin/bash
set -e
source ../base_utils.sh
HBASE_VER=1.2.6
download_link https://archive.apache.org/dist/hbase/$HBASE_VER/hbase-$HBASE_VER-bin.tar.gz
