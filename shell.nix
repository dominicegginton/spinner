{ pkgs, swift, swiftpm, swiftpm2nix }:

let
  spinner = pkgs.callPackage ./default.nix {};
in

pkgs.mkShell.override { inherit (swift) stdenv; }

{
  inputsFrom = [spinner];
  nativeBuildInputs = [ swiftpm swiftpm2nix ];
}
