EXT_DIR:=extensions
DEFAULT_EXT:=${EXT_DIR}/extensions.txt
INSTALLED_EXT:=${EXT_DIR}/installed_extensions.txt
e:=""

.PHONY: diff/ext
diff/ext: list
	git diff ${DEFAULT_EXT} ${INSTALLED_EXT}


.PHONY: install
install:
	sh shell/install_extensions.sh ${e}


.PHONY: install/basic
install/basic:
	sh shell/install_basic_extensions.sh ${e}


.PHONY: list
list:
	code --list-extensions > extensions/installed_extensions.txt
