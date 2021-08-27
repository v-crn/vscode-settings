file=extensions.txt

.PHONY: extensions
extensions:
	code --list-extensions > extensions.txt


.PHONY: install
install:
	sh install_extensions.sh ${file}


.PHONY: settings
settings:
	cp -pR .vscode/* ~/Library/Application\ Support/Code/User
