uninstall() {
    ext_array = $1
    for ext in ${ext_array[@]}; do
        code --uninstall-extension $ext
        echo "\n"
    done
}
