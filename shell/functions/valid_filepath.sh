. shell/config.sh


valid_filepath()
{
    if [ -z $1 ]; then
        echo "Error: Input arg is null."
        return 1
    elif [ -d "${VS_DIR}/$1" ]; then
        # "${VS_DIR}/$1" ディレクトリが存在する場合
        filepath="${VS_DIR}/$1/extensions.json"

        if [ ! -f "${filepath}" ]; then
            # "${VS_DIR}/$1/extensions.json" が存在しない場合
            filepath="${VS_DIR}/$1/extensions.txt"
        fi
    elif [ -f "$1" ]; then
        # "$1" がファイルパスとして存在する場合
        filepath=$1
    else
        echo "FileNotFoundError"
        echo "Your input argument '$1' must be a directory in '${VS_DIR}' or a file path.\n"
        return 1
    fi
    echo ${filepath}
}
