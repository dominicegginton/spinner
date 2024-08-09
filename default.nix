{ lib, swift, swiftpm, swiftpm2nix }:

with lib.sources;

let
  generated = swiftpm2nix.helpers ./nix;
in

swift.stdenv.mkDerivation {
  pname = "Example";
  version = "2.1.0";
  src = cleanSource ./.;
  nativeBuildInputs = [ swift swiftpm ];

  configurePhase = generated.configure;

  installPhase = ''
    binPath="$(swiftpmBinPath)"
    mkdir -p $out/bin
    cp $binPath/Example $out/bin/
  '';
}
