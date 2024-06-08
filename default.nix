{pkgs}:
with builtins;
with pkgs;
with pkgs.stdenv;
with pkgs.lib;
with pkgs.lib.sources; let
  fetchDep = dep:
    fetchGit {
      url = dep.repositoryURL;
      rev = dep.state.revision;
    };

  checkoutDep = dep:
    pkgs.runCommand "checkout-dep" {} ''
      mkdir -p $out
      ln -s ${fetchDep dep} $out/${dep.package}
    '';

  depObject = dep: {
    basedOn = null;
    packageRef = {
      identity = toLower dep.package;
      isLocal = false;
      name = dep.package;
      path = dep.repositoryURL;
    };
    state = {
      checkoutState = dep.state;
      name = "checkout";
    };
    subpath = dep.package;
  };

  packageResolve = fromJSON (readFile ./Package.resolved);
  packageDeps = packageResolve.object.pins;

  depsState = {
    object = {dependencies = map depObject packageDeps;};
    version = 2;
  };

  deps = pkgs.symlinkJoin {
    name = "deps";
    paths = map checkoutDep packageDeps;
  };

  depsJson = pkgs.runCommand "deps-json" {} ''
    echo '${builtins.toJSON depsState}' | ${pkgs.jq}/bin/jq > $out
  '';
in
  mkDerivation {
    name = "spinner";
    src = cleanSource ./.;

    buildInputs = with pkgs; [
      clang
      swift
    ];

    configurePhase = ''
      CC=clang
    '';

    buildPhase = ''
      mkdir .build
      ln -s ${depsJson} .build/dependencies-state.json
      ln -s ${deps} .build/checkouts

      TODO: fix build
      # swift build --configuration release
    '';

    installPhase = ''
      mkdir -p $out
      cp -r ./* $out

      mkdir -p $out/.build
      cp -r .build/* $out/.build
    '';
  }
