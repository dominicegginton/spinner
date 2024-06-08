{
  pkgs,
  oldPkgs,
}:
with pkgs.lib.sources;
  pkgs.stdenv.mkDerivation {
    name = "";
    src = cleanSource ./.;
    nativeBuildInputs = [
      oldPkgs.clang
      oldPkgs.swift
    ];

    configurePhase = ''
      CC=clang
    '';

    buildPhase = ''
      # TODO: build swift package will need to get deps
      #       from Package.resolved and fetch with nix
    '';

    installPhase = ''
      mkdir -p $out
    '';
  }
