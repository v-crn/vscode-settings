CONFIG_FILES:=extensions.json keybindings.json settings.json
DEFAULT_DIR:=~/Library/Application\ Support/Code/User
e:=""

.PHONY: diff
diff:
	@for filename in ${CONFIG_FILES}; do \
		echo $$filename; \
		git diff .vscode/$$filename ${DEFAULT_DIR}/$$filename; \
	done


.PHONY: install
install:
	filepath=extensions/${e}/extensions.txt
	sh shell/install_extensions.sh ${e}


.PHONY: install/basic
install/basic:
	sh shell/install_basic_extensions.sh ${e}


.PHONY: list
list:
	code --list-extensions > extensions/extensions.txt


.PHONY: up
up:
	cp -pR .vscode/* ${DEFAULT_DIR}
