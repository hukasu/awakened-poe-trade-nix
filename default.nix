{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation {
  pname = "awakened-poe-trade";
  version = "3.24.10002";

  src = pkgs.appimageTools.wrapType2 {
    name = "awakened-poe-trade";
    version = "3.24.10002";
    src = pkgs.fetchurl {
      url = "https://github.com/SnosMe/awakened-poe-trade/releases/download/v3.24.10002/Awakened-PoE-Trade-3.24.10002.AppImage";
      hash = "sha256-ieRBYrtpB8GgnDDy+fDuwamix5syRH3NG5jE5UoGg5A=";
    };
  };

  installPhase = ''
    mkdir -p $out/bin
    cp $src/bin/* $out/bin
  '';

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "awakened-poe-trade";
      exec = "awakened-poe-trade";
      desktopName = "AwakenedPoETrade";
      genericName = "Awakened PoE Trade";
    })
  ];

  meta = with pkgs.lib; {
    homepage = "https://github.com/SnosMe/awakened-poe-trade";
    description = "💲 🔨 Path of Exile trading app for price checking";
    platforms = platforms.linux;
  };
}
