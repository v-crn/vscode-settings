extensions=(
    "emoji"
    "git"
    "json"
    "markdown"
    "shell"
    "toml"
    "vscode"
    "web"
)

for ext in "${extensions[@]}"
do
    filepath="extensions/$ext/extensions.txt"
    sh install_extensions.sh ${filepath}
done
