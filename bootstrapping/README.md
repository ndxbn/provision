# Manually Bootstrapping

## Requirements

- `ndxbn` Linux ユーザで github.com に到達できる
- `ndxbn` Linux ユーザの公開鍵が https://github.com/ndxbn.keys に登録済み

## WSL2 Ubuntu

```bash
git clone git@github.com:ndxbn/provision.git ~/provision
pushd ~/provision/bootstrapping
./wsl-ubuntu.bash
```
