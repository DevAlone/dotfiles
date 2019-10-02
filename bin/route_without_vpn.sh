#!/usr/bin/env fish

set domains \
	pikabu.ru u.pikabu.ru api.pikabu.ru v.pikabu.ru


# 	vk.com

# 	ya.ru yandex.ru yandex.com metrika.yandex.ru mc.yandex.ru passport.yandex.ru clickhouse.yandex yadi.sk

set -x route_to_ip 192.168.0.1
# set -x route_to_ip 172.20.10.1

for domain in $domains
	echo domain is $domain
	for ip in (host $domain|egrep "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" -o)
		echo ip is $ip
		sudo route add $ip gw $route_to_ip
		# sudo route del $ip gw $route_to_ip
	end
end

