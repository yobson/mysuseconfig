sudo zypper refresh
sudo zypper in i3-gaps rofi compton i3-gaps-devel libcairo2 cairo-devel \
    python2-cairo python2-cairo-devel cmake patterns-devel-base-devel_basis \
    patterns-devel-C-C++-devel_C_C++ patterns-yast-x11_yast patterns-fonts-fonts \
    patterns-fonts-fonts_opt patterns-base-enhanced_base patterns-base-x11 \
    patterns-base-x11_opt libxcb-devel python xcb-proto-devel xcb-util-image-devel \
    xcb-util-wm-devel xcb-util-xrm-devel rxvt-unicode nitrogen psmisc jsoncpp-devel \
    libxcb-cursor0 alsa-devel libmpd-devel libcurl-devel wireless-tools libiw-devel \
    libmpdclient-devel gcc gcc-cpp lxqt-sudo lxappearence gnu_parallel dunst

cp -a config/* ~/.config/.

killall -q polybar

mkdir -p ~/gits
pushd ~/gits

if [ ! -d "polybar" ]; then
  git clone --recursive https://github.com/jaagr/polybar
else
  sudo rm -rf polybar/build
fi
mkdir polybar/build
pushd polybar/build
cmake ..
sudo make install
popd

[[ ! -d "dunst" ]] && git clone https://github.com/dunst-project/dunst.git
pushd dunst
make dunstify -j
cp -vs $(pwd)/dunstify ~/.local/bin/
popd

popd
