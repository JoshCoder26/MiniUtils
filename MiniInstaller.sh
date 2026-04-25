#!/bin/bash
set -e
if [[ $EUID -ne 0 ]]; then
echo "You will now be asked for your password, this is needed for installing MiniUtils"
exec sudo bash "$0"
fi
apt update -qq
apt install -y -qq wget unzip
echo "Thank you for choosing for MiniUtils!"
echo "I hope you will like my programs"
cat <<EOF
Please note,
All of these programs were made by a 12 year old
And if you encounter any bugs, please contact me by commenting on the GitHub Repo
EOF
echo "looking for programs"
trap 'rm -rf /tmp/MiniInstaller' EXIT
mkdir -p /tmp/MiniInstaller
wget -q -O "/tmp/MiniInstaller/repo.zip" "https://github.com/JoshCoder26/MiniUtils/archive/main.zip"
unzip -q "/tmp/MiniInstaller/repo.zip" -d "/tmp/MiniInstaller"
for file in "/tmp/MiniInstaller/MiniUtils-main"/*; do
FILE="$(basename "$file")"
if [[ -d "$file" ]]; then
continue
fi
if [[ "$FILE" == "MiniInstaller.sh" || "$FILE" == "README.md" ]]; then
continue
fi
if ! diff "$file" "/usr/local/bin/$FILE" > /dev/null 2>&1 ; then
if [[ "$FILE" == "MiniUpdater" ]]; then
cp "$file" "/usr/local/bin/MiniUpdater"
chmod 555 "/usr/local/bin/MiniUpdater"
continue
fi
read -p "Do you want to install/update $FILE? (Y/N) " INPUT
if [[ ${INPUT,,} == "y" ]]; then
cp "$file" "/usr/local/bin/$FILE"
chmod 555 "/usr/local/bin/$FILE"
fi
fi
done
# read -p "Do you want to install MiniEditor? (Y/N)" INPUT
# if [[ "${INPUT,,}" == "y" ]]; then
# wget -q -O /usr/local/bin/MiniEditor https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniEditor
# chmod 555 /usr/local/bin/MiniEditor
# fi
# read -p "Do you want to install MiniMath? (Y/N)" INPUT
# if [[ "${INPUT,,}" == "y" ]]; then
# wget -q -O /usr/local/bin/MiniMath https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniMath
# chmod 555 /usr/local/bin/MiniMath
# fi
#read -p "Do you want to install MiniPass? (Y/N)" INPUT
# if [[ "${INPUT,,}" == "y" ]]; then
# wget -q -O /usr/local/bin/MiniPass https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniPass
# chmod 555 /usr/local/bin/MiniPass
# fi
# wget -q -O /usr/local/bin/MiniUpdater https://raw.githubusercontent.com/JoshCoder26/MiniUtils/main/MiniUpdater
# chmod 555 /usr/local/bin/MiniUpdater
echo "Successfully downloaded the MiniUtils library"
echo "Successfully set the correct permissions for running"
echo "Done!"
