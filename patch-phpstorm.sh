#!/usr/bin/env bash

#set -x

pathtojar="plugins/php/lib/php.jar"
pathinjar="com/jetbrains/php/lang/psi/stubs/data"

if [ "$1" == "" ] || [ ! -f "$1/$pathtojar" ]; then
    echo -e "Error: you should specify PhpStorm install dir" >&2
    echo -e "Usage:\n\t$(basename $0) /path/to/phpstorm/install/dir" >&2
    exit 1
fi

if [ ! -f "$1/$pathtojar" ]; then
    echo -e "Error: $1 is not PhpStorm install dir" >&2
    echo -e "Usage:\n\t$(basename $0) /path/to/phpstorm/install/dir" >&2
    exit 1
fi

echo -n 'Patching PhpStorm ... '

tmpdir=$(mktemp -d --tmpdir=/tmp)
mkdir -p $tmpdir/$pathinjar || exit 1
cp zmq.php $tmpdir/$pathinjar || exit 1
cp $1/$pathtojar $tmpdir || exit 1
pushd $tmpdir > /dev/null || exit 1
zip -qg $(basename $pathtojar) $pathinjar/zmq.php || exit 1
popd > /dev/null || exit 1
cp -f $1/$pathtojar $1/$pathtojar.bak || exit 1
mv $tmpdir/$(basename $pathtojar) $1/$pathtojar || exit 1
rm -rf $tmpdir || exit 1

echo 'OK'