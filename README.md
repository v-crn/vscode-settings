# vscode-settings

Visual Studio Code (vscode) の設定ファイルを管理するリポジトリ

## 環境

macOS

## 管理対象ファイル

- extensions.json
  - 推奨拡張機能と非推奨拡張機能の設定
  - 必要であればワークスペース毎に用意する
- keybindings.json
  - キーバインディング
  - アクションとショートカットキーの組み合わせの設定
- settings.json
  - 全般的な設定
- extensions.txt
  - 拡張機能の一覧
  - 元から用意されているファイルではない

## ローカル設定ファイルの場所

### Linux

`~/.config/Code/User`

### macOS

`~/Library/Application\ Support/Code/User`

- スペースにはバクスラ `\` 付けるの忘れずに

### Windows

`C:\Users\USERNAME\AppData\Roaming\Code\User`

## 使い方

### 設定ファイルの管理

```sh
# 現在適用されている設定ファイルとの差分を確認
make diff/cfg

# .vscode/ の設定を適用
make up

# 既存の対象ファイルを .vscode/ 以下にコピー
make pull
```

### 拡張機能の管理

```sh
# インストール済み拡張機能のリストを作成
make list

# インストール済み拡張機能との差分を確認
make diff/ext

# 基本的な拡張機能をインストール
make install/basic

# extensions/extensions.txt を参照して拡張機能をインストール
make install

# extensions/ 以下のフォルダ名を指定して拡張機能をインストール
make install e=markdown
```

## ローカルでのみ適用したい設定

ここでは管理せず、ローカルでのみ適用したい設定は `settings.local.json` を作成してその中に記述する。

```sh
code ~/Library/Application\ Support/Code/User/settings.local.json
```
