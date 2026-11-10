bash
#!/bin/bash
pkg update -y
pkg install -y python mpv ffmpeg toilet fzf yt-dlp termux-api git
termux-setup-storage
mkdir -p ~/storage/shared/Music
cat > ~/play.sh << 'PLAYEOF'
#!/bin/bash
cd ~/storage/shared/Music || exit
echo "VIBEX choltase - gaan gulo ekhane rakho"
ls -1
PLAYEOF
chmod +x ~/play.sh
echo "VIBEX DONE - ebar ./play.sh mar"
