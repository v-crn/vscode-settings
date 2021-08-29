. shell/config.sh
. shell/functions/install.sh


valid_filepath()
{
    filepath="${DEFAULT_EXTENSIONS}"
    if [ -d "${VS_DIR}/$1" ]; then
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
