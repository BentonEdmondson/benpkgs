{ nixpkgs, ... }: nixpkgs.python3Packages.buildPythonPackage rec {
    pname = "Audible";
    version = "0.6.0";

    src = nixpkgs.fetchFromGitHub {
        owner = "mkb79";
        repo = pname;
        rev = "v${version}";
        sha256 = "1hqdrd2kk01qx3yna6hw5pzxgr19c3gwj2w4vxisgnh57m6pxnwm";
    };

    propagatedBuildInputs = [
        nixpkgs.python3Packages.setuptools
        nixpkgs.python3Packages.beautifulsoup4
        nixpkgs.python3Packages.httpx
        nixpkgs.python3Packages.pbkdf2
        nixpkgs.python3Packages.pillow
        nixpkgs.python3Packages.pyaes
        nixpkgs.python3Packages.rsa
    ];
}