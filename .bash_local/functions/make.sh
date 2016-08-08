function make()
{
    ENVMAKE=$(which make)

    echo "count is $#, envmake=$ENVMAKE"

    if [ "$#" -eq "1" ]
    then
        echo "arg1 is $1"
        if [ "$1" ==  "test" ]
        then
            $ENVMAKE && ctest -V
            return $?
        fi
    fi

    $ENVMAKE
}

