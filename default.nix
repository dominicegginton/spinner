{ lib, swift, swiftpm, swiftpm2nix }:

with lib.sources;

let
  generated = swiftpm2nix.helpers ./nix;
in

swift.stdenv.mkDerivation rec {
  pname = "spinner";
  version = "0.0.0";
  src = cleanSource ./.;
  nativeBuildInputs = [ swift swiftpm ];

  configurePhase = generated.configure;

  installPhase = ''
    binPath="$(swiftpmBinPath)"
    mkdir -p $out/lib
    cp $binPath/* $out/lib
  '';
}
