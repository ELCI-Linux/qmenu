#! /bin/bash




	input="cat /bin/qmenu/crypto_list.txt"



# Fetch the price using the CoinGecko API
curl -s "https://api.coingecko.com/api/v3/simple/price?ids=$input&vs_currencies=usd" | jq -r ".\"$input\".usd"

