# Awakened PoE Trade on Nix
A simple derivation to load Awakened PoE Trade's Appimage on Nix.

# NixOS
Add this to your `configuration.nix`
```
let
  awakened-poe-trade = import (builtins.fetchGit { url = "https://github.com/hukasu/awakened-poe-trade-nix"; ref = "0.0.1"; });
in {
  environment.packages = [
    # This is the to add the application
    awakened-poe-trade.app
    # Add this to add a Desktop Item
    # This requires the `app`, but the way it's setup right now,
    # it does not install the `app` automatically 
    awakened-poe-trade.desktop
  ];
}
```
