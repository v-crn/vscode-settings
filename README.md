# vscode-settings

Visual Studio Code (vscode) の設定ファイルを管理するリポジトリ

## 前提

- macOS

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

`~/Library/Application\ Support/Code/User`

- スペースにはバクスラ `\` 付けるの忘れずに

### Linux

`~/.config/Code/User`

## 差分の確認

`.vscode` 以下のファイルと現在適用されている設定ファイルとの差分を確認

```sh
make diff
```

差分がなければ次のように表示される。

```console
$ make diff
extensions.json
keybindings.json
settings.json
```

## 設定の適用

### 設定の上書き

次のコマンドで `.vscode` 以下のファイル群を `~/Library/Application\ Support/Code/User` にコピーし、設定を適用する。

```sh
make up
```

### ローカルデバイスのみで適用したい設定

ローカルのデバイスのみで適用したい設定は `settings.local.json` を作成してその中に記述する。

### 現在のワークスペースのみに適用したい設定

`.vscode` ディレクトリを作成し、その中に設定ファイルを作成する。

## VS Code 拡張機能

### extensions.txt を参照して拡張機能をインストールする

```sh
make install
```

Web 開発で用いられる基本的な拡張機能だけをインストールする場合:

```sh
make install/basic
```

### 環境別拡張機能のインストール

`extensions` ディレクトリ以下には用途に分けて extensions.txt を配置した。
個別にインストールする場合は次のように変数 `e` に対象のディレクトリ名を指定する。

```sh
make install e=markdown
```

### インストール済み拡張機能一覧の生成

ローカルのインストール済み拡張機能の一覧を `extensions/extensions.txt` に出力する。

```sh
make list
```

### ローカルの設定ファイルを `.vscode` 以下にコピーする

既にローカルに適用されている設定ファイルを `.vscode` 以下にコピーする。
※すべての設定ファイルではなく、ここで管理している対象ファイルのみ

```sh
make pull
```
