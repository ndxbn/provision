# provision

ndxbn.tokyo Infrastructure

## Usage

### on WSL

If you use Windows 10, you may use WSL to ansible client. Here is steps that setup WSL.

1. [Install python pip](https://pip.pypa.io/en/stable/installing/)
1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
1. download this repository and run playbook with `wsl` inventory: `ansible-playbook -i wsl site.yml`
