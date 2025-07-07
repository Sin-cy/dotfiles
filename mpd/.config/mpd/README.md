## (mac) Install MPD & MPC with Brew

`brew install mpd mpc`

- Not using homebrew to run, kill and restart mpd
- as mpd homebrew config path is different from my custom mpd.conf
    - `/opt/homebrew/etc/mpd.conf`

## Manually run mpd
- run `mpd ~/path/to/your/mpd.conf`

- Three ways to Check if mpd is running
    - `mpc status` : an error would log "Connection refused" 
    - `lsof -i TCP:6600` : where "6600" is the port specified in the mpd config
    - `pgrep -fl mpd` : where you'll see mpd running pointing to your mpd.conf path

## Restart mpd with
- run `pkill mpd` or `killall mpd`
- run `mpd ~/path/to/your/mpd.conf`
- or set it to an alias


