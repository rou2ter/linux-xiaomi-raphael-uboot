#!/bin/bash
set -e

echo "[$(date +'%Y-%m-%d %H:%M:%S')] [17] 🛡️ Cài đặt Kali NetHunter chroot"

chroot rootdir apt-get install -y proot-distro curl

cat > rootdir/usr/local/bin/install-kali-nethunter << 'EOF'
#!/bin/bash
proot-distro install kali
proot-distro login kali -- apt update && apt install -y kali-linux-headless metasploit-framework
echo "Kali NetHunter đã được cài vào proot-distro!"
EOF

chmod +x rootdir/usr/local/bin/install-kali-nethunter
