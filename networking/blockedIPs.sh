sudo iptables -L INPUT -v -n | egrep "DROP[[:space:]]+all" | sed -n 's/^.* \([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\) .*$/\1/p' | sort | uniq
