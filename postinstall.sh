# Wait for initial setup to finish
waitForSetup

# Get the currently active user
getCurrentUser

getFile $TMP_FOLDER/tunnelblick.dmg "https://tunnelblick.net/release/Tunnelblick_3.8.7a_build_5770.dmg"

mountDMG $TMP_FOLDER/tunnelblick.dmg

echo "Installing Tunnelblick.app"
cp -R /Volumes/sophos/Tunnelblick/Tunnelblick.app /Applications/

echo "Copying ovpn files to /Applications/Tunnelblick.app/Contents/Resources/
cp $RESOURCE_DIR/openvpn/*.ovpn /Applications/Tunnelblick.app/Contents/Resources/

