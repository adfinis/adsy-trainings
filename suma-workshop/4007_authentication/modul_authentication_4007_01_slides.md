% SUSE Manager 3 Authentication
% Marc Stulz
% November 14, 2016

![](static/adfinis_sygroup_logo.png)

Be smart. Think open source.

# SUSE Manager 3 - Authentication

![](static/suma.png)

---

## Agenda

* SSSD

* PAM

* User Import

---

## SSSD

Provider

* LDAP

* Active Directory

* Identity Management

* Kerberos (auth only)

## SSSD - AD Provider

Example configuration `/etc/sssd/sssd.conf`

```ini
[nss]
filter_users = root
filter_groups = root

[pam]

[sssd]
config_file_version = 2
services = nss, pam
domains = sub.mydomain.com

[domain/sub.mydomain.com]
ad_server =  dc1.sub.mydomain.com, dc2.sub.mydomain.com
id_provider = ad
default_shell = /bin/bash
ad_access_filter = (memberOf=cn=admins,ou=groups,dc=mydomain,dc=com)

```

## SSSD - nsswitch

Example `/etc/nsswitch.conf`

```text
passwd: file sss
group:  file sss
shadow: file sss
```

## SSSD - nscd

Must to be stoped and disbaled as sssd now caches:

```text
# systemctl stop nscd.service

# systemctl disable nscd.service

```

---

## PAM

`/etc/pam.d/common-auth`

```text
auth    required        pam_env.so
auth    sufficient      pam_unix.so     try_first_pass
auth    sufficient      pam_krb5.so     use_first_pass
auth    required        pam_sss.so      use_first_pass

```

`/etc/pam.d/susemanager`

```text
auth     include        common-auth
account  include        common-account
password include        common-password

```

`/etc/rhn/rhn.conf`

```text
pam_auth_service = susemanager

```

---

## User import

```bash
## Configuration ##
#AD Group
ADGROUP=APP_RH_SUSEManager
# SUMA Local Admin
SPACEUSR=Admin
# SUMA Local Password
SPACEPW=...
# Domain Part of EMAIL address
DOMAIN_EMAIL=sub.mydomain.com
# Roles that need to be assigned to the user
ROLES="satellite_admin activation_key_admin system_group_admin org_admin config_admin channel_admin"

## Automatic Lists ##
SCMD="/usr/bin/spacecmd -y -q -u $SPACEUSR -p $SPACEPW"
GRPUSRS=$(getent group "${ADGROUP}" | cut -f4 -d: | sed 's/,/ /g' | sed "s/\'//g")
SUMAUSRS=$($SCMD user_list | grep -v -x $SPACEUSR)

## Magic ##
for each in ${GRPUSRS}
        do
        PAM_USER="${each}"
        USREXIST=$(echo "$SUMAUSRS" | grep -x "$PAM_USER")
        if [ -z "${USREXIST}" ]; then
           ${SCMD} "user_create -u ${PAM_USER} -f ${PAM_USER} -l ${PAM_USER} -e ${PAM_USER}@${DOMAIN_EMAIL} --pam "
           for each in ${ROLES}
             do
             ${SCMD} user_addrole ${PAM_USER} "${each}"
           done
           logger $0 : added ${each} as SUMA Admin
        fi
done

for each in ${SUMAUSRS}
        do
                if [ "${each}" == "${SPACEUSR}" ]; then
                        break
                fi
                echo ${GRPUSRS} | grep "${each}" > /dev/null
                if [ "$?" -gt 0 ]; then
                        ${SCMD} user_delete "${each}"
                        logger $0 : removed ${each} from SUMA Admins
                fi
done

```

## User Import

`/etc/rhn/sw-ldap-user-sync.conf`

```yaml
directory:
  user: uid=xyz,dc=example,dc=com
  password: xxx
  url: ldaps://ldap.example.com:636
  group: cn=admin,ou=groups,dc=example,dc=com
  users: ou=people,dc=example,dc=com
spacewalk:
  url: http://localhost/rpc/api
  user: spacewalk
  password: xxx

```

`/usr/bin/sw-ldap-user-sync`

---

## Feel Free to Contact Us

[www.adfinis-sygroup.ch](https://www.adfinis-sygroup.ch)

[Tech Blog](https://www.adfinis-sygroup.ch/blog)

[GitHub](https://github.com/adfinis-sygroup)

<info@adfinis-sygroup.ch>

[Twitter](https://twitter.com/adfinissygroup)
