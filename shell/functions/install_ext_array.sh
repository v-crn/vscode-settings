install_ext_array() {
    ext_array = $1
    for ext in ${ext_array[@]}; do
        code --install-extension $ext
        echo "\n"
    done
}
