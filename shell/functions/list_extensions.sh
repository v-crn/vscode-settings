list_extensions() {
    # $1: filepath
    file_extension=$(echo $1 | sed 's/^.*\.\([^\.]*\)$/\1/')
    if [ ${file_extension} == "json" ]; then
        ext_array=$(cat $1 | jq -r '.recommendations[]')
    elif [ ${file_extension} == "txt" ]; then
        ext_array=$(cat $1)
    else
        echo "Invalid File Extension: $1"
        echo "The file extension must be '.json' or '.txt'.\n"
        return 1
    fi
    echo ${ext_array}
}
