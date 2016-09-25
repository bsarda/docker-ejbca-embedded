# docker-ejbca-embedded
This is the EJBCA container on CentOS 7.2 1511.  
This container uses a MariaDB local database.
For a container that uses (your) external database, use bsarda/ejbca.

Sample usage:  
`docker run -p 8080:8080 -p 8442:8442 -p 8443:8443 -d --name pki bsarda/ejbca-embedded`  
`docker logs -f pki`  
When logs shows 'EJBCA Initialized.[...]', you should download the superadmin token  
`docker cp pki:/superadmin.p12 ~/`  
And install it in the user's personal store. Defaut password = ejbca  
Note the ports used to connect:  
`docker port pki`  

Open the interface from a brower, like https://192.168.63.5:32768/ejbca  

## Options as environment vars
**cli user/pass**  
- EJBCA_CLI_USER => default 'ejbca'  
- EJBCA_CLI_PASSWORD => default 'ejbca'  
**keystore**  
- EJBCA_KS_PASS => keystore password => default 'foo123'  
**certificate authority**  
- CA_NAME => name (CN) of the cert authority => default 'ManagementCA'  
- CA_DN => DN of the cert authority => default 'CN=ManagementCA,O=EJBCA,C=FR'  
- CA_KEYSPEC => key size => default '2048'  
- CA_KEYTYPE => key type => default 'RSA'  
- CA_SIGNALG => signature algorithm => default 'SHA256WithRSA'  
- CA_VALIDITY => validity in days => default '3650' (10 years)  
**web server**  
- WEB_SUPERADMIN => superadmin name => default 'SuperAdmin'  
- WEB_JAVA_TRUSTPASSWORD => java truststore password => default 'changeit'  
- WEB_HTTP_PASSWORD => password for http server => default 'serverpwd'  
- WEB_HTTP_HOSTNAME => hostname of the http server => default 'localhost'  
- WEB_HTTP_DN => DN of the http server => default 'CN=localhost,O=EJBCA,C=FR'  
- WEB_SELFREG => enable self-service registration => default 'true'  
