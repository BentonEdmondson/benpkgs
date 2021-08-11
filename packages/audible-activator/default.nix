{ nixpkgs }: nixpkgs.stdenv.mkDerivation rec {
  pname = "audible-activator";
  version = "0.2";
  
  src = nixpkgs.fetchFromGitHub {
      owner = "inAudible-NG";
      repo = pname;
      rev = "79e2cea3ca8db0afa7a911e9ed8d1684ea83939e";
      sha256 = "0m1f70y2g98263ybgrjhhhf03xn2m5981xp3dyzj428m1g0klny3";
  };

  buildInputs = [
    (nixpkgs.python3.withPackages
      (python3Packages: [ python3Packages.requests python3Packages.selenium ])
    )
  ];

  installPhase = ''
    mkdir -p $out/bin $out/lib
    cp {audible-activator.py,common.py} $out/lib
    ln -s $out/lib/audible-activator.py $out/bin/audible-activator
  '';
    
}
