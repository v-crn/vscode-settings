e=""
DEFAULT_DIR=~/Library/Application\ Support/Code/User

.PHONY: list
list:
	code --list-extensions > extensions/extensions.txt


.PHONY: install
install:
	filepath=extensions/${e}/extensions.txt
	sh install_extensions.sh ${e}


.PHONY: install_basic
install_basic:
	sh install_basic_extensions.sh ${e}


.PHONY: up
up:
	cp -pR .vscode/* ${DEFAULT_DIR}


.PHONY: diff
diff:
	git diff .vscode/settings.json ${DEFAULT_DIR}/settings.json
