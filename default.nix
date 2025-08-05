{
  pkgs ? import <nixpkgs> {},
}:
{
  balatro-mobile-maker = pkgs.callPackage ./balatro-mobile-maker.nix {};
}
