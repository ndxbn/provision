## Machine Specs

<iframe src="https://docs.google.com/spreadsheets/d/e/2PACX-1vRnefTJOtVEPPZkrQJQbcOrLB0oe2OYGEoUAprL7yPwcMjQO7EPKJ3Du6fUf4hxNmIL4HbXWo1RmZQl/pubhtml?gid=0&amp;single=true&amp;widget=true&amp;headers=false"
  style="width: 90%;
    min-width: 615px;
    min-height: 300px;"></iframe>

[↑で表示してるやつ](https://docs.google.com/spreadsheets/d/10VSlOHDc8Bz3YrpPDXfOrrZqGIJgkCT3TgroJ200WUY/edit?usp=sharing)

### server01

- Web Server
- Application Server
- DataStore
- バッチサーバ

いわゆる Web アプリケーションのサーバサイドのほぼ全部。

### server02

- Private File Server (transfer over SSH)
- Cache Server

大きな容量のハードディスクが `/home` にマウントされているが、これは専ら LAN 内でのファイルサーバ用途。
samba などは使用しておらず、 over SSH なプロトコル（SFTP や RSYNC）で通信する。

ファイルサーバ用途だけだと、CPU と メモリ が余るため、Cache サーバ と Message Queue サーバとしても使う。

### server03

- サーバ監視
- `/var/lib` は Docker イメージの保存に使用
