#!/usr/bin/env zsh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar main &
  done
else
  polybar --reload main &
fi

echo "Polybar launched..."


sleep 4s && xdo above -t $(xdo id -n root) $(xdo id -n polybar)
