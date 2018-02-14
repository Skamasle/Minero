#!/bin/bash
log=/root/logs/mineros.log
del () {
if [ -e $1 ]; then
	> $1
fi
}
check () {
/bin/ps aux | grep "/tmp/php" | grep -E "[[:alnum:]]_[[:alnum:]]" | awk '{ print $1, $2, $11 }' |while read user pid arch
do
	echo "User: $user  Minando" >> $log
	kill -9 $pid
	arch=$(echo $arch |awk '{print $1}')
	del $arch
done
}

if /bin/ps aux | grep "/tmp/php"; then
	check
fi

