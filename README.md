# Description
This a docker image with ubuntu 16 and varnish 6.0, also it was installed the [varnish modules](https://github.com/varnish/varnish-modules)(+ [libvmod-digest](https://github.com/varnish/libvmod-digest) and [libvmod_re](https://code.uplex.de/uplex-varnish/libvmod-re/))

## Run steps
1. Container start
2. Download from AWS S3 the files for varnish
3. Start varnish

# Variables

**AWS_S3_ACCESS_ID** - ID of user  
**AWS_S3_ACCESS_KEY** - Secret key of user  
**AWS_S3_VARNISH_PATH** - path to varnish folder (in Tar format)  in S3
- example: $AWS_S3_VARNISH_PATH=id-varnish-files/varnish.tar

**VARNISH_START_VCL_PATH**

# Start
sudo docker run --name varnish -p 80:80 \
-e "AWS_S3_ACCESS_ID=ID" \
-e "AWS_S3_ACCESS_KEY=KEY" \
-e "AWS_S3_VARNISH_PATH=bucket-s3-with-varnish-tar/varnish.tar" \
-e "VCL_CONFIG=/data/varnish-example.vcl" \
-e "RUN_COMMMAND=-f $VCL_CONFIG -p ban_lurker_sleep=0.1 -p thread_pools=2 -p thread_pool_min=100 -p thread_pool_max=2500 -p listen_depth=2048 -p default_grace=3600 -p vmod_dir=/usr/lib/varnish/vmods -p vcl_dir=/data -p feature=+esi_ignore_other_elements -s malloc,5G" \
-t de1m/varnish
