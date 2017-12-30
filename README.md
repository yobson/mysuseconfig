# My setup files for openSUSE Tumbleweed
This contains files and a script to install my i3, polybar and rofi
theme on openSUSE. It is only tested on tumbleweed.

## Install instructions
1. Run the install script: `./install.sh`
2. Once finished, into a terminal and type `polybar -m`. This will
   output a monitor ID and it's resolution. Remember the ID
3. Navigate to `~/.config/polybar` and find open `launch.sh`
4. Find the line `MONITOR=LVDS polybar main_bar &` and change `LVDS` to
   the monitor ID you got in step 2.
4. Open YAsT, navigate to System -> Network Settings. In overview it
   will show you the network interfaces for Ethernet and WiFi. Remember
   these.
5. In the pollybar config folder, open `config`.
6. Head to line 131 (in vim, type `:131`) and change the interface to
   whatever the WiFi interface was in YAsT. Do the same at line 118 for
   Ethernet.
7. Assuming you are not in a window system, type `startx` and pray
