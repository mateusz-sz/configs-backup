#!/bin/bash

click_at_from_bottom() {
    active_window=$(xdotool getactivewindow getwindowname)
    if [[ "$active_window" == *"OpenBoard"* ]]; then
        # Get screen height
        screen_height=$(xdpyinfo | grep dimensions | awk '{print $2}' | cut -d'x' -f2)
        # Calculate Y coordinate from bottom
        y_coord=$((screen_height - $2))
        
        # Store current mouse position
        eval $(xdotool getmouselocation --shell)
        # Click at target coordinates
        xdotool mousemove $1 $y_coord click 1
        # Return to previous position
        xdotool mousemove $X $Y
    fi
}

cat > ~/.xbindkeysrc << EOF
"click_at_from_bottom 81 59"
    F1
"click_at_from_bottom 105 59"
    F2
"click_at_from_bottom 130 59"
    F3
"click_at_from_bottom 154 59"
    F4
EOF

pkill xbindkeys
xbindkeys
