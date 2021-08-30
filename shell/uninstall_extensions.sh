. shell/functions/uninstall.sh
. shell/functions/list_extensions.sh
. shell/functions/valid_filepath.sh

filepath=`valid_filepath $1`
ext_array=`list_extensions ${filepath}`
uninstall ${ext_array}
