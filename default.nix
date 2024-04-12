let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
  awakened-poe-trade = pkgs.callPackage ./awakened-poe-trade.nix { };
in awakened-poe-trade.appimage
