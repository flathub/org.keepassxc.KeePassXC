# Flatpak application command wrapper for org.keepassxc.KeePassXC 
#
# This scripts is an application specific workaround to the limitation of one
# command per Flatpak. It allows the Flatpak app to redirect input from
# the KeePassXC-Browser extension to the `keepassxc-proxy` program.

# Respect user settings "UseCustomProxy=true/false", whether it works or not
if [[ -S "/run/user/$UID/app/org.keepassxc.KeePassXC/kpxc_server" ]]; then
  if   [[ "$1" =~ 'chrome-extension://iopaggbpplllidnfmcghoonnokmjoicf/' ]]; then
    keepassxc-proxy "$@"
  elif [[ "$1" =~ 'chrome-extension://oboonakemofpalcgghocfoadofidjkkk/' ]]; then
    keepassxc-proxy "$@"
  elif [[ "$1" =~ '.mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json' ]]; then
    keepassxc-proxy "$@"
  elif [[ "$1" =~ '.tor-browser/app/Browser/TorBrowser/Data/Browser/.mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json' ]]; then
    keepassxc-proxy "$@"
  else
    keepassxc "$@"
  fi
else
  keepassxc "$@"
fi
