let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in {
  awakened-poe-trade = pkgs.callPackage ./awakened-poe-trade.nix { };
}
