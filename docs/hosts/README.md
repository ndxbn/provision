## Machine Specs

<iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRnefTJOtVEPPZkrQJQbcOrLB0oe2OYGEoUAprL7yPwcMjQO7EPKJ3Du6fUf4hxNmIL4HbXWo1RmZQl/pubhtml?gid=0&amp;single=true&amp;widget=true&amp;headers=false"></iframe>

### deploy

### server01

`/var/lib` にマウントされているのは、データベースや Docker Server などが使う。

`/home` にマウントされているのは、アプリケーションごとのストレージ領域として使う。

### server02

大きな容量のハードディスクが `/home` にマウントされているが、これは専ら LAN 内でのファイルサーバ用途。
samba などは使用しておらず、 over SSH なプロトコル（SFTP や RSYNC）で通信する。

ファイルサーバ用途だけだと、CPU と メモリ が余るため、Cache サーバ と Message Queue サーバとしても使う。

### server03

各サーバの監視をしている。
