`ansible-playbook -i local -K -C`

- `-K`: ask become password
- `-C`: check mode, dry-run

## on Ubuntu

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
ansible-galaxy install -r requirements.yaml
```
