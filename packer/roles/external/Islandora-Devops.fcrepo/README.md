# Ansible Role: Fedora 4

An Ansible role that installs Fedora 4 in a Tomcat 8 servlet container on:

* Centos/RHEL 7.x
* Ubuntu Xenial

## Role Variables

Available variables are listed below, along with default values:

Version of Fedora to install
```
fcrepo_version: 4.7.2
```

User with permissions to install:
```
fcrepo_user: {{ tomcat8_server_user }}
```

Path to put Fedora data directory
```
fcrepo_data_dir: /var/lib/tomcat8/fcrepo4-data
```

A home directory for Fedora
```
fcrepo_home_dir: /opt/fcrepo
```

Where to put the Fedora war file
```
fcrepo_war_path: "{{ tomcat8_home }}/webapps/fcrepo.war"
```

The activemq configuration file template name
```
fcrepo_activemq_template: activemq.xml.j2
```

Where the configurations are stored
```
fcrepo_config_dir: "{{ fcrepo_home_dir }}/configs"
```

## Dependencies

* islandora.tomcat8
  
## Example Playbook

    - hosts: webservers
      roles:
        - { role: islandora.fcrepo }

## License

MIT