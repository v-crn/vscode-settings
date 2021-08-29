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

## 設定ファイルの管理

```sh
# 現在適用されている設定ファイルとの差分を確認
make diff/cfg

# .vscode/ の設定を適用
make up

# 既存の対象ファイルを .vscode/ 以下にコピー
make pull
```

### ローカル設定ファイルの場所

- Linux: `~/.config/Code/User`
- macOS: `~/Library/Application\ Support/Code/User`
- Windows: `C:\Users\USERNAME\AppData\Roaming\Code\User`

## 拡張機能の管理

### 拡張機能関連のコマンド

```sh
# インストール済み拡張機能のリストを作成
make list/installed
# -> extensions/installed_extensions.txt が作成される

# インストール済み拡張機能との差分を確認
make diff/ext

# 基本的な拡張機能をインストール
make install/basic

# インストール済み拡張機能の一覧 extensions/extensions.txt を作成
make list

# extensions/extensions.txt を参照して拡張機能をインストール
make install

# .vscode/ 以下のフォルダ名を指定して拡張機能をインストール
make install e=markdown

# ファイルパスを指定して拡張機能をインストール
make install e=/path/to/extensions.json
make install e=/path/to/extensions.txt
```

### 拡張機能リストのファイル形式

- .txt と .json に対応

extensions.txt の例

```txt
alefragnani.Bookmarks
christian-kohler.path-intellisense
```

extensions.json の例

```json
{
  "recommendations": [
    "alefragnani.Bookmarks",
    "christian-kohler.path-intellisense"
  ],
  "unwantedRecommendations": []
}
```

※ JSON に `//` でコメントを入れないこと（後述）

#### 注意

インストール時に次のようなエラーが出た場合は JSON ファイルが不正。

```console
$ make install
parse error: Invalid numeric literal
```

よくある間違いは次のような形でコメントを入れてしまうこと。
本来的に JSON 形式はコメントを許容していない。

```json
{
  // See https://go.microsoft.com/fwlink/?LinkId=827846 to learn about workspace recommendations.
  // Extension identifier format: ${publisher}.${name}. Example: vscode.csharp

  // List of extensions which should be recommended for users of this workspace.
  "recommendations": [],
  // List of extensions recommended by VS Code that should not be recommended for users of this workspace.
  "unwantedRecommendations": []
}
```

この例は VS Code の機能で生成したデフォルトの extensions.json である。
そう、VS Code は JSON でのコメントを許している。
確かにコメントを付けられれば便利だ。それに対応してみようとあれこれ試みたが、残念ながら達せられなかった。

まぁ、コメントを入れたいときはたとえばこんなふうにしてみればいいんじゃない？

```json
{
  "//": "See https://go.microsoft.com/fwlink/?LinkId=827846 to learn about workspace recommendations.",
  "recommendations": []
}
```

### インストール済み拡張機能の場所

- Linux: `~/.vscode/extensions`
- macOS: `~/.vscode/extensions`
- Windows: `%USERPROFILE%\.vscode\extensions`

## ローカルでのみ適用したい設定

ここでは管理せず、ローカルでのみ適用したい設定は `settings.local.json` を作成してその中に記述する。

```sh
code ~/Library/Application\ Support/Code/User/settings.local.json
```
