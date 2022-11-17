#!/bin/bash

# Change to fit your username and path of your backup folder.

username=$(whoami)
backup_folder="/home/$username/Config_Backup"
USB="/run/media/sussy/KINGSTON"
# removes any whitespace and : so it can be used as a name
date=$(date | tr ' ' '-' | tr ':' '-')

# Here are the paths of the files you want to back up.
echo "Backuping configs.."
cp -ru /home/$username/.local/share/openttd/content_download/ $backup_folder
cp -ru /home/$username/.config/audacious $backup_folder
cp -ru /home/$username/.local/share/openttd/save/ $backup_folder
cp -ru /home/$username/.config/xfce4 $backup_folder
cp -ru /home/$username/.config/Thunar $backup_folder
cp -ru /home/$username/.var/app/io.mpv.Mpv/config/mpv/ $backup_folder
cp -ru /home/$username/Apps/Scripts/ $backup_folder
echo "..almost there.."
cp -ru /home/$username/.config/GIMP/ $backup_folder
cp -ru /home/$username/.config/qBittorrent/ $backup_folder
cp -ru /home/$username/.var/app/org.shotcut.Shotcut/ $backup_folder
cp -ru /home/$username/.minecraft/options.txt $backup_folder
echo "...I promise it will take just a moment.."
cp -ru /home/$username/.librewolf/ $backup_folder
cp -ru /home/$username/.config/FreeTube/ $backup_folder
# Kdenlive configs
cp -ru /home/$username/.config/kdenliverc $backup_folder
cp -ru /home/$username/.config/kdenlive-layoutsrc $backup_folder
cp -ru /home/$username/.config/kdenlive-appimagerc $backup_folder
cp -ru "/home/$username/.steam/debian-installation/steamapps/common/Scarlet Hollow Episode 1/game/saves/" $backup_folder/Scarlet_Hollow/
cp -ru /home/$username/testfol3 $backup_folder

filename=Config-Backup-$date.tar.gz

echo "Done! Want to save this into a USB? [y/n]"
read choice
if [ "$choice" == "y" ];
then
    tar -czvf $filename /home/$username/Config_Backup/
    cp $filename $USB
    echo "Done. You can press ctrl + c or the window will close automatically in 2 minutes."
else
    echo "As you wish. I saved your configs locally to $backup_folder. You can close this window by pressing ctrl + c."
fi

# this is here so the window doesn't close
sleep 169

