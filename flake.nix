{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {inherit system;};

      oldPkgs = import (builtins.fetchGit {
        name = "old-nixpkgs";
        url = "https://github.com/NixOS/nixpkgs/";
        ref = "refs/heads/nixpkgs-unstable";
        rev = "253272ce9f1d83dfcd80946e63ef7c1d6171ba0e";
      }) {inherit system;};
    in {
      formatter = pkgs.alejandra;
      packages.default = import ./default.nix {inherit pkgs oldPkgs;};
      devShells.default = import ./shell.nix {inherit pkgs oldPkgs;};
    });
}
