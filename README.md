# provision

ndxbn.tokyo Infrastructure

I manage ISSUE in https://github.com/ndxbn/ndxbn/labels/package%3Aprovision

## Requirement and Bootstrapping

### Vagrant

スタンドアロン環境や開発環境を作るときに必要なもの

- Oracle Virtual Box
- Vagrant

```bash
vagrant plugin install vagrant-disksize vagrant-vbguest
``` 

## Usage

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
