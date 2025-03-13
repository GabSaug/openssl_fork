rm apps/openssl build/bin/openssl
mkdir -p build/bin
make clean
opt="$(echo $1 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -Wno-error -finline-limit=2"
make EXTRA_CFLAGS="$opt" -j -n > log_make.txt
if ! make EXTRA_CFLAGS="$opt" -j; then
	echo "error make install"
	exit 1
fi
if ! cp apps/openssl build/bin/openssl; then
	exit 1
fi
