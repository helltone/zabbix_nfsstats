Scripts to collect nfsstats with nfsiostat
Put entry to crontab

* * * * * /usr/local/bin/nfscollect.sh /tmp/nfsstats 60

Put files nfscollect.sh nfsparse.sh and mount-nfs-discovery to /usr/local/bin with 755 perms

Import .xml template to you zabbix

Put .conf file into your dir for .conf files that zabbix-agent is able to include 

In main zabbix-agent.conf file set UnsafeUserParameters=1