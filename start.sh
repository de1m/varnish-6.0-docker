#!/bin/bash

/usr/local/bin/s3cmd get --no-check-certificate s3://$AWS_S3_VARNISH_PATH /tmp/varnish.tar --access_key=$AWS_S3_ACCESS_ID --secret_key=$AWS_S3_ACCESS_KEY --no-check-certificate
mkdir /data
tar xf /tmp/varnish.tar -C /data

$RUN_COMMAND
