bash
#!/bin/bash
pkg update -y
pkg install -y python mpv ffmpeg toilet fzf yt-dlp termux-api git
termux-setup-storage
mkdir -p ~/storage/shared/Music
cat > ~/play.sh << 'EOF'
#!/bin/bash
cd ~/storage/shared/Music || exit
clear
toilet -f mono12 "VIBEX"
echo "🎵 Offline Music + Lyrics 🎵"
echo ""
echo "[1] Sob gaan play"
echo "[2] Shuffle play"
echo "[3] Gaan beche play"
echo "[4] Loop e chalao"
echo "[5] Nam likhe DOWNLOAD + Lyrics"
echo "[0] Exit"
echo ""
read -p "Konta chalabi? " ch
case $ch in
  1) for f in *.mp3 *.m4a *.webm; do [ -e "$f" ] || continue; mpv --no-video "$f"; done ;;
  2) for f in $(ls *.mp3 *.m4a *.webm 2>/dev/null | shuf); do mpv --no-video "$f"; done ;;
  3) FILE=$(ls -1 *.mp3 *.m4a *.webm 2>/dev/null | fzf --prompt="Gaan khujo > "); [ -n "$FILE" ] && mpv --no-video "$FILE" ;;
  4) while true; do for f in *.mp3 *.m4a *.webm; do [ -e "$f" ] || continue; mpv --no-video "$f"; done; done ;;
  5) read -p "Gaan er nam likh: " song; yt-dlp -x --audio-format mp3 --audio-quality 0 -o "%(title)s.%(ext)s" "ytsearch1:$song"; echo "Download DONE";;
  0) exit ;;
esac
EOF
chmod +x ~/play.sh
echo "VIBEX INSTALL DONE - ebar ./play.sh mar"
