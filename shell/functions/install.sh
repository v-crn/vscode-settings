function install()
{
    # $1: ext_array
    for ext in $1; do
        code --install-extension $ext
        echo "\n"
    done
}
