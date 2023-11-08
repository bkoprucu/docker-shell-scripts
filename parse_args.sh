function usage {
  echo -e "\nUsage $(basename $0) [-h] [-v version] [-n container-name] [-o volume_name] ...\n" >&2
}

args=${@}
while getopts 'v:n:o:' opt; do
  case "$opt" in
  v) # Set version
    version=$OPTARG
    args=${@:$OPTIND}
    ;;
  n) # Set container name
    container_name=$OPTARG
    args=${@:$OPTIND}
    ;;
  o) # Set volume name
    volume_name=$OPTARG
    args=${@:$OPTIND}
    ;;
#  h)
#    $(usage)
#    exit 1
#    ;;
  esac
done

#shift "$(($OPTIND -1))"

