EXT_DIR:=extensions
DEFAULT_EXT_TXT:=${EXT_DIR}/extensions.txt
INSTALLED_EXT_TXT:=${EXT_DIR}/installed_extensions.txt
e:=""

.PHONY: list
list:
	code --list-extensions > ${INSTALLED_EXT_TXT}


.PHONY: install
install:
	sh shell/install_extensions.sh ${e}


.PHONY: install/basic
install/basic:
	sh shell/install_basic_extensions.sh ${e}


.PHONY: install
install/all:
	sh shell/install_all_extensions.sh


.PHONY: uninstall
uninstall:
	sh shell/uninstall_extensions.sh ${e}


.PHONY: uninstall
uninstall/all:
	sh shell/uninstall_all_extensions.sh
