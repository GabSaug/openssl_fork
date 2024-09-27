if ! gcc  $(cat /etc/gcc.opt) -c -I. -Iinclude -Iapps/include  -fPIC -pthread -m64 -Wa,--noexecstack $3 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSLDIR="\"/home/gab/openssl/build/ssl\"" -DENGINESDIR="\"/home/gab/openssl/build/lib64/engines-3\"" -DMODULESDIR="\"/home/gab/openssl/build/lib64/ossl-modules\"" -DOPENSSL_BUILDING_OPENSSL -DNDEBUG  -MMD -MF apps/lib/libapps-lib-apps_opt_printf.d.tmp -MT apps/lib/libapps-lib-apps_opt_printf.o -c -o $2 $1 ; then
	echo "error make to object openssl"
	exit 1
fi
