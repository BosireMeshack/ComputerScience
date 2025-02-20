case "$1" in
    -g)
        echo "Hello! Welcome to the script."
        ;;
    -l)
        echo "Listing the content of the current directory:"
        ls
        ;;
    -w)
        echo "Logged-in users:"
        who
        ;;

    -?)
        echo "Help: Available parameters"
        echo "-g: Greeting text"
        echo "-l: List the content of your directory"
        echo "-w: List logged-in users"
        echo "-?: Display this help message"
        ;;
    *)
        echo "Unrecognized parameter. Use -? for help."
        exit 1
        ;;
esac

   