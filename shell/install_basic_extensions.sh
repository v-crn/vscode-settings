. shell/functions/install.sh
. shell/functions/list_extensions.sh
. shell/functions/valid_filepath.sh


EXTENSIONS=(
    "emoji"
    "git"
    "json"
    "markdown"
    "shell"
    "toml"
    "vscode"
    "web"
    "xml"
    "yaml"
)

filepath=`valid_filepath ${EXTENSIONS}`
ext_array=`list_extensions ${filepath}`
install ${ext_array}
