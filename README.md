terraform-islandora
===================

Islandora CLAW with Packer, Ansible and Terraform.


Make Image
----------

cd packer


Add DigitalOcean API Tocken to packer/variables.json
```
{
  "api_token":    "your_digitalocean_tocken_here"
}
```

make build


Deploy
------

```
export DIGITALOCEAN_TOKEN={your_digitalocean_tocken_here}
terrafrom init
terrafrom apply
```

Access
------

Edit /etc/hosts: 

```
ip_address  claw.dev
```


http://claw.dev:8000


login/password: admin/islandora

 
