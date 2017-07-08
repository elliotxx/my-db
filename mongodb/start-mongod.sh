#!/bin/bash
nohup bin/mongod -f conf/mongod.conf > /dev/null 2>&1 &
