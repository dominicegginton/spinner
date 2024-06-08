{pkgs}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    clang
    swift
  ];

  shellHook = ''
    CC=clang
  '';
}
