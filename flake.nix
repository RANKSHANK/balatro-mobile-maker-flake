{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ ... }: let
    inherit (inputs.nixpkgs) lib;
    inherit (lib.attrsets) attrValues genAttrs;
    inherit (lib.platforms) all;
    eachSys = genAttrs all;
  in {
    packages = eachSys (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in rec {
      balatro-mobile-maker = pkgs.callPackage ./balatro-mobile-maker.nix {};
      default = balatro-mobile-maker;
    });
    devShells = eachSys (system: let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in {
      default = pkgs.mkShell {
        name = "dotnet-env";
        packages = attrValues {
          inherit (pkgs) nuget-to-json;
          inherit (pkgs.dotnetCorePackages) sdk_8_0;
        };
      };

    });
  };
}
