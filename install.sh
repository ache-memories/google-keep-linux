#!/bin/bash
APP_NAME="Google Keep"
EXEC_NAME="google-keep"
INSTALL_DIR="$HOME/.local/bin"
DESKTOP_DIR="$HOME/.local/share/applications"
ICON_URL="https://www.gstatic.com/images/branding/product/2x/keep_96dp.png"
ICON_PATH="$HOME/.local/share/icons/google-keep.png"

echo "🚀 Installing Google Keep Desktop..."
mkdir -p "$INSTALL_DIR" "$DESKTOP_DIR" "$(dirname "$ICON_PATH")"
curl -s -L "$ICON_URL" -o "$ICON_PATH"

cat << INNER_EOF > "$INSTALL_DIR/$EXEC_NAME"
#!/bin/bash
zenity --browser --url="https://keep.google.com/" --title="Google Keep" --width=1000 --height=800
INNER_EOF

chmod +x "$INSTALL_DIR/$EXEC_NAME"

cat << INNER_EOF > "$DESKTOP_DIR/$EXEC_NAME.desktop"
[Desktop Entry]
Version=1.0
Type=Application
Name=$APP_NAME
Exec="$INSTALL_DIR/$EXEC_NAME"
Icon=$ICON_PATH
Terminal=false
Categories=Office;Utility;
INNER_EOF

echo "✅ Done! Find it in your apps menu."
