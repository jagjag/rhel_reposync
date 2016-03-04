
#!/bin/bash
#
#  HQ ITD
#
#  Linux support   Jiang Jiang
#
#  inner line No. : 
#


#  v 1.0
#
#  v 1.1
#      add selinux
#      add find and clean

# v 1.2 
#      fix bug
#      add rhel5 createrepo option





repo_base=/home/reposync
synclog=${repo_base}/log/sync.log.`date '+%Y%m%d'`
syncpath=${repo_base}/reposync

synclist='rhel-6-server-rpms rhel-5-server-rpms rhel-6-server-optional-rpms zabbix-rhel6-2.4-x64 zabbix-rhel5-2.4-x64 zabbix-non-supported zabbix-rhel7-2.4-x64 zabbix-rhel7-3.0-x64'


for i in ${synclist}
do
    echo $i >>${synclog}
    #echo "/usr/bin/reposync -n -p ${syncpath} -r ${i} && /bin/createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1 ">>${synclog}
    #/usr/bin/reposync -n -p ${syncpath} -r ${i} 1>>${synclog}  2>&1 && /bin/createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1
    #/usr/bin/reposync -n -p ${syncpath} -r ${i}  | grep FAILED >> ${synclog}
    /bin/env reposync  -m -g -n -p ${syncpath} -r ${i}
    echo "reposync complete"  >>${synclog}

    if echo $i | grep 'rhel-5'
    then
        echo "createrepo rhel5 "  >>${synclog}
        /bin/env createrepo  -s sha1 --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1
    else
        echo "createrepo rhel6,7 "  >>${synclog}
        /bin/env createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1
    fi
done



sudo chown -R apache:apache ${repo_base}
sudo chcon -R -t httpd_sys_content_t ${repo_base}


find ${synclog} -mtime +90 -delete
find ${syncpath} -size 0 -delete
