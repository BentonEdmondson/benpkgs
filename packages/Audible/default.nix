{ nixpkgs, ... }: nixpkgs.python3Packages.buildPythonPackage rec {
    pname = "Audible";
    version = "0.5.5";

    src = nixpkgs.fetchFromGitHub {
        owner = "mkb79";
        repo = pname;
        rev = "d28f62f6fe1ba5beddb79a498c818f6ae69c47f1";
        sha256 = "0bbgba3s0s69p6df344w2xrkg6qdv8119avr8wwg92fn8q0ya6cl";
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