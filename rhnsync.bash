#!/bin/bash

repo_base=/home/reposync
synclog=${repo_base}/log/sync.log.`date '+%Y%m%d'`
syncpath=${repo_base}/reposync

synclist='rhel-7-server-rpms rhel-7-server-extras-rpms rhel-7-server-thirdparty-oracle-java-rpms rhel-7-server-optional-rpms epel'


for i in ${synclist} 
do
    echo $i >>${synclog}
    #echo "/usr/bin/reposync -n -p ${syncpath} -r ${i} && /bin/createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1 ">>${synclog}
    #/usr/bin/reposync -n -p ${syncpath} -r ${i} 1>>${synclog}  2>&1 && /bin/createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1 
    #/usr/bin/reposync -n -p ${syncpath} -r ${i}  | grep FAILED >> ${synclog}
    /bin/env reposync  -m -g -n -p ${syncpath} -r ${i}   
    if $(grep rhel-5)
    then
        /bin/env createrepo  -s sha1 --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1 
    else
        /bin/env createrepo  --update -d -p ${syncpath}/${i} -o ${syncpath}/${i} 1>>${synclog}  2>&1 
    fi
done



sudo chown -R apache:apche ${repo_base}
sudo chcon -R -t httpd_sys_content_t ${repo_base}


find ${synclog}/log -mtime +90 -delete
find ${syncpath} -size 0 -delete
