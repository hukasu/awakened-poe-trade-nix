{ pkgs ? import <nixpkgs> {} }:
let
  appimage = pkgs.appimageTools.wrapType2 {
    pname = "awakened-poe-trade";
    version = "3.25.104";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.25.104/Awakened-PoE-Trade-3.25.104.AppImage";
      hash = "sha256-Xzi9ojq+30zFI10GZ3AxYncuYyTArPYNVh0uX7SQVtc=";
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
