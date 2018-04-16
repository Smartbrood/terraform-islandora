# Ansible Role: API-X

An Ansible role that installs [API-X](https://github.com/fcrepo4-labs/fcrepo-api-x) in a Karaf container on:

* Centos/RHEL 7.x
* Ubuntu Xenial

## Role Variables

Available variables are listed below, along with default values:

```
# API-X Maven repository
apix_feature_repo: mvn:org.fcrepo.apix/fcrepo-api-x-karaf/LATEST/xml/features

# API-X features to install
apix_feature:
  - fcrepo-api-x
  - fcrepo-indexing-triplestore
  - fcrepo-service-camel

# Karaf directory
apix_karaf_dir: /opt/karaf

# Karaf /etc (configuration) directory
apix_karaf_etc_dir: "{{ apix_karaf_dir }}/etc"

# API-X configuration settings.
apix_config:
  - pid: org.fcrepo.apix.registry.http
    settings:
      timeout.socket.ms: 1000
  - pid: org.fcrepo.camel.indexing.triplestore
    settings:
      input.stream: activemq:topic:fedora
      triplestore.reindex.stream: activemq:queue:triplestore.reindex
      triplestore.baseUrl: http://localhost:8080/bigdata/namespace/kb/sparql
```

## Dependencies

An Apache Karaf container we recommend
* Islandora-Devops.karaf
     * [Github](https://github.com/Islandora-Devops/ansible-role-karaf)
     * [Galaxy](https://galaxy.ansible.com/Islandora-Devops/karaf/)
  
## Example Playbook

    - hosts: webservers
      roles:
        - { role: Islandora-Devops.apix }

## License

MIT