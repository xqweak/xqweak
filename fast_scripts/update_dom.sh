#!/bin/bash

update_domain(){
	name=$1
	domain=$2
	echo "updating $1 for domain $2"
	# Automatizando la generación de posibles hosts (luego notificar)
	cd $name
	pwd
	echo $domain | subfinder --subs-only | httprobe | anew hosts
	echo "httpx on $domain"
	cat hosts | httpx-pd -sc -title -fr | anew info/hosts_status | notify -nc # Notifico dominios cambiados
	cd ..
	pwd
} 

# Tracking Domains (domains that i'm currently tracking)
update_domain Bext bextsa.com
update_domain Urosario urosario.edu.co
update_domain Paladins meetpaladin.com
