# =============================================================================
# Variables
# =============================================================================

set $browser "google-chrome-stable"
set $editor "emacs"
set $terminal "urxvtc"
set $terminal_tmux "urxvtc -e tmux"
set $filebrowser "thunar"
set $calibre "calibre"
set $musicplayer "sonata"

# =============================================================================
# Initial setup
# =============================================================================

#  

# Set workspace icons
set $WS1 	"1: "
set $WS2	"2: "
set $WS3	"3: "
set $WS4	"4: "
set $WS5	"5: "
set $WS6	"6: "
set $WS7	"7: "
set $WS8	"8: "
set $WS9	"9: "
set $WS10	"10: "

font pango:monospace 10
hide_edge_borders both

# =============================================================================
# Assign colors
# =============================================================================

set $bg           #204A87
set $bg-urgent    #3465A4

###8b2f45
###b5294a

#set $bg            #444444
set $bg-inactive   #a0a0a0
#set $bg-urgent     #babdb6
set $text          #eeeeec
set $text-inactive #babdb6

set $bg-focused	   #222222

set $bar           #222222
set $seperator     #444444
set $statusline    #888A85

#                       border        background   text           indicator
client.focused          $bg-focused   $bg-focused  $text          $bar
client.unfocused        $bg-inactive  $bg-inactive $text-inactive $bar
client.focused_inactive $bg-inactive  $bg-inactive $text-inactive $bar
client.urgent           $bg-urgent    $bg-urgent   $text          $bar

# =============================================================================
# Configure bar
# =============================================================================

bar {
    font		pango:monospace, FontAwesome 10
    position       	bottom
    tray_output	    	primary
    status_command	i3blocks -v 2> /tmp/i3blocks.log
    #tray_output    	DVI-I-2

    colors {
        background              $bar
        separator               $seperator
        statusline              $statusline
        active_workspace        $bg $bg $text
        focused_workspace       $bg-urgent $bg $text
        inactive_workspace      $seperator $seperator $text
        urgent_workspace        $bg-urgent $bg-urgent $text
    }
}

# =============================================================================
# Assign window behavior
# =============================================================================

# Assign windows to their respective workspaces.
assign [class="URxvt|Termite"] $WS1
assign [class="Emacs|Code|Atom|jetbrains*|MATLAB*"] $WS2
assign [class="Chromium|Firefox|Google-chrome"] $WS3
assign [class="calibre|Zathura"] $WS4
assign [class="Thunar"] $WS5
assign [class="VirtualBox|Qemu*"] $WS6
assign [class="jetbrains-studio"] $WS7
assign [class="Vlc|MPlayer"] $WS9
assign [class="Clementine|Sonata"] $WS10

# Assign floating windows.
#for_window [class="feh|Keepassx|mpv|Mumble|Pavucontrol|Steam"] floating enable
#for_window [title="^Minecraft .*"] floating enable
#for_window [title="Preferences$"] floating enable
#for_window [title="Steam - Update News"] kill
for_window [window_role="^conversation$"] floating enable
for_window [window_role="messages"] floating enable
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable
for_window [class="calibre|Zathura"] layout tabbed

# Remove the titlebar.
for_window [class="Chromium|Code|Google-chrome|Firefox|Emacs|Atom|URxvt|Zathura|calibre|Termite"] border pixel 1

# =============================================================================
# Keybinds
# =============================================================================

# Set modifier to 'Windows' Key
set $mod Mod4

# Application Launcher
bindsym $mod+Shift+d exec --no-startup-id exec rofi -show run -lines 6 -i -separator-style solid -opacity "90"

# Screen locker
bindsym Control+$mod+l exec i3exit lock

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# application shortcuts

bindsym $mod+Return exec $terminal, workspace $WS1

bindsym $mod+Shift+Return exec $terminal_tmux, workspace $WS1


# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
# bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym $mod+d exec --no-startup-id j4-dmenu-desktop

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace $WS1
bindsym $mod+2 workspace $WS2
bindsym $mod+3 workspace $WS3
bindsym $mod+4 workspace $WS4
bindsym $mod+5 workspace $WS5
bindsym $mod+6 workspace $WS6
bindsym $mod+7 workspace $WS7
bindsym $mod+8 workspace $WS8
bindsym $mod+9 workspace $WS9
bindsym $mod+0 workspace $WS10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $WS1
bindsym $mod+Shift+2 move container to workspace $WS2
bindsym $mod+Shift+3 move container to workspace $WS3
bindsym $mod+Shift+4 move container to workspace $WS4
bindsym $mod+Shift+5 move container to workspace $WS5
bindsym $mod+Shift+6 move container to workspace $WS6
bindsym $mod+Shift+7 move container to workspace $WS7
bindsym $mod+Shift+8 move container to workspace $WS8
bindsym $mod+Shift+9 move container to workspace $WS9
bindsym $mod+Shift+0 move container to workspace $WS10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# An excellent alternative to the default i3 exit keybind.
# From https://wiki.archlinux.org/index.php/i3#Shutdown.2C_reboot.2C_lock_screen

set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown
mode "$mode_system" {
    bindsym l exec --no-startup-id i3exit lock, mode "default"
    bindsym e exec --no-startup-id i3exit logout, mode "default"
    bindsym s exec --no-startup-id i3exit suspend, mode "default"
    bindsym h exec --no-startup-id i3exit hibernate, mode "default"
    bindsym r exec --no-startup-id i3exit reboot, mode "default"
    bindsym Shift+s exec --no-startup-id i3exit shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Pause mode "$mode_system"
bindsym XF86PowerOff mode "$mode_system"

set $mode_applications Applications (b) Browser, (c) Calibre, (e) Editor, (f) File Manager, (m) Music Player, (t) Terminal
mode "$mode_applications" {
     bindsym b exec $browser, workspace $WS3, mode "default"
     bindsym c exec $calibre, workspace $WS4, mode "default"
     bindsym e exec $editor, workspace $WS2, mode "default"
     bindsym f exec $filebrowser, workspace $WS5, mode "default"
     bindsym m exec $musicplayer, workspace $WS10, mode "default"
     bindsym t exec $terminal, workspace $WS1, mode "default"

     bindsym Return mode "default"
     bindsym Escape mode "default"
}
bindsym $mod+p mode "$mode_applications"

bindsym XF86AudioRaiseVolume exec --no-startup-id amixer -q sset Master 5%+ && pkill -RTMIN+10 i3blocks
bindsym XF86AudioLowerVolume exec --no-startup-id amixer -q sset Master 5%- && pkill -RTMIN+10 i3blocks
bindsym XF86AudioMute exec --no-startup-id amixer -q sset Master toggle && pkill -RTMIN+10 i3blocks

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 10 # increase screen brightness
bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 10 # decrease screen brightness

bindsym XF86KbdBrightnessUp exec --no-startup-id kblight --up
bindsym XF86KbdBrightnessDown exec --no-startup-id kblight --down

# Player control
bindsym $mod+Shift+p exec --no-startup-id mpc del 0
bindsym $mod+Shift+u exec --no-startup-id mpc prev
bindsym $mod+Shift+i exec --no-startup-id mpc toggle
bindsym $mod+Shift+o exec --no-startup-id mpc next

bindsym XF86AudioPlay exec --no-startup-id mpc toggle

# Scrot
bindsym --release $mod+z exec scrot -e 'mv $f ~/Pictures/Screenshots/'

# =============================================================================
# Launch initial applications
# =============================================================================

# Daemonize the rbvt-unicode terminal emulator.
exec --no-startup-id urxvtd -q -f -o &

# Enable compositing.
exec --no-startup-id compton -bc &

# Set wallpaper.
exec --no-startup-id nitrogen --restore &

# UDisks front-end for managing removable media.
#exec --no-startup-id udiskie -ans &

# Launch the notification daemon.
exec --no-startup-id dunst &

# NetworkManager Applet
exec --no-startup-id nm-applet &

# Transmission
#exec --no-startup-id transmission-gtk -m &

# Start MPDd
exec --no-startup-id mpdd &

# MPCd
exec --no-startup-id mpcd -f &

# Bluetooth Applet
#exec --no-startup-id blueman-applet &

# Start Keyboard monitoring for disabling touchpad
#exec --no-startup-id syndaemon -i 0.5 -t -K -R &
