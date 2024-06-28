{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs =
    { self
    , nixpkgs
    , flake-utils
    ,
    }:

      with flake-utils.lib;

      eachDefaultSystem (system:

      let
        pkgs = import nixpkgs { inherit system; };
      in

      {
        formatter = pkgs.nixpkgs-fmt;
        packages.default = pkgs.callPackage ./default.nix { };
        devShells.default = pkgs.callPackage ./shell.nix { };
      });
}
