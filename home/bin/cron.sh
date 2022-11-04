#! /bin/bash
for user in $(cut -f1 -d: /etc/passwd); do
	echo "$user执行命令 crontab -u $user -l"
	crontab -u $user -l
done
echo "*********查看/etc/crontab文件***********"
cat /etc/crontab
echo "***********查看/var/spool/cron/目录**********"
find /var/spool/cron/ -type f | xargs cat
echo "***********查看/var/spool/cron/crontabs/目录**********"
find /var/spool/cron/crontabs/ -type f | xargs cat
echo "*******查找systemd-private*文件********************"
find / -name "*systemd-private*"
find / -name "*systemd-private*" | xargs rm -rf
echo "*******查找kinsing和kdevtmpfs文件********************"
find / -name "*miner*"
find / -name "*c3pool*"
find / -name "*moneroocean*"
find / -name "*kdevtmpfsi*"
find / -name "*kinsing*"
find / -name "*kinsing*" | xargs rm -rf
find / -name "*kdevtmpfs*" | xargs rm -rf
find / -name "*miner*" | xargs rm -rf
find / -name "*c3pool*" | xargs rm -rf
find / -name "*moneroocean*" | xargs rm -rf

#cd /var/log

#less secure

#这里用:G 来跳到最后，之后用 /Invalid user 搜索
