# Server_config
404服务器配置记录

### 网络环境
若服务器没有外网，要换ZJU源，可以使用`network_config.sh`脚本，完成换源以及`zjunet`的安装，`zjunet`是用于拨校内VPN的包，由求是潮开发。

### Cuda环境
不建议通过cuda自带的包安装NVIDIA驱动，可以考虑使用以下命令安装NVIDIA驱动：

`$ sudo ubuntu-drivers devices`

`$sudo ubuntu-drivers autoinstall`

而后可以用`cuda_install.sh`脚本进行cuda驱动安装，具体可自行阅读脚本后更改。

### ZJUNET自启动
`zjunet_autostart.sh`脚本是用于配置zjunet自启动的，在配置好了网络以后可以用该脚本对18.04以后的版本进行自启动配置。
