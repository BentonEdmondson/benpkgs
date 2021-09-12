{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, ... }@flakes: let
    nixpkgs = flakes.nixpkgs.legacyPackages.x86_64-linux;
    lib = flakes.nixpkgs.lib;
  in {
    packages.x86_64-linux.AAXtoMP3 = import ./packages/AAXtoMP3 { inherit nixpkgs; };
    packages.x86_64-linux.audible-activator = import ./packages/audible-activator { inherit nixpkgs lib; };
    packages.x86_64-linux.audible-cli = import ./packages/audible-cli { inherit nixpkgs self; };
    packages.x86_64-linux.Audible = import ./packages/Audible { inherit nixpkgs; };
  };
}