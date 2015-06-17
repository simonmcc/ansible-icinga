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

  - fqdn: "FTC-R6N6340-C02-VCENTER"
    ipv4: 10.1.69.129
    hostgroups:
      - vmware
    services:
      - name: ssh
      - name: http
      - name: https

  #
  # ENV1 - ESX/ESX
  #
  - fqdn: "FTC-R6N6340-C02-02-ILO"
    ipv4: 10.1.66.22
    hostgroups:
      - ilo
      - env1
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-03-ILO"
    ipv4: 10.1.66.23
    hostgroups:
      - ilo
      - env1
    services:
      - name: ssh
      - name: http
      - name: https

  - fqdn: "FTC-R6N6340-C02-02-MGMT"
    ipv4: 10.1.62.22
    hostgroups:
      - ilo
      - env1
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-03-MGMT"
    ipv4: 10.1.62.23
    hostgroups:
      - ilo
      - env1
    services:
      - name: ssh
      - name: http
      - name: https

  - fqdn: "FTC-R6N6340-C02-04-ILO"
    ipv4: 10.1.66.24
    hostgroups:
      - ilo
      - env3
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-05-ILO"
    ipv4: 10.1.66.25
    hostgroups:
      - ilo
      - env3
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-06-ILO"
    ipv4: 10.1.66.26
    hostgroups:
      - ilo
      - env4
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-07-ILO"
    ipv4: 10.1.66.27
    hostgroups:
      - ilo
      - env4
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-08-ILO"
    ipv4: 10.1.66.28
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-09-ILO"
    ipv4: 10.1.66.29
    hostgroups:
      - ilo
      - vspehere
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-10-ILO"
    ipv4: 10.1.66.30
    hostgroups:
      - ilo
      - env2
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-11-ILO"
    ipv4: 10.1.66.31
    hostgroups:
      - ilo
      - env2
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-12-ILO"
    ipv4: 10.1.66.32
    hostgroups:
      - ilo
      - env2
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-13-ILO"
    ipv4: 10.1.66.33
    hostgroups:
      - ilo
      - env2
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-14-ILO"
    ipv4: 10.1.66.34
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-15-ILO"
    ipv4: 10.1.66.35
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-16-ILO"
    ipv4: 10.1.66.36
    services:
      - name: ssh
      - name: http
      - name: https
  - fqdn: "FTC-R6N6340-C02-17-ILO"
    ipv4: 10.1.66.37
    services:
      - name: ssh
      - name: http
      - name: https
