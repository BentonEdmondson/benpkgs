{ nixpkgs, ... }: nixpkgs.python3Packages.buildPythonPackage rec {
    pname = "Audible";
    version = "0.7.0";

    src = nixpkgs.fetchFromGitHub {
        owner = "mkb79";
        repo = pname;
        rev = "v${version}";
        sha256 = "0wj8m6y3dvyd1gl3qgk811alsm6474yk9xnbq2rmrd5pa1infbvk";
    };

    propagatedBuildInputs = [
        nixpkgs.python3Packages.setuptools
        nixpkgs.python3Packages.beautifulsoup4
        nixpkgs.python39Packages.httpx
        nixpkgs.python3Packages.pbkdf2
        nixpkgs.python3Packages.pillow
        nixpkgs.python3Packages.pyaes
        nixpkgs.python3Packages.rsa
    ];

    patches = [ ./unrestrict-httpx-dependency.patch ];
}