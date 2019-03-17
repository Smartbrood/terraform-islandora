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

Path to put Fedora data directory (see the notes section below)
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

Path to put Fedora data directory
```
fcrepo_data_dir: "{{ fcrepo_home_dir }}/fcrepo4-data"
```

Islandora uses the HeaderProvider to pass the users roles into Fedora. To use this you will need to set the below variable.

Header name to acquire roles from
```
fcrepo_auth_header_name:
```


## Dependencies

* islandora.tomcat8
  
## Example Playbook

    - hosts: webservers
      roles:
        - { role: islandora.fcrepo }

## Notes

This role only uses the fcrepo_data_dir to create a directory. To tell Fedora
to use this directory you either need to incorporate the value into the
[repository.json template](templates/repository.json) or add it to the Tomcat
Java Opts. For example, if using
[ansible-role-tomcat8](https://github.com/Islandora-Devops/ansible-role-tomcat8)
adding the following to your inventory:
```
fcrepo_data_dir: "/data/fcrepo-data"

tomcat8_java_opts:
  - -Dfcrepo.binary.directory={{ fcrepo_data_dir }}
```

## License

MIT
