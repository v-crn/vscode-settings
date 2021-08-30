CONFIG_FILES:=extensions.json keybindings.json settings.json
LOCAL_CONFIG_DIR:=~/Library/Application\ Support/Code/User

.PHONY: diff/config
diff/config:
	for filename in ${CONFIG_FILES}; do \
		echo $$filename; \
		git diff .vscode/$$filename ${LOCAL_CONFIG_DIR}/$$filename; \
	done



.PHONY: pull
pull:
	for filename in ${CONFIG_FILES}; do \
		echo $$filename; \
		cp -pR ${LOCAL_CONFIG_DIR}/$$filename .vscode/$$filename; \
	done


.PHONY: apply
apply:
	for filename in ${CONFIG_FILES}; do \
		cp -pR ${LOCAL_CONFIG_DIR}/$$filename ${LOCAL_CONFIG_DIR}/$$filename.bak; \
	done
	cp -pR .vscode/* ${LOCAL_CONFIG_DIR}
