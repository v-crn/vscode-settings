echo "Installing fonts ..."
# curl -OL https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip
curl -OL https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_without_emoji.zip
unzip Cica_v5.0.2_without_emoji.zip -d tmp
mv tmp/*.ttf ~/Library/Fonts/
echo "Done."
