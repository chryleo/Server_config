sudo sh -c "echo '[Install]  
WantedBy=multi-user.target  
Alias=rc-local.service' >> /lib/systemd/system/rc.local.service"
sudo sh -c "echo '#!/bin/sh
zjunet vpn connect -c
exit 0' > /etc/rc.local"
sudo chmod +x /etc/rc.local
sudo ln -s /lib/systemd/system/rc.local.service /etc/systemd/system/
