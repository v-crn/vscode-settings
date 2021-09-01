# vscode-settings

Visual Studio Code (vscode) の設定ファイルを管理するリポジトリ

## 前提条件

- macOS
- git
- jq
- code

## 設定ファイルの管理

- extensions.json
  - 推奨拡張機能と非推奨拡張機能の設定
  - ワークスペース毎に設置する
- keybindings.json
  - キーバインディング
  - アクションとショートカットキーの組み合わせの設定
- settings.json
  - 全般的な設定

```sh
# 現在適用されている設定ファイルとの差分を確認
make diff/config

# .vscode 内の設定を適用
make apply

# 既に適用されているローカル設定ファイルを .vscode/ 以下にコピー
make pull
```

### ローカル設定ファイルの場所

- Linux: `~/.config/Code/User`
- macOS: `~/Library/Application\ Support/Code/User`
- Windows: `C:\Users\USERNAME\AppData\Roaming\Code\User`

## 拡張機能の管理

- `./vscode/*/extensions.json` または `./vscode/*/extensions.txt`
  - 拡張機能の一覧
  - 元から用意されているファイルではなく、自分で作成する必要がある

### 拡張機能関連のコマンド

```sh
# インストール済み拡張機能の一覧を作成
make list

# 基本的な拡張機能をインストール
make install/basic

# .vscode/ 以下のすべてのフォルダ内の extensions.json
# または extensions.txt を参照して拡張機能をインストール
make install/all

# .vscode/ 以下のフォルダ名を指定して拡張機能をインストール
make install e=markdown

# 任意の場所にあるファイルを指定して拡張機能をインストール
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

インストール時に次のようなエラーが出た場合、スクリプト内で関数に渡された JSON が不正であることを示している。

```console
$ make install
parse error: Invalid numeric literal
```

【よくある間違い】

次のような形でコメントを入れてしまうとエラーになる。
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

この例は VS Code の機能で生成したデフォルトの extensions.json である。VS Code は JSON でのコメントを許している。おそらく読み込み時に前処理をかけて取り除いているんだろう。確かにコメントを付けられるのは便利だ。

どうしてもコメントを入れたいときはたとえばこんなふうにしてみたらどうだろう？

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
