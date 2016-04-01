groupadd sftp_users
useradd -G sftp_users -s /sbin/nologin zytz
passwd zytz
或者
usermod –G sftp_users -s /sbin/nologin zytz

vi /etc/ssh/sshd_config
Subsystem sftp internal-sftp
  Match Group sftp_users
  X11Forwarding no
  AllowTcpForwarding no
  ChrootDirectory %h
  ForceCommand internal-sftp


service sshd restart

chmod 755 /home/zytz
chown root /home/zytz
chgrp -R sftp_users /home/zytz

mkdir /data/sftp/mysftp/upload
chown mysftp:sftp /data/sftp/mysftp/upload
chmod 755 /data/sftp/mysftp/upload

#指令关闭SElinux
#修改/etc/selinux/config文件中的SELINUX="" 为 disabled ，然后重启。或者
# setenforce 0