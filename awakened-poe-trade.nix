{ pkgs ? import <nixpkgs> {} }:
let
  appimage = pkgs.appimageTools.wrapType2 {
    pname = "awakened-poe-trade";
    version = "3.27.105";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.27.105/Awakened-PoE-Trade-3.27.105.AppImage";
      hash = "sha256-XEnxDo8Njt/r7tmRxbKMNKqG/YUlc59TJY/7mjiOyXE=";
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
