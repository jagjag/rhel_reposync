#!/bin/bash
#
#  HQ ITD 
#
#  Linux support   Jiang Jiang
#
#  inner line No. :
#


#  v 1.2
#      add jdk  and  oracle key
#  v 2.0
#      add rhel7 support


repoSource=http://ip:port
repoFile=/etc/yum.repos.d/some.repo
repoSource7=http://ip:port



function mkRepoConfigRhel5()
{

   echo '[rhel-5-server-update]'  >${repoFile}
   echo 'name= rhel-5-server-update'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-5-server-rpms/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile}
  
#   echo '[rhel-5-server-optional-rpms]' >>${repoFile}
#   echo 'name= rhel-5-server-optianl-rpms' >>${repoFile} 
#   echo "baseurl=${repoSource}/rhel-5-server-optional-rpms/" >>${repoFile} 
#   echo 'enalbed=1'  >>${repoFile}
#   echo 'gpgcheck=1' >>${repoFile}
#   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}

   echo '[zabbix-rhel5-2.4-x64]' >>${repoFile}
   echo 'name=Zabbix Official Repository - $basearch' >>${repoFile}
   echo "baseurl=${repoSource}/zabbix-rhel5-2.4-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX' >>${repoFile}
   echo '' >>${repoFile}

   echo '[zabbix-non-supported]' >>${repoFile}
   echo 'name=Zabbix Official Repository non-supported - $basearch' >>${repoFile}
   echo "baseurl=${repoSource}/zabbix-non-supported/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX' >>${repoFile}
   echo '' >>${repoFile}

  
   echo '[puppetlabs-products-rhel5-x64]'  >>${repoFile}
   echo 'name=Puppet Labs Products El 5 - $basearch'  >>${repoFile}
   echo "baseurl=${repoSource}/puppetlabs-products-rhel5-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs' >>${repoFile}
   echo '' >>${repoFile}

   echo '[puppetlabs-deps-rhel5-x64]'  >>${repoFile}
   echo 'name=Puppet Labs Products El 5 - $basearch'  >>${repoFile}
   echo "baseurl=${repoSource}/puppetlabs-deps-rhel5-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs' >>${repoFile}
   echo '' >>${repoFile}

   echo '[jdk]'  >>${repoFile}
   echo 'name= jdk'  >>${repoFile}
   echo "baseurl=${repoSource}/jdk/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=0' >>${repoFile}

   yum clean all
   yum clean metadata

 
   #rpm --import /usr/share/rhn/RPM-GPG-KEY 
   rpm --import $repoSource/RPM-GPG-KEY-ZABBIX   
   rpm --import $repoSource/RPM-GPG-KEY-puppetlabs
   rpm --import $repoSource/RPM-GPG-KEY-reductive
   exit 0
}




function mkRepoConfigRhel6()
{

   echo '[rhel-6-server-update]'  >${repoFile}
   echo 'name= rhel-6-server-update'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-6-server-rpms/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 

   echo '[rhel-65-server-dvd]'  >>${repoFile}
   echo 'name= rhel-65-server-dvd'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-65-server-dvd/Server/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 

   echo '[rhel-65-server-ScalableFileSystem]'  >>${repoFile}
   echo 'name= rhel-65-server-ScalableFileSystem'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-65-server-dvd/ScalableFileSystem/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 

   echo '[rhel-65-server-HighAvailability]'  >>${repoFile}
   echo 'name= rhel-65-server-HighAvailability'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-65-server-dvd/HighAvailability/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 


   echo '[rhel-65-server-ResilientStorage]'  >>${repoFile}
   echo 'name= rhel-65-server-ResilientStorage'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-65-server-dvd/ResilientStorage/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 


   echo '[rhel-65-server-LoadBalancer]'  >>${repoFile}
   echo 'name= rhel-65-server-LoadBalancer'  >>${repoFile}
   echo "baseurl=${repoSource}/rhel-65-server-dvd/LoadBalancer/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile} 




   echo '[rhel-6-server-optional-rpms]' >>${repoFile}
   echo 'name= rhel-6-server-optianl-rpms' >>${repoFile} 
   echo "baseurl=${repoSource}/rhel-6-server-optional-rpms/" >>${repoFile} 
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
   echo '' >>${repoFile}
   
   echo '[zabbix-rhel6-2.4-x64]' >>${repoFile}
   echo 'name=Zabbix Official Repository - $basearch' >>${repoFile}
   echo "baseurl=${repoSource}/zabbix-rhel6-2.4-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX' >>${repoFile}
   echo '' >>${repoFile}


   echo '[zabbix-non-supported]' >>${repoFile}
   echo 'name=Zabbix Official Repository non-supported - $basearch' >>${repoFile}
   echo "baseurl=${repoSource}/zabbix-non-supported/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX' >>${repoFile}
   echo '' >>${repoFile} 

   echo '[puppetlabs-products-rhel6-x64]'  >>${repoFile}
   echo 'name=Puppet Labs Products El 6 - $basearch'  >>${repoFile}
   echo "baseurl=${repoSource}/puppetlabs-products-rhel6-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs' >>${repoFile}
   echo '' >>${repoFile} 

   echo '[puppetlabs-deps-rhel6-x64]'  >>${repoFile}
   echo 'name=Puppet Labs Products El 5 - $basearch'  >>${repoFile}
   echo "baseurl=${repoSource}/puppetlabs-deps-rhel6-x64/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=1' >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs' >>${repoFile}

   echo '' >>${repoFile}

   echo '[jdk]'  >>${repoFile}
   echo 'name= jdk'  >>${repoFile}
   echo "baseurl=${repoSource}/jdk/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=0' >>${repoFile}

   echo '[mongodb-org-3.0]'  >>${repoFile}
   echo 'name=MongoDB Repository'  >>${repoFile}
   echo "baseurl=${repoSource}/mongodb-org-3.0/" >>${repoFile}
   echo 'enalbed=1'  >>${repoFile}
   echo 'gpgcheck=0' >>${repoFile}

   echo '[epel6]'  >>${repoFile}
   echo 'name=Extra Packages for Enterprise Linux 6 - $basearch'  >>${repoFile}
   echo "baseurl=${repoSource}/epel6/"  >>${repoFile}
   echo 'enabled=1'  >>${repoFile}
   echo 'gpgcheck=1'  >>${repoFile}
   echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6'  >>${repoFile}


 
 
   yum clean all
   yum clean metadata
   
   #rpm --import /usr/share/rhn/RPM-GPG-KEY 
   rpm --import $repoSource/RPM-GPG-KEY-ZABBIX   
   rpm --import $repoSource/RPM-GPG-KEY-puppetlabs
   rpm --import $repoSource/RPM-GPG-KEY-reductive
   rpm --import $repoSource/RPM-GPG-KEY-EPEL-6
   
   exit 0
}




