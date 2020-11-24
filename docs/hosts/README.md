## Machine Specs

<iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRnefTJOtVEPPZkrQJQbcOrLB0oe2OYGEoUAprL7yPwcMjQO7EPKJ3Du6fUf4hxNmIL4HbXWo1RmZQl/pubhtml?gid=0&amp;single=true&amp;widget=true&amp;headers=false"
  style="width: 90%;
    min-width: 615px;
    min-height: 300px;"></iframe>

[↑で表示してるやつ](https://docs.google.com/spreadsheets/d/10VSlOHDc8Bz3YrpPDXfOrrZqGIJgkCT3TgroJ200WUY/edit?usp=sharing)

### server03

- Web Server
- Application Server

Application サーバ。
ログはできるだけ server11 へ転送する。

### server11

- DBMS
- DataStore
- バッチサーバ

データストア系のミドルウェアと、バッチサーバ。
バッチサーバをこちらにおいているのは、大量のデータの処理をするのに LAN の帯域を使いたくないから。

### server12

- Redis
- RabbitMQ

メモリ系のミドルウェアのサーバ。
ストレージ容量がとても少ないので、Docker Image だけでいっぱいになりそう。

### server02

- Private File Server (transfer over SSH)

大きな容量のハードディスクが `/home` にマウントされているが、これは専ら LAN 内でのファイルサーバ用途。
samba などは使用しておらず、 over SSH なプロトコル（SFTP や RSYNC）で通信する。
