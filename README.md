# provision

ndxbn.tokyo Infrastructure

## Usage

### WSL のセットアップ

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
1. Playbook を流す: `ansible-playbook -i wsl wsl.yml`

```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible

git clone git@github.com:ndxbn-tokyo/provision.git
pushd ./provision/playbook
ansible-playbook -i wsl wsl.yml
popd
```

### Development

ネットワーク構成が本番環境と同じ環境を、ローカルの Virtual Box に作る。

開発マシンがホストOSの場合、以下の設定を `hosts` に追加する。

```text
192.168.57.6  server01 server01.devel.ndxbn.tokyo
192.168.57.7  deploy deploy.devel.ndxbn.tokyo
192.168.57.8  server02 server02.devel.ndxbn.tokyo
192.168.57.9  server03 server03.devel.ndxbn.tokyo
```

### Production
