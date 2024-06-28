{ pkgs, swift }:

pkgs.mkShell.override { inherit (swift) stdenv; }

{
  buildInputs = with pkgs; [ swift swiftPackages.Foundation swiftpm swiftpm2nix ];
}
