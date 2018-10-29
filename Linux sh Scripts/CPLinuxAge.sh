YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
BLANK='\033[0m'
printf "$YELLOW WARNING: PLEASE RUN THIS LAST, IF YOU WANT TO RUN NOW HIT $CYAN'ENTER'$YELLOW IF YOU WANT   TO WAIT PLEASE CANCEL THIS SCRIPT WITH $CYAN'CTRL+C'$YELLOW CONTINUING WITH THIS SCRIPT     WILL REQUIRE YOU TO MAKE A NEW PASSWORD ALMOST INSTANTLY! $BLANK"
read -p ""
printf ""$YELLOW"Are you sure?$BLANK"
read -p ""
sudo echo ""
echo ""
printf "$CYAN creating the password policy $BLANK"
echo ""
echo ""
sudo sed -i '/sha512/s/$/ minlen=10 remember=5 retry=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/common-password
echo ""
echo -e "Set "$YELLOW"MINIMUM PASSWORD LENGTH$BLANK to 10"
echo ""
sleep 1
echo -e "Set "$YELLOW"REMEMBERED PASSWORD HISTORY$BLANK to 5"
echo ""
sleep 1
echo -e "Set "$YELLOW"ACCOUNT LOCKOUT THRESHOLD$BLANK to 3"
echo ""
sleep 1
echo -e "Set "$YELLOW"1 UPPERCASE LETTER$BLANK Required"
echo ""
sleep 1
echo -e "Set "$YELLOW"1 LOWERCASE LETTER$BLANK Required"
echo ""
sleep 1
echo -e "Set "$YELLOW"ATLEAST 1 DIGIT$BLANK Required"
echo ""
sleep 1
echo -e "Set "$YELLOW"1 SPECIAL CHARACTER$BLANK Required"
echo ""
sleep 1
echo ""
printf "$RED Setting up the Max and Min password ages $BLANK"
echo ""
echo ""
for i in $(awk -F':' '/\/home.*sh/ { print $1}' /etc/passwd); do sudo chage -m 3 -M 30 -W 7 $i; done
echo -e "Set "$YELLOW"MAX_PASS_DAYS$BLANK to 30"
echo ""
sleep 1
echo -e "Set "$YELLOW"MIN_PASS_DAYS$BLANK to 3"
echo ""
sleep 1
echo -e "Set "$YELLOW"MAX_WARN_AGE$BLANK to 7"
echo ""
sleep 1



