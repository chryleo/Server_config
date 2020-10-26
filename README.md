# Server_config
404服务器配置记录

### 网络环境
若服务器没有外网，要换ZJU源，可以使用`network_config.sh`脚本，完成换源以及zjunet的安装，zjunet是用于拨校内VPN的包，由求是潮开发。

### Cuda环境
不建议通过cuda自带的包安装ubuntu驱动，可以考虑使用
`$ sudo ubuntu-drivers devices
$sudo ubuntu-drivers autoinstall
`
