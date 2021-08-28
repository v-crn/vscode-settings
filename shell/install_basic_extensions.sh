extensions=(
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

for ext in "${extensions[@]}"
do
    sh shell/install_extensions.sh ${ext}
done