function mkRepoConfigRhel7()
{
    repoSource=${repoSource7}

   #rpm --import $repoSource/RPM-GPG-KEY-ZABBIX   
   #rpm --import $repoSource/RPM-GPG-KEY-puppetlabs
   #rpm --import $repoSource/RPM-GPG-KEY-reductive

    echo '[rhel-7-server-rpms]' >${repoFile}
    echo "baseurl = ${repoSource}/rhel-7-server-rpms/ ">>${repoFile}
    echo 'name = Red Hat Enterprise Linux 7 Server (RPMs)'>>${repoFile}
    echo 'gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release'>>${repoFile}
    echo 'enabled = 1'>>${repoFile}
    echo 'gpgcheck = 1'>>${repoFile}
    echo '' >>${repoFile}
   
    echo '[rhel-7-server-extras-rpms]'>>${repoFile}
    echo "baseurl = ${repoSource}/rhel-7-server-extras-rpms">>${repoFile}
    echo 'name = Red Hat Enterprise Linux 7 Server - Extras (RPMs)' >>${repoFile}
    echo 'gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
    echo 'enabled = 1' >>${repoFile}
    echo 'gpgcheck = 1' >>${repoFile}
    echo '' >>${repoFile}
    
    
    echo '[rhel-7-server-thirdparty-oracle-java-rpms]'>>${repoFile}
    echo "baseurl = ${repoSource}/rhel-7-server-thirdparty-oracle-java-rpms" >>${repoFile}
    echo 'name = Red Hat Enterprise Linux 7 Server - Oracle Java (RPMs)' >>${repoFile}
    echo 'gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
    echo 'enabled = 1' >>${repoFile}
    echo 'gpgcheck = 1' >>${repoFile}
    echo '' >>${repoFile}
    
    echo '[rhel-7-server-optional-rpms]' >>${repoFile}
    echo "baseurl = ${repoSource}/rhel-7-server-optional-rpms" >>${repoFile}
    echo 'name = Red Hat Enterprise Linux 7 Server - Optional (RPMs)' >>${repoFile}
    echo 'gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-redhat-release' >>${repoFile}
    echo 'enabled = 1' >>${repoFile}
    echo 'gpgcheck = 1' >>${repoFile}
    echo '' >>${repoFile}
    
    echo '[zabbix-rhel7-2.4-x64]' >>${repoFile}
    echo 'name=Zabbix Official Repository - $basearch' >>${repoFile}
    echo "baseurl=${repoSource}/zabbix-rhel7-2.4-x64/" >>${repoFile}
    echo 'enalbed=1'  >>${repoFile}
    echo 'gpgcheck=1' >>${repoFile}
    echo 'gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-ZABBIX' >>${repoFile}
    echo '' >>${repoFile}
   
    yum clean all
    yum clean metadata
    
    rpm --import $repoSource/RPM-GPG-KEY-ZABBIX   

#   echo ${repoSource}
#   echo ${repoSource7} 
   exit 0
}






# get presice edtion number
#platform=`rpm -qa redhat-release | awk -F '-' '{print $5}' | awk -F '.' '{print $1"u"$2}'`
#[[ -z ${platform} ]] && platform=`rpm -qa redhat-release-server | awk -F '-' '{print $5}' | awk -F '.' '{print $1"u"$2}'`

# 


#rhelVersion=`rpm -qa redhat-release | awk -F '-' '{print $5}' | awk -F '.' '{print $1"u"$2}'`
rhelVersion=`rpm -qa redhat-release-server | awk -F '-' '{print $4}' | awk -F '.' '{print $1}'`
if [[ -z ${rhelVersion} ]] 
then
     #echo '5'
     mkRepoConfigRhel5
else
    if [[ ${rhelVersion} == 7 ]]
    then
        #echo '7'
        mkRepoConfigRhel7
    else
        #echo '6'
        mkRepoConfigRhel6
    fi
fi

#NOTE for RHN users  EPEL
#You need to also enable the 'optional' repository to use EPEL packages as they depend on packages in that repository. This can be done by enabling the RHEL optional subchannel for RHN-Classic. For certificate-based subscriptions see Red Hat Subscription Management Guide. For EPEL 7, in addition to the 'optional' repository (rhel-7-server-optional-rpms), you also need to enable the 'extras' repository (rhel-7-server-extras-rpms).
#


