# Icinga via Ansible

This is a very simple kit used to install & maintain an Icinga install in a semi automated fashion

It's primary use case is to monitor hosts that aren't directly in your ansible inventory, therefore hosts & services to be monitored are stored in host_vars:

	$ cat host_vars/philj-ux1.fc.hp.com
	---
	adminusers: "icingaadmin,mccartsi"
	
	external_hosts:
	  # HP C7000 iLO OA Card
	  - fqdn: "FTC-R6N6340-C02-OA"
	    ipv4: 10.1.66.21
	    hostgroups:
	      - ilo
	    services:
	      - name: ssh
	      - name: http
	      - name: https
	  # Virtual Connect
	  - fqdn: "FTC-R6N6340-C02-VC"
	    ipv4: 10.1.66.39
	    hostgroups:
	      - ilo
	    services:
	      - name: ssh
	      - name: http
	      - name: https
	      
So here we have a pair of hosts defined, with ssh, http & https being monitored, service checks are defined in `files/objects/services_icinga.cfg` is they aren't part of the standard set distributed with Icinga.

## Using the playbook

The `ansible.cfg` in this kit assumed you can SSH in directly as root, if this isn't the case, you'll need to adjust either your inventory file or `ansible.cfg` to fit your circumstances.

You'll note there are currently 2 inventory files, `ftc` and `johnstongilpin`, there are 2 corresponding entries in `host_vars` for those sites, `philj-ux1.fc.hp.com` and `littleblack.johnstonglipin.co.uk`  (johnstongilpin is a test site, demonstrating that you could manage muliple Icinga installs from the one kit)


### Full run:

    ansible-playbook -i ftc icinga.yml 
        
### Update templates only (and restart if required)

    ansible-playbook -i ftc icinga.yml --tags templates