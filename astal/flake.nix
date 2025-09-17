{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    astal,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    packages.${system}.default = pkgs.stdenvNoCC.mkDerivation { 
      name = "my-shell";
      src = ./.;

      nativeBuildInputs = [
        pkgs.wrapGAppsHook
        pkgs.gobject-introspection
        pkgs.esbuild
      ];

      buildInputs = [
        pkgs.gjs
        pkgs.glib
        pkgs.gtk4
        astal.packages.${system}.io
        astal.packages.${system}.astal4
      ];

      installPhase = ''
        mkdir -p $out/bin

        esbuild \
          --bundle src/app.js \
          --outfile=$out/bin/my-shell \
          --format=esm \
          --sourcemap=inline \
          --external:gi://\*
      '';
    };
  };
}
