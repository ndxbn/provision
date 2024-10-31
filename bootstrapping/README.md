# Manually Bootstrapping

## Requirements

- `ndxbn` Linux ユーザで github.com に到達できる
- systemd が動いている（WSL の場合は設定しろということ）

## WSL2 Ubuntu

```bash
git clone https://github.com/ndxbn/provision.git ~/provision
pushd ~/provision/bootstrapping
./wsl-ubuntu.bash
```
