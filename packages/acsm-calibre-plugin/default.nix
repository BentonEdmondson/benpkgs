{ nixpkgs, ... }: nixpkgs.python3Packages.buildPythonApplication rec {
    pname = "acsm-calibre-plugin";
    version = "0.0.12";

    src = nixpkgs.fetchFromGitHub {
        owner = "Leseratte10";
        repo = pname;
        rev = "v${version}";
        sha256 = "0llgvwyp0kwvf0qnxdxak41h95kvbng4mrv5cyj4ym10pa36gagf";
    };

    propagatedBuildInputs = [
        nixpkgs.python3Packages.lxml
        nixpkgs.python3Packages.rsa
        nixpkgs.python3Packages.pycrypto
        nixpkgs.python3Packages.oscrypto
    ];

    format = "other";

    installPhase = ''
        mkdir -p $out/bin $out/${nixpkgs.python3.sitePackages}
        chmod +x calibre-plugin/{fulfill,register_ADE_account}.py
        cp calibre-plugin/*.py $out/${nixpkgs.python3.sitePackages}
        mv $out/${nixpkgs.python3.sitePackages}/fulfill.py $out/bin/fulfill
        mv $out/${nixpkgs.python3.sitePackages}/register_ADE_account.py $out/bin/register_ADE_account
    '';

    meta = {
        description = "A Calibre plugin that allows you to turn ACSM files into EPUB or PDF files without the need for Adobe Digital Editions";
        homepage = "https://github.com/Leseratte10/acsm-calibre-plugin";
        license = [ nixpkgs.lib.licenses.gpl3 ];
        maintainers = [{
            name = "Benton Edmondson";
            email = "bentonedmondson@gmail.com";
        }];
    };
}