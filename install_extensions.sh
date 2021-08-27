if [ -z "$1" ]; then
  filepath=extensions.txt
else
    filepath=$1
fi

echo "From $filepath\n"
extensions=$(cat $filepath)

for extension in $extensions; do
    echo "$extension ..."
    code --install-extension $extension
done
