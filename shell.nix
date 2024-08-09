{ pkgs, swift }:

let
  spinner = pkgs.callPackage ./default.nix {};
in

pkgs.mkShell.override { inherit (swift) stdenv; }

{
  inputsFrom = [spinner];
}
