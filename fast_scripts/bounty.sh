#!/bin/bash

create_domain(){
	name=$1
	mkdir $name
	mkdir "$name/info"
	touch "$name/info/hosts_status"
	domain=$2
	cd $name
	# Automatizando TheHarvester
	theharvester -d $domain -b all -f $name
	cat "$name.json" | jq .ips | tr -d ',[] "' | anew ips.txt
	cat "$name.json" | jq .hosts | tr -d '@,[] "' | grep http | httprobe | anew hosts
	cat "$name.json" | jq .emails | tr -d ',[] "' | anew hosts
	#rm $name.json 
	rm $name.xml
	# Automatizando la generación de posibles hosts (luego notificar)
	echo $domain | subfinder --subs-only | anew domains.txt | httprobe | anew hosts
	cat hosts | httpx-pd -sc -title -fr | anew info/hosts_status
	metagoofil -d $domain -t pdf,pptx,docx | anew files.txt
	cd ..
	echo "update_domain $1 $2" | anew update_dom.sh
} 


# Main
create_domain $1 $2
