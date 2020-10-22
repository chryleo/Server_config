sudo sh -c "echo 'blacklist nouveau
options nouveau modeset=0' > /etc/modprobe.d/blacklist-nouveau.conf"
sudo update-initramfs -u
# download cuda runfile
scp dcd@10.12.86.102:~/cuda_10.2.89_440.33.01_linux.run && bash cuda_10.2.89_440.33.01_linux.run
