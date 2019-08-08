################################################################################
#  File Name: k8s-images.sh
#     Author: Yang Jining
#       Mail: kevinyjn@gmail.com
# Created on: Thu Aug  8 18:29:30 2019
################################################################################
#!/bin/bash

images=("coredns:1.3.1" "etcd-amd64:3.3.10" "pause:3.1" "kube-apiserver-amd64:v1.15.2" "kube-controller-manager-amd64:v1.15.2" "kube-proxy-amd64:v1.15.2" "kube-scheduler-amd64:v1.15.2")

for i in ${images[@]}
do
    # echo $i
    docker pull registry.cn-beijing.aliyuncs.com/k8s_pool/$i
    docker tag registry.cn-beijing.aliyuncs.com/k8s_pool/$i k8s.gcr.io/$i
done
