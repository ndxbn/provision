## Machine Specs

| key                           | deploy    | server01    | server02    | server03   |
| :---------------------------- | :-------- | :---------- | :---------- | :--------- |
| CPU                           | E7500     | i7-4770     | FX-8120     | G530       |
| CPU cores / threads           | 2/2       | 4/8         | 8/8         | 2/2        |
| CPU clock GHz                 | 2.93GHz   | 3.40GHz     | 3.10GHz     | 2.40GHz    |
| RAM GB                        | 2GB       | 32GB        | 16GB        | 8GB        |
| Root Storage GB / type        | 500GB HDD | 256GB SSD   | 128GB SSD   | 128GB SSD  |
| 2nd Storage mount point       |           | `/var/lib`  | `/home`     | `/var/lib` |
| 2nd Storage TB / type         |           | 12TB HDD    | 16TB HDD    | 0.5TB HDD  |
| 2nd Storage devices           |           | 6TBx4 RAID6 | 8TBx4 RAID6 | 0.5TBx1    |
| 3rd Storage mount point       |           | `/home`     |             |            |
| 3rd Storage TB / type         |           | 6TB HDD     |             |            |
| 3rd Storage devices           |           | 3TBx3 RAID5 |             |            |
| 192.168.1.0 Network Host Addr | `7`       | `6`         | `8`         | `9`        |

### deploy

CPU は https://ark.intel.com/ja/products/36503

### server01

CPU は https://ark.intel.com/ja/products/75122/

`/var/lib` にマウントされているのは、データベースや Docker Server などが使う。

`/home` にマウントされているのは、アプリケーションごとのストレージ領域として使う。

### server02

CPU は https://www.amd.com/ja/products/cpu/fx-8120

大きな容量のハードディスクが `/home` にマウントされているが、これは専ら LAN 内でのファイルサーバ用途。
samba などは使用しておらず、 over SSH なプロトコル（SFTP や RSYNC）で通信する。

ファイルサーバ用途だけだと、CPU と メモリ が余るため、Cache サーバ と Message Queue サーバとしても使う。

### server03

CPU は https://ark.intel.com/ja/products/53414

各サーバの監視をしている。
