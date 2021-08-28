if [ -z "$1" ]; then
  filepath=extensions/extensions.txt
else
  filepath=extensions/$1/extensions.txt
fi

echo "From $filepath\n"
extensions=$(cat $filepath)

for extension in $extensions; do
  echo "$extension ..."
  code --install-extension $extension
done
