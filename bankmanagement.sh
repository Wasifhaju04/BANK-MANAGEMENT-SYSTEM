function MainMenu() {
echo "_________________________________________________________________"
echo " Welcome to Banking Application"
echo "_________________________________________________________________"
echo "1. Open New Account"
echo "2. Login"
echo "3. Exit Application"
echo "_________________________________________________________________"
read choice
case $choice in
"1") Open_New_Account
;;
"2") Login
;;
"3") kill 0 $$
;;
*) echo "Invalid Choice..!"
MainMenu
esac
}
function Open_New_Account() {
echo "Enter your Name"
read name
echo "Enter your Pan Card No."
read pan_no
echo ""
echo "Good! Your Details are Verified!"
echo "Rs. 1000 deposited as Initial Opening Balance"
let balance="1000"
sleep 5;
let acc="$RANDOM"
echo "_________________________________________________________________"
echo "Your Account no. is " $acc
let paswd="$RANDOM"
echo "Your Secret Pin is " $paswd
sleep 5;
Login
}
function Login() {
echo "_________________________________________________________________"
echo " XYZ Bank Login Portal"
echo "_________________________________________________________________"
echo "Enter your Account no."
read response1
echo "Enter your Secret Pin"
read response2
If [[ $response1 == "$acc" && $response2 == "$paswd" ]]
then
echo "Login Successful...!"
sleep 5;
Menu
elif [ $response1 -ne "$acc" ]
then
echo "**Invalid Account No.**"
sleep 5;
MainMenu
else
echo "**Invalid Pin**"
sleep 5;
MainMenu
fi
}
function Menu() {
echo "_________________________________________________________________"
echo " **MENU**"
echo "_________________________________________________________________"
echo ""Press 1"" - "For Balance Enquiry"
echo ""Press 2"" - "To Deposit Cash"
echo ""Press 3"" - "To Withdraw Cash"
echo ""Press 4"" - "Main Menu"
echo "_________________________________________________________________"
read option
case $option in
"1") Balance_Enquiry
;;
"2") Deposit_Money
;;
"3") Withdraw_Money
;;
"4") MainMenu
;;
*) echo "Invalid Choice..!"
Menu
esac
}
echo""
function Balance_Enquiry() {
echo "Your Available Balance is Rs. "$balance
echo ""
sleep 5;
Menu
}
function Deposit_Money() {
echo " Deposits"
echo "_________________________________________________________________"
echo "Enter the amount you want to Deposit:"
read dep_amt
echo ""
echo "Rs. $dep_amt Deposited Successfully in your Account."
echo ""
let balance=balance+$dep_amt
echo "Your Available Balance is Rs. "$balance
echo ""
sleep 5;
Menu
}
function Withdraw_Money () {
echo " Withdrawls"
echo "_________________________________________________________________"
echo "Enter the amount you want to Withdraw:"
read wdrw_amt
echo ""
if [ $wdrw_amt -lt $balance ]
then
echo "Rs. $wdrw_amt Withdrawn Successfully from your Account."
echo ""
let balance=$balance-$wdrw_amt
echo "Remaining Balance is Rs. "$balance
else
echo "**Low Balance !!**"
echo "Please enter lesser Amount."
fi
echo ""
sleep 5;
Menu
}
MainMenu