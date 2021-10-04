{ nixpkgs, self, ... }: nixpkgs.python3Packages.buildPythonApplication rec {
    pname = "audible-cli";
    version = "0.0.dev20";

    src = nixpkgs.fetchFromGitHub {
        owner = "mkb79";
        repo = pname;
        rev = "2200ec0305e05e8087b5e25ce616e0a132713642";
        sha256 = "0ns9qffw5zdncp8imx9vvg0fn9f4x0bhx22g8w4q4drxddhsyzn7";
    };

    propagatedBuildInputs = [
        self.Audible
        nixpkgs.python3Packages.aiofiles
        nixpkgs.python3Packages.click
        nixpkgs.python3Packages.httpx
        nixpkgs.python3Packages.pillow
        nixpkgs.python3Packages.tabulate
        nixpkgs.python3Packages.toml
        nixpkgs.python3Packages.tqdm
    ];
}