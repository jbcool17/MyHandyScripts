# Linux

## SELinux Notes
```
getenforce
setenfore 0
sepolicy network -t http_port_t

# Tools
yum install setroubleshoot-server selinux-policy-devel

semanage port -a -t http_port_t -p tcp 8080
setenfore 1
getenforce
systemctl restart
```
