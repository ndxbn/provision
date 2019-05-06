# provision

ndxbn.tokyo Infrastructure

## Requirement and Bootstrapping

### Vagrant

スタンドアロン環境や開発環境を作るときに必要なもの

- Oracle Virtual Box
- Vagrant

```bash
vagrant plugin install vagrant-disksize vagrant-vbguest
``` 

## Usage

### WSL のセットアップ

1. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
1. Playbook を流す: `ansible-playbook -i wsl wsl.yml`

```bash
sudo apt-get update
sudo apt-get install --yes software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt-get install --yes ansible

git clone git@github.com:ndxbn/provision.git
pushd ./provision/playbook
ansible-galaxy install -r requirements.yml
ansible-playbook -i wsl wsl.yml
popd
```

### Development

ネットワーク構成が本番環境と同じ環境を、ローカルの Virtual Box に作る。

開発マシンがホストOSの場合、以下の設定を `hosts` に追加するとよい。

```text
# development
192.168.57.7     devel01 devel01.ndxbn.tokyo 
192.168.57.8     devel02 devel02.ndxbn.tokyo
192.168.57.9     devel03 devel03.ndxbn.tokyo
```

### Production
