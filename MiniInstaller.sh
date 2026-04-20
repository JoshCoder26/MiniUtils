#!/bin/bash
if [[ $EUID -ne 0 ]]; then
echo "You will now be asked for your password, this is needed for installing MiniUtils"
sudo $0
exit 0
fi
echo "Thank you for choosing for MiniUtils!"
echo "I hope you will like my programs"
cat <<EOF
Please note,
All of these programs were made by a 12 year old
And if you encounter any bugs, please contact me by commenting on the GitHub Repo
EOF
read -p "Do you want to install MiniEditor? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
wget -O /usr/local/bin/MiniEditor https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniEditor
chmod 555 /usr/local/bin/MiniEditor
fi
read -p "Do you want to install MiniMath? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
wget -O /usr/local/bin/MiniMath https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniMath
chmod 555 /usr/local/bin/MiniMath
fi
read -p "Do you want to install MiniPass? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
wget -O /usr/local/bin/MiniPass https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniPass
chmod 555 /usr/local/bin/MiniPass
fi
echo "Successfully downloaded the MiniUtils library"
echo "Succesfully set the correct permissions for running"
echo "Done!"
rm -f $(which $0)
