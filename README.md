# vscode-settings

Visual Studio Code (vscode) の設定ファイルを管理するリポジトリ

## 対象ファイル

- keybindings.json
  - キーバインディング
- settings.json
  - 設定全般
- extensions.txt
  - 拡張機能の一覧
  - 元から用意されているファイルではない

## VS Code 拡張機能

### extensions.txt を参照して拡張機能をインストールする

```sh
make install
```

### インストール済み拡張機能一覧の生成

```sh
make extensions
```

## 設定ファイルの場所

### Windows

`C:\Users\USERNAME\AppData\Roaming\Code\User`

### Mac

`~/Library/Application Support/Code/User`

### Linux

`~/.config/Code/User`
