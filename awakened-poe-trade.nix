{ pkgs ? import <nixpkgs> {} }:
let
  appimage = pkgs.appimageTools.wrapType2 {
    pname = "awakened-poe-trade";
    version = "3.24.10002";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.24.10002/Awakened-PoE-Trade-3.24.10002.AppImage";
      hash = "sha256-ieRBYrtpB8GgnDDy+fDuwamix5syRH3NG5jE5UoGg5A=";
    };
    meta = {
      homepage = "https://github.com/SnosMe/awakened-poe-trade";
      description = "💲 🔨 Path of Exile trading app for price checking";
      platforms =  pkgs.lib.platforms.linux;
    };
  };
  desktopItem = pkgs.makeDesktopItem {
    name = "AwakenedPoETrade";
    exec = appimage.name;
    desktopName = "Awakened PoE Trade";
    comment = appimage.meta.description;
  };
in
  pkgs.stdenv.mkDerivation {
    pname = "awakened-poe-trade-nix";
    version = "0.0.1";

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/{bin,share}
    '';
    
    buildInputs = [ appimage desktopItem ];
  }
