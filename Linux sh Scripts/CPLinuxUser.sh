YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GREY='\033[0;37m'
RED='\033[0;31m'
DGREY='\033[1;30m'
GREEN='\033[0;32m'
WHITE='\033[1;37m'
BLANK='\033[0m'
printf "$YELLOW"
echo "                           /\                              "
echo "                          /  \                             "
echo "                         /    \                            " 
echo "                        /      \                           " 
echo "                       /        \                          " 
echo "                      /          \                         "
echo "                     /            \                        "
echo "                    /______________\                       "
echo "                   / \            / \                      "
echo "                  /   \          /   \                     "
echo "                 /     \        /     \                    "
echo "                /       \      /       \                   "
echo "               /         \    /         \                  "
echo "              /           \  /           \                 "
echo "             /             \/             \                "
echo "            /______________________________\               "
printf "$CYAN"
echo "                CyberPatriot 2018-2019                     "
printf "$BLANK" 
echo ""
echo ""
echo ""
printf "Please type the password you want used:"
read -s Pwd
until []; do
echo ""
printf "$WHITE"
awk -F':' '/\/home.*sh/ {print $1}' /etc/passwd;
printf "$BLANK"
echo -e ""$CYAN"This is in an infinite loop to stop it press ("$YELLOW"CTRL + C$CYAN)$BLANK"
echo -e ""$CYAN"What user do you want to change? ("$YELLOW"MUST BE EXACT CASING"$CYAN")$BLANK"
echo ""
read Username
echo ""
echo ""
sudo passwd $Username <<!
$Pwd
$Pwd
!
sleep 2
clear
done
