{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = flakes': let
    flakes = {
      nixpkgs = flakes'.nixpkgs.legacyPackages.x86_64-linux;
      lib = flakes'.nixpkgs.lib;
      self = flakes'.self.packages.x86_64-linux;
    };
  in {
    packages.x86_64-linux.AAXtoMP3 = import ./packages/AAXtoMP3 flakes;
    packages.x86_64-linux.audible-activator = import ./packages/audible-activator flakes;
    packages.x86_64-linux.audible-cli = import ./packages/audible-cli flakes;
    packages.x86_64-linux.Audible = import ./packages/Audible flakes;
    packages.x86_64-linux.libgourou = import ./packages/libgourou flakes;
  };
}