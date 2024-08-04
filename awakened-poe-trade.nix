{ pkgs ? import <nixpkgs> {} }:
let
  appimage = pkgs.appimageTools.wrapType2 {
    pname = "awakened-poe-trade";
    version = "3.25.102";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.25.102/Awakened-PoE-Trade-3.25.102.AppImage";
      hash = "sha256-lcdKJ+B8NQmyMsv+76+eeESSrfR/7Mq6svO5VKaoNUY=";
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
