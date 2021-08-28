CONFIG_FILES:=extensions.json keybindings.json settings.json
LOCAL_CONFIG_DIR:=~/Library/Application\ Support/Code/User

.PHONY: diff/cfg
diff/cfg:
	@for filename in ${CONFIG_FILES}; do \
		echo $$filename; \
		git diff .vscode/$$filename ${LOCAL_CONFIG_DIR}/$$filename; \
	done



.PHONY: pull
pull:
	@for filename in ${CONFIG_FILES}; do \
		echo $$filename; \
		cp -pR ${LOCAL_CONFIG_DIR}/$$filename .vscode/$$filename; \
	done


.PHONY: up
up:
	cp -pR .vscode/* ${LOCAL_CONFIG_DIR}
