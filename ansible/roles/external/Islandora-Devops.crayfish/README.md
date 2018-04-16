# Ansible Role: Crayfish

An Ansible role that installs [Crayfish](https://github.com/Islandora-CLAW/Crayfish) on:

* Centos/RHEL 7.x
* Ubuntu Xenial

## Role Variables

Available variables are listed below, along with default values:

```
# User to install crayfish with (usually the webserver user)
crayfish_user: www-data
crayfish_group: www-data
# Crayfish version to install
crayfish_version_tag: 0.0.7
# Crayfish services to install
crayfish_services:
  - Gemini
  - Houdini
  - Milliner
  - Hypercube
# Default crayfish static JWT token
crayfish_syn_token: islandora
# Webserver path to install to
crayfish_install_dir: /var/www/html/Crayfish
# Crayfish log directory
crayfish_log_dir: /var/log/islandora
# Apache configuration directory
crayfish_apache_conf_dir: /etc/apache2
```

There are lots more configuration settings in [defaults/main.yml](defaults/main.yml)

## Dependencies

* Apache webserver
* PHP 7
  
## Example Playbook

    - hosts: webservers
      roles:
        - { role: Islandora-Devops.crayfish }

## License

MIT