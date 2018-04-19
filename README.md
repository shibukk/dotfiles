## Usage

下記コマンドを実行する

```bash
# このリポジトリをzipでダウンロードして解凍する
$ mv ~/Downloads/dotfiles-master/dotfiles-master ~/dotfiles
$ cd ~/dotfiles/setup

$ sudo ./init.sh
$ sudo ./after.sh

$ cd ~/.ssh
$ ssh-keygen -t rsa -b 4096 -f id_rsa_github
$ pbcopy < ~/.ssh/id_rsa_github.pub
# 生成した公開鍵をGitHubに登録する
```

- `Finder環境設定 -> サイドバー` のよく使う項目を整理する
- `システム環境設定 -> キーボード -> 修飾キー` から 「Caps Lockキー」を「Commandキー」に割り当てる
- `システム環境設定 -> ディスプレイ` から、「輝度を自動調整」をOFFにする
