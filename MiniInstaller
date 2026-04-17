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
And if you encounter any bugs, please contact me by commenting on: https://scratch.mit.edu/users/JCH_Scratcher/
EOF
read -p "Do you want to install MiniEditor? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
cat <<'EOF' > /usr/local/bin/MiniEditor
#!/bin/bash
FILE="$1"
function MainLoop() {
    file="$1"
    while true; do
        sleep 5
        less "$file"
        echo "Choose one of the following actions and type the corresponding number"
        echo "1: Add line 2: Remove line 3: Edit line 4. Rename 5. Exit"
        read -p "1: Add line 2: Remove line 3: Edit line 4. Rename 5. Exit" SELECTION
        if [ "$SELECTION" = "1" ] ; then
            echo "Enter line number:"
            read -p "Enter line number:" LINENUM
            echo "Enter line contents:"
            read LINETEXT
            echo $(head -n "$LINENUM" "$file") "$LINETEXT" $(tail -n $(($(wc -l < "$file")-$(("$LINENUM"+1)))) "$file") > "$file"
        elif [ "$SELECTION" = "2" ] ; then
            echo "Enter line number:"
            read LINENUM
            echo $(head -n $(("$LINENUM"-1)) "$file") $(tail -n $(($(wc -l < "$file")-"$LINENUM")) "$file") > "$file"
        elif [ "$SELECTION" = "3" ] ; then
            echo "Enter line number:"
            read LINENUM
            echo "Enter line contents:"
            read LINETEXT
            echo $(head -n $(("$LINENUM"-1)) "$file") "$LINETEXT" $(tail -n $(($(wc -l < "$file")-"$LINENUM")) "$file") > "$file"
        elif [ "$SELECTION" = "4" ] ; then
            echo "Enter file name"
            read FILENAME
            mv "$file" "$FILENAME"
            file=$FILENAME
        elif [ "$SELECTION" = "5" ] ; then
            echo "Exiting"
            exit 0
        else
            echo "Invalid input"
        fi
    clear
    done
}

error() {
    CODE="$1"
    MSG="$2"
    echo "Error $CODE: $MSG" >&2
}
if [ -n "$FILE" ]; then
    if [ -f "$FILE" ]; then
        if [ -w "$FILE" ]; then
            MainLoop "$FILE"
            exit 0
        else
            error 001 "Do not have the required permissions to load"
        fi
    else
        echo "Creating file"
        touch "$FILE"
        MainLoop "$FILE"
        exit 0
    fi
else
    error 002 "No file specified"
