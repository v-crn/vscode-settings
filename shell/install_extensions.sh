. shell/functions/install_ext_array.sh
. shell/functions/list_extensions.sh
. shell/functions/valid_filepath.sh

filepath=$(valid_filepath $1)
ext_array=$(list_extensions ${filepath})
echo "recommendations: $ext_array"

install_ext_array $ext_array
