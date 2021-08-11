{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, ... }@flakes: let
    nixpkgs = flakes.nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.AAXtoMP3 = import ./packages/AAXtoMP3 { inherit nixpkgs; };
    packages.x86_64-linux.audible-activator = import ./packages/audible-activator { inherit nixpkgs; };
  };
}