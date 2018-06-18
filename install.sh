cp -a config/i3 ~/.config
cp -a config/polybar ~/.config
cp -a config/rofi ~/.config
cp config/compton.conf ~/.config
cp config/.extend.Xresources ~/
cp config/.Xresources ~/
cp config/.xinitrc ~/

sudo zypper in i3-gaps rofi compton i3-gaps-devel libcairo2 cairo-devel python2-cairo python2-cairo-devel cmake patterns-devel-base-devel_basis patterns-devel-C-C++-devel_C_C++ patterns-yast-x11_yast patterns-fonts-fonts patterns-fonts-fonts_opt patterns-base-enhanced_base patterns-base-x11 patterns-base-x11_opt libxcb-devel python xcb-proto-devel xcb-util-image-devel xcb-util-wm-devel xcb-util-xrm-devel rxvt-unicode nitrogen psmisc jsoncpp-devel libxcb-cursor0 alsa-devel libmpd-devel libcurl-devel wireless-tools libiw-devel libmpdclient-devel gcc gcc-cpp lxqt-sudo lxappearence

killall -q polybar

if [ ! -d "polybar" ]; then
  git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
else
  sudo rm -rf polybar/build
fi
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install

mkdir -p ~/Backdrops
cd ~/Backdrops
curl -O https://raw.githubusercontent.com/unix121/i3wm-themer/master/themes/Minimal/Minimal.png
nitrogen --set-zoom-fill ~/Backdrops/Minimal.png

git clone https://github.com/pop-os/icon-theme
cd icon-theme
sudo make install
sudo make post-install
