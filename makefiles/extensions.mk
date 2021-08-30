EXT_DIR:=extensions
DEFAULT_EXT_TXT:=${EXT_DIR}/extensions.txt
INSTALLED_EXT_TXT:=${EXT_DIR}/installed_extensions.txt
e:=""

.PHONY: list
list: ## インストール済み拡張機能の一覧を作成
	code --list-extensions > ${INSTALLED_EXT_TXT}


.PHONY: install
install: ## 任意のファイルパスを指定して、または .vscode/ 以下のフォルダ名を指定して拡張機能をインストール
	sh shell/install_extensions.sh ${e}


.PHONY: install/basic
install/basic: ## 基本的な拡張機能をインストール
	sh shell/install_basic_extensions.sh ${e}


.PHONY: install/all
install/all: ## .vscode/以下のすべてのフォルダ内の extensions.json または extensions.txt を参照して拡張機能をインストール
	sh shell/install_all_extensions.sh


.PHONY: uninstall
uninstall: ## 指定したフォルダまたは任意のファイルパスから拡張機能をアンインストール
	sh shell/uninstall_extensions.sh ${e}


.PHONY: uninstall/all
uninstall/all: ## 管理対象であるすべての拡張機能をアンインストール
	sh shell/uninstall_all_extensions.sh
