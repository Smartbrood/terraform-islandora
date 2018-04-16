# Ansible Role: Grok

An Ansible role that installs [Grok](https://github.com/GrokImageCompression/grok) on:

* Centos/RHEL 7.x
* Ubuntu Xenial

## Role Variables

Available variables are listed below, along with default values:

Where to clone it to:
```
grok_clone_directory: /opt/grok
```

Version to install:
```
grok_version_tag: v2.3.0
```

## Dependencies

* None
  
## Example Playbook

    - hosts: webservers
      roles:
        - { role: islandora.grok }

## License

MIT