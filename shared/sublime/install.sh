#!/bin/bash

echo 'Installing Sublime Text...'

if [ -f sublime.dmg ]; then
  rm sublime.dmg
fi

sublime_settings_path="$HOME/Library/Application Support/Sublime Text 3"
sublime_color_theme_path="${sublime_settings_path}/Packages/Colorsublime-Themes"

echo -n 'Downloading...'
curl "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg" -o "sublime.dmg" >/dev/null 2>&1
echo -e "\033[34;32mDone.\033[0m"

echo -n 'Installing...'
hdiutil attach sublime.dmg > /dev/null
cp -r "/Volumes/Sublime Text/Sublime Text.app" "/Applications/Sublime Text.app"
hdiutil detach "/Volumes/Sublime Text" > /dev/null
rm sublime.dmg
echo -e "\033[34;32mDone.\033[0m"

echo -n 'Setting up symlink...'
sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin
open "/Applications/Sublime Text.app" && sleep 3 && killall "Sublime Text"
echo -e "\033[34;32mDone.\033[0m"

echo -n 'Installing Package Control...'
curl "https://packagecontrol.io/Package%20Control.sublime-package" -o "${sublime_settings_path}/Installed Packages/Package Control.sublime-package" >/dev/null 2>&1
echo -e "\033[34;32mDone.\033[0m"

echo -n 'Installing Solarized color scheme...'
mkdir "${sublime_color_theme_path}"
curl "http://flatironschool.s3.amazonaws.com/curriculum/resources/environment/themes/Solarized%20Flatiron.zip" -o "${sublime_color_theme_path}/Solarized Flatiron.zip" >/dev/null 2>&1
tar -zxvf "${sublime_color_theme_path}/Solarized Flatiron.zip"
rm "${sublime_settings_path}/Solarized Flatiron.zip" "${sublime_settings_path}/Solarized Dark (Flatiron).terminal" "${sublime_settings_path}/Solarized Light (Flatiron).terminal"
echo -e "\033[34;32mDone.\033[0m"
