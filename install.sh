#!/bin/bash

# تعريف المتغيرات الاساسية
APP_NAME="Google Keep Desktop"
ICON_NAME="google-keep-icon.png"
ICON_URL="https://upload.wikimedia.org/wikipedia/commons/e/e5/Google_Keep_icon_%282020%29.svg"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"

echo "بدء عملية تثبيت $APP_NAME..."

# انشاء المجلدات اذا لم تكن موجودة
mkdir -p "$ICON_DIR"
mkdir -p "$APP_DIR"

# تحميل الايقونة
echo "جاري تحميل الايقونة..."
curl -sL "$ICON_URL" -o "$ICON_DIR/$ICON_NAME"

# البحث عن المتصفح المتوفر
if command -v google-chrome &> /dev/null; then
    CHROME_BIN="google-chrome"
elif command -v brave-browser &> /dev/null; then
    CHROME_BIN="brave-browser"
elif command -v chromium &> /dev/null; then
    CHROME_BIN="chromium"
else
    echo "خطا: لم يتم العثور على متصفح يدعم وضع App. يرجى تثبيت Chrome او Brave اولا."
    exit 1
fi

# انشاء ملف الـ .desktop
cat <<EOT > "$APP_DIR/google-keep.desktop"
[Desktop Entry]
Version=1.0
Name=Google Keep
Comment=Keep notes and lists
Exec=$CHROME_BIN --app=https://keep.google.com --user-data-dir=\$HOME/.config/google-keep-desktop
Terminal=false
Type=Application
Icon=$ICON_DIR/$ICON_NAME
Categories=Office;Utility;
StartupWMClass=keep.google.com
EOT

chmod +x "$APP_DIR/google-keep.desktop"

echo "تم التثبيت بنجاح! يمكنك الان فتح Google Keep من قائمة التطبيقات."
