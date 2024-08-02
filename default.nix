let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  awakened-poe-trade = pkgs.callPackage ./awakened-poe-trade.nix { };
in {
  app = awakened-poe-trade.appimage;
  desktop = awakened-poe-trade.desktopItem;
}
