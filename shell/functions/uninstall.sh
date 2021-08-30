uninstall()
{
    # $1: ext_array
    for ext in $1; do
        code --uninstall-extension $ext
        echo "\n"
    done
}
