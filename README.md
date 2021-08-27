# vscode-settings

Visual Studio Code (vscode) の設定ファイルを管理するリポジトリ

## 対象ファイル

- extensions.json
  - 推奨拡張機能と非推奨拡張機能の設定
  - 必要であればワークスペース毎に用意する
- keybindings.json
  - キーバインディング
- settings.json
  - 設定全般
- extensions.txt
  - 拡張機能の一覧
  - 元から用意されているファイルではない

## 設定ファイルの場所

### Windows

`C:\Users\USERNAME\AppData\Roaming\Code\User`

### macOS

`$HOME/Library/Application\ Support/Code/User`

- スペースにはバクスラ `\` 付けるの忘れずに

### Linux

`~/.config/Code/User`

## 差分の確認

`git diff` コマンドや `diff -u` コマンドを利用して現在適用されている設定ファイルとの差分を確認することができる。

```sh
FILE=~/Library/Application\ Support/Code/User/settings.json
git diff .vscode/settings.json $FILE
```

## 設定の適用

### ローカルデバイスのみで適用したい設定

ローカルのデバイスのみで適用したい設定は `settings.local.json` に記述する。

### 現在のワークスペースのみに適用したい設定

`.vscode` ディレクトリを作成し、その中に設定ファイルを作成する。

## VS Code 拡張機能

### extensions.txt を参照して拡張機能をインストールする

```sh
make install
```

### インストール済み拡張機能一覧の生成

```sh
make extensions
```

### 環境別拡張機能

`extensions` ディレクトリ以下には用途に分けて extensions.txt を配置した。
