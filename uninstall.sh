#!/bin/bash

APP_NAME="Google Keep Desktop"
APP_DIR="$HOME/.local/share/applications"
ICON_DIR="$HOME/.local/share/icons"
CONFIG_DIR="$HOME/.config/google-keep-desktop"

echo "جاري حذف $APP_NAME..."

# حذف ملف الـ .desktop
rm -f "$APP_DIR/google-keep.desktop"

# حذف الايقونة
rm -f "$ICON_DIR/google-keep-icon.png"

# سؤال المستخدم اذا كان يريد حذف البيانات والاعدادات
read -p "هل تريد حذف بيانات المستخدم واعدادات تسجيل الدخول ايضا؟ (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm -rf "$CONFIG_DIR"
    echo "تم حذف بيانات المستخدم."
fi

echo "تمت عملية الحذف بنجاح."
 
 
