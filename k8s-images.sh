################################################################################
#  File Name: k8s-images.sh
#     Author: Yang Jining
#       Mail: kevinyjn@gmail.com
# Created on: Thu Aug  8 18:29:30 2019
################################################################################
#!/bin/bash
K8S_VERSION=v1.18.5
ETCD_VERSION=3.4.3-0
COREDNS_VERSION=1.6.7
DASHBOARD_VERSION=v1.8.3
FLANNEL_VERSION=v0.10.0-amd64
DNS_VERSION=1.14.8
PAUSE_VERSION=3.1
images=(coredns:${COREDNS_VERSION}
etcd-amd64:${ETCD_VERSION} etcd:${ETCD_VERSION}
pause:${PAUSE_VERSION}
kube-apiserver-amd64:${K8S_VERSION} kube-apiserver:${K8S_VERSION}
kube-controller-manager-amd64:${K8S_VERSION} kube-controller-manager:${K8S_VERSION}
kube-proxy-amd64:${K8S_VERSION} kube-proxy:${K8S_VERSION}
kube-scheduler-amd64:${K8S_VERSION} kube-scheduler:${K8S_VERSION})

for i in ${images[@]}
do
    # echo $i
    docker pull registry.cn-beijing.aliyuncs.com/k8s_pool/$i
    docker tag registry.cn-beijing.aliyuncs.com/k8s_pool/$i k8s.gcr.io/$i
    docker rmi registry.cn-beijing.aliyuncs.com/k8s_pool/$i
done
