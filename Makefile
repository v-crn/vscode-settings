e=""

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
	cp -pR .vscode/* ~/Library/Application\ Support/Code/User
