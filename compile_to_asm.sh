opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g")  -fno-inline -Wno-error -finline-limit=2"
if ! gcc -S -masm=intel -I. -Iinclude -Iapps/include  -fPIC -pthread -m64 -Wa,--noexecstack "$1" -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSLDIR="\"/home/gab/openssl/build/ssl\"" -DENGINESDIR="\"/home/gab/openssl/build/lib64/engines-3\"" -DMODULESDIR="\"/home/gab/openssl/build/lib64/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL -DNDEBUG  -MMD -MF apps/lib/libapps-lib-apps_opt_printf.d.tmp -MT apps/lib/libapps-lib-apps_opt_printf.o -o "$2" $opt ; then
	echo "error make to asm openssl"
	exit 1
fi
