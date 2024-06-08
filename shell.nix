{
  pkgs,
  oldPkgs,
}:
pkgs.mkShell {
  nativeBuildInputs = [
    oldPkgs.clang
    oldPkgs.swift
  ];

  shellHook = ''
    CC=clang
  '';
}
