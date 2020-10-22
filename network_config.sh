#!/bin/bash
sudo sh -c "echo 'deb http://mirrors.zju.edu.cn/ubuntu bionic main universe restricted multiverse
deb http://mirrors.zju.edu.cn/ubuntu bionic-security main universe restricted multiverse
deb http://mirrors.zju.edu.cn/ubuntu bionic-updates main universe restricted multiverse
deb http://mirrors.zju.edu.cn/ubuntu bionic-backports main universe restricted multiverse
deb-src http://mirrors.zju.edu.cn/ubuntu bionic main universe restricted multiverse
deb-src http://mirrors.zju.edu.cn/ubuntu bionic-security main universe restricted multiverse
deb-src http://mirrors.zju.edu.cn/ubuntu bionic-updates main universe restricted multiverse
deb-src http://mirrors.zju.edu.cn/ubuntu bionic-backports main universe restricted multiverse' > /etc/apt/sources.list"

sudo apt update
sudo apt -y upgrade

sudo apt install -y vim curl
curl https://dl.zjuqsc.com/linux/qsc.public.key | sudo apt-key add -
curl https://dl.zjuqsc.com/linux/debian/qsc.list | sudo tee /etc/apt/sources.list.d/qsc.list
sudo apt-get update
sudo apt-get install zjunet -y
