# Wait for initial setup to finish
waitForSetup

# Get the currently active user
getCurrentUser

user_home=$(getUsersHome $currentUser)

getFile $TMP_FOLDER/tunnelblick.dmg "https://tunnelblick.net/release/Tunnelblick_3.8.7a_build_5770.dmg"

mountDMG $TMP_FOLDER/tunnelblick.dmg

echo "Installing Tunnelblick.app"
cp -R /Volumes/sophos/Tunnelblick/Tunnelblick.app /Applications/

echo "Copying tblk files to $user_home/Library/Application Support/Tunnelblick/Configurations"
mkdir -p "$user_home/Library/Application Support/Tunnelblick/Configurations"
cp -R $RESOURCE_DIR/openvpn/*.tblk  "$user_home/Library/Application Support/Tunnelblick/Configurations/"
chown -hR "$currentUser":staff "$user_home/Library/Application Support/Tunnelblick"

echo "Opening Tunnelblick.app"
sleep 15
su $currentUser -c 'open -a "Tunnelblick"'
