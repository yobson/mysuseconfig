cp -r i3 ~/.config .
cp -r polybar ~/.config .
cp compton.conf ~/.config .

sudo zypper in i3-gaps rofi compton i3-gaps-devel libcairo2 cairo-devel python2-cairo python2-cairo-devel cmake patterns-devel-base-devel_basis patterns-devel-C-C++-devel_C_C++ patterns-yast-x11_yast patterns-fonts-fonts patterns-fonts-fonts_opt patterns-base-enhanced_base patterns-base-x11 patterns-base-x11_opt libxcb-devel python xcb-proto-devel xcb-util-image-devel xcb-util-wm-devel xcb-util-xrm-devel

git clone --branch 3.1.0 --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install
