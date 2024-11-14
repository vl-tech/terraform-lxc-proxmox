# Template for provisioning LXC containers under Proxmox via Terraform

- Make sure to create proxmox user and export the API TOKEN credentials

```bash
export PM_API_TOKEN_ID="Username@pve!TOKEN_NAME"
export PM_API_TOKEN_SECRET="TOKEN_ SECRET"
```

- Clone the Repository and initialize terraform with `terraform init`
- Test the configuration with `terraform plan`

## Proxmox LXC template location

```bash
/var/lib/vz/template/cache/ubuntu-23.10-standard_23.10-1_amd64.tar.zst
```

## This configuration will creat 3 containers with consecutive ID's starting from 200

- The line of code responsible is the `count` and `count.index`

```yaml

count = 3
vmid = 200 + count.index
```

- To create 1 LXC remove the count and the `+ count.index`