{ pkgs ? import <nixpkgs> {} }:
let
  appimage = pkgs.appimageTools.wrapType2 {
    pname = "awakened-poe-trade";
    version = "3.26.101";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.26.101/Awakened-PoE-Trade-3.26.101.AppImage";
      hash = "sha256-n7xweAHNYQSDQMxZpHEf60PZk62ydwMsW9a7k3QeU1E=";
    };
    meta = {
      homepage = "https://github.com/SnosMe/awakened-poe-trade";
      description = "💲 🔨 Path of Exile trading app for price checking";
      platforms =  pkgs.lib.platforms.linux;
    };
  };
  desktopItem = pkgs.makeDesktopItem {
    name = "AwakenedPoETrade";
    exec = appimage.pname;
    icon = "awakened-poe-trade";
    desktopName = "Awakened PoE Trade";
    comment = appimage.meta.description;
  };
in
  {
    inherit appimage desktopItem;
  }
