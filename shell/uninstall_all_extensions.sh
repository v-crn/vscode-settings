. shell/functions/install.sh
. shell/functions/list_extensions.sh
. shell/functions/valid_filepath.sh

ext_dirs=$(ls -d .vscode/*/)

for ext in ${ext_dirs[@]}; do
    if [ -f "${ext}extensions.json" ]; then
        filepath="${ext}extensions.json"
    elif [ -f "${ext}extensions.txt" ]; then
        filepath=${ext}extensions.txt
    else
        echo "extensions.json or extensions.txt was not found in ${ext}.\n"
        continue
    fi
    ext_array=$(list_extensions ${filepath})
    uninstall ${ext_array}
done
