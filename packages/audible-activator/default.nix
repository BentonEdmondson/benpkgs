{ nixpkgs, lib, ... }: nixpkgs.python3Packages.buildPythonApplication rec {
  pname = "audible-activator";
  version = "0.2";

  src = nixpkgs.fetchFromGitHub {
      owner = "inAudible-NG";
      repo = pname;
      rev = "79e2cea3ca8db0afa7a911e9ed8d1684ea83939e";
      sha256 = "0m1f70y2g98263ybgrjhhhf03xn2m5981xp3dyzj428m1g0klny3";
  };

  buildInputs = [ nixpkgs.firefox ];

  propagatedBuildInputs = [
    nixpkgs.python3Packages.requests
    nixpkgs.python3Packages.selenium
  ];

  format = "other";

  installPhase = ''
    mkdir -p $out/bin $out/lib/python${lib.versions.majorMinor nixpkgs.python3.version}/site-packages
    cp common.py $out/lib/python${lib.versions.majorMinor nixpkgs.python3.version}/site-packages
    cp audible-activator.py $out/bin/audible-activator
  '';

  # it works, but only with firefox, not chrome/chromium
  meta.broken = true;

}
