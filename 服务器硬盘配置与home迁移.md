# 服务器硬盘配置与home迁移
## 找到硬盘
`$ sudo fdisk -l | grep sd `

```
Disk /dev/sdb: 10.9 TiB, 11999064883200 bytes, 23435673600 sectors
Disk /dev/sda: 931 GiB, 999653638144 bytes, 1952448512 sectors
/dev/sda1  *     2048 1952446463 1952444416  931G 83 Linux
```
## 对HDD进行操作
具体情况具体分析，不一定每个都是sdb，找到大的硬盘即可

`$ sudo fdisk /dev/sdb `

首先要转GPT，输入`g`添加gpt label，然后输入`n`创建新分区，全部默认即可，最后输入`p`看分区表

```
Command (m for help): p
Disk /dev/sdb: 10.9 TiB, 11999064883200 bytes, 23435673600 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 1249BB36-D757-2D40-A890-1FB94F0644F9

Device     Start         End     Sectors  Size Type
/dev/sdb1   2048 23435673566 23435671519 10.9T Linux filesystem
```

输入`w`保存分区并退出

## 格式化硬盘
`$ sudo mkfs.ext4 /dev/sdb1`

## 同步home
先进root

`$ sudo su`

回到根目录，方便删库

`$ cd ~`

**接下来的操作都要小心！！**

1. 挂载新硬盘

    `$ mkdir /mnt/tmp`

    `$ mount /dev/sdb1 /mnt/tmp`

2. 同步home到新硬盘

    `$ rsync -avx /home/ /mnt/tmp`

3. 删库跑路(清除现有的home)

    `$ rm -rf /home/*`
    
    `$ umount -l /home` 
4. 重新挂载home到新硬盘
    `$ mount /dev/sdb1 /home`

5. 获取硬盘启动信息
    `$ blkid`
    ```
    /dev/loop0: TYPE="squashfs"
    ...
    /dev/loop7: TYPE="squashfs"
    /dev/sdb1: UUID="f19415e3-b615-468f-972f-36968669efb5" TYPE="ext4" PARTUUID="6b17d23a-7976-d042-b4bc-4b6ac5c63215"
    /dev/sda1: UUID="99a1b45d-210b-4e33-8897-9e9a9a6c95c1" TYPE="ext4" PARTUUID="803e9e07-01"
    ```
    记下sdb1的UUID
6. 编辑`/etc/fstab`
    最后一行添加，UUID用之前输出的替换
    ```
    UUID=f19415e3-b615-468f-972f-36968669efb5 /home           ext4    defaults      0       2
    ```
7. `$ df -h`
看到/home成功挂载到新硬盘就ok
```
/dev/sdb1        11T  5.3G   11T   1% /home
```

## 退出账户重新登录
先exit退出su，再exit退出当前账户，再重登，不然会使用缓存的home路径