fi
exit 1
EOF
chmod 555 /usr/local/bin/MiniEditor
fi
read -p "Do you want to install MiniMath? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
cat <<'EOF' > /usr/local/bin/MiniMath
#!/bin/bash
if (( "$#" < 3 )); then
echo "You have to input at least 3 arguments (./MiniMath 1 + 2 for example)"
exit 1
fi
if (( "$#" > 3 )); then
echo "The current version of MiniMath doesn't support over 1 calculation at the time"
exit 1
fi
G1=${1/./}
TV=${1##*.}
[[ "$TV" == "$1" ]] && AC1=0 || AC1=${#TV}
G2=${3/./}
TV=${3##*.}
[[ "$TV" == "$3" ]] && AC2=0 || AC2=${#TV}
if [[ "$2" == "*" ]]; then
MAC=$((AC1 + AC2 ))
else
(( AC1 > AC2 )) && MAC=$AC1 || MAC=$AC2
TV=$((MAC -AC1))
for ((i=0; i<TV; i++)); do G1="${G1}0"; done
TV=$((MAC -AC2))
for ((i=0; i<TV; i++)); do G2="${G2}0"; done
fi
UK=$((G1 $2 G2))
if (( MAC == 0 )); then
    echo "$UK"
    exit 0
fi
PD="0000000000"
[[ $UK == -* ]] && TP="-${PD}${UK#-}" || TP="${PD}${UK}"
VR=${TP:0:${#TP}-MAC}
AR=${TP: -MAC}
OP=$(echo "$VR.$AR" | sed 's/0*\([0-9-][0-9]*\.\)/\1/')
[[ "$OP" == .* ]] && OP="0$OP"
[[ "$OP" == -.* ]] && OP="-0${OP#-}"
[[ -z "$OP" || "$OP" == "." ]] && OP="0"
echo "${OP/.-/-0.}"
exit 0
EOF
chmod 555 /usr/local/bin/MiniMath
fi
read -p "Do you want to install MiniPass? (Y/N)" INPUT
if [[ "${INPUT,,}" == "y" ]]; then
cat <<'EOF'> /usr/local/bin/MiniPass
#!/bin/bash
CMD="${1,,}"
if [[ ! -d "$HOME/.MiniPass" || "$CMD" == "full_reset" ]]; then
rm -rf ".MiniPass"
echo "Welcome! This computer doesn't contain any MiniPass password files, so lets get started!"
read -sp "Enter a password: " PW
echo
echo "Creating file..."
mkdir "$HOME/.MiniPass"
echo "Done!"
echo "$PW" > "$HOME/.MiniPass/.MiniPass.txt"
gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -c "$HOME/.MiniPass/.MiniPass.txt"
rm "$HOME/.MiniPass/.MiniPass.txt"
chmod 600 "$HOME/.MiniPass/.MiniPass.txt.gpg"
fi
if [[ "$CMD" == "password_reset" ]]; then
read -sp "Enter master password: " PW
echo
if gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -d "$HOME/.MiniPass/.MiniPass.txt.gpg" > /dev/null 2>&1; then
gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -d "$HOME/.MiniPass/.MiniPass.txt.gpg" > "$HOME/.MiniPass/.MiniPass.txt"
read -sp "Enter new password: " PW
echo
gpg --batch --quiet --no-tty --yes --passphrase "$PW" --pinentry-mode loopback -c "$HOME/.MiniPass/.MiniPass.txt"
rm "$HOME/.MiniPass/.MiniPass.txt"
else
echo
echo "Password is incorrect"
fi
fi
if [[ "$CMD" == "add" || "$CMD" == "edit" ]]; then
if [[ ! -z "$2" ]]; then
NN="$2"
else
read -p "Enter item name: " NN
fi
read -p "Enter new item username: " NU
read -sp "Enter new item password: " NP
echo
read -sp "Enter master password: " PW
echo
if gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -d "$HOME/.MiniPass/.MiniPass.txt.gpg" > /dev/null 2>&1; then
echo -e "$NU\n$NP" > "$HOME/.MiniPass/.$NN.txt"
gpg --batch --quiet --no-tty --yes --passphrase "$PW" --pinentry-mode loopback -c "$HOME/.MiniPass/.$NN.txt"
rm "$HOME/.MiniPass/.$NN.txt"
else
echo "Password is incorrect"
fi
fi
if [[ "$CMD" == "get" ]]; then
if [[ -z "$2" ]]; then
read -p "Enter name of entry you want to fetch: " IN
else
IN="$2"
fi
read -sp "Enter master password: " PW
echo
if gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -d "$HOME/.MiniPass/.$IN.txt.gpg" > /dev/null 2>&1; then
{
  read -r IU
  read -r IP
} < <(gpg --batch --quiet --no-tty --passphrase "$PW" --pinentry-mode loopback -d "$HOME/.MiniPass/.$IN.txt.gpg")
echo "Username: $IU"
echo "Password: $IP"
else
echo "Either the item name or the password is incorrect."
fi
fi
if [[ "$CMD" == "list" ]]; then
echo "All current entries:"
for file in "$HOME/.MiniPass/.*.txt.gpg"; do
name=$(basename "$file")
name="${name#.}"
name="${name%.txt.gpg}"
[[ "$name" == "MiniPass" ]] && continue
echo "$name"
done
fi
exit 0
EOF
chmod 555 /usr/local/bin/MiniPass
fi
echo "Successfully downloaded the MiniUtils library"
echo "Succesfully set the correct permissions for running"
echo "Done!"
rm -f $(which $0)
