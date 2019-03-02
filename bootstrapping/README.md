# Manually Bootstrapping

- `ndxbn` linux user should be exists
- `ndxbn` should be able to logged in with github.com registered keys
- `ndxbn` should be able to execute `sudo` without password
- [Ansible Latest](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- Git 1.8 (or later)

## CentOS 7 Minimal

do on `ndxbn` user:

```bash
# ensure dot-ssh directory
mkdir -p ${HOME}/.ssh

## remove duplicated keys
mv ${HOME}/.ssh/authorized_keys ${HOME}/.ssh/authorized_keys.backup
curl -q https://github.com/ndxbn.keys | sort | uniq > ${HOME}/.ssh/authorized_keys
## fix file permission
chmod 600 ${HOME}/.ssh/authorized_keys
```

do on `root` user:

```bash
cat <<EOS > /etc/sudoers.d/ndxbn
ndxbn ALL=(ALL) NOPASSWD:ALL
EOS
```
