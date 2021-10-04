{ nixpkgs, lib, ... }: nixpkgs.stdenv.mkDerivation rec {
    pname = "libgourou";
    version = "0.4.1";
    src = [
        (nixpkgs.fetchgit {
            name = "libgourou";
            url = "git://soutade.fr/libgourou";
            rev = "v${version}";
            sha256 = "0sh58c1fbp8c3bh0x1ghb2rpscy3r46nlz492hkspxhisvspp7zx";
        })
        (nixpkgs.fetchgit {
            name = "updfparser";
            url = "git://soutade.fr/updfparser";
            rev = "ea551b6f52c81a28404201b7b8609e1fc257b1d7";
            sha256 = "00c5d1vycsw69d5qzji0agvgljfrrjbib0wp1m7319gmdq9vnlp7";
        })
        (builtins.fetchTarball {
            name = "base64";
            url = "https://gist.github.com/tomykaira/f0fd86b6c73063283afe550bc5d77594/archive/7d5a89229a525452e37504976a73c35fbaf2fe4d.tar.gz";
            sha256 = "1g5i8iq5azbqmj3frffqdgc66j2c9agmx5zd0gjpxa1b7pba5pkn";
        })
    ];
    sourceRoot = "libgourou";

    patches = [
        ./get-pugixml-dynamically.patch
    ];

    configurePhase = ''
        chmod -R +w ..
        mkdir lib
        cp -r ../updfparser lib
        cp -r ../base64 lib
    '';

    nativeBuildInputs = [ nixpkgs.pkg-config ];

    buildInputs = [
        nixpkgs.openssl
        nixpkgs.qt5.qtbase
        nixpkgs.libzip
        nixpkgs.pugixml
    ];
    dontWrapQtApps = true;

    buildPhase = ''
        make -C lib/updfparser BUILD_STATIC=1 BUILD_SHARED=0
        make
    '';

    installPhase = ''
        mkdir -p $out/bin $out/lib
        cp libgourou.so $out/lib
        cp utils/adept_activate $out/bin
        cp utils/acsmdownloader $out/bin
    '';

    meta = {
        description = "A free implementation of Adobe's ADEPT protocol used to add DRM on ePub/PDF files";
        homepage = "http://indefero.soutade.fr/p/libgourou/";
        license = [
            # libgourou and updfparser
            lib.licenses.lgpl3Plus
            # the utils
            lib.licenses.bsd3
            # base64
            lib.licenses.mit
        ];
        maintainers = [{
            name = "Benton Edmondson";
            email = "bentonedmondson@gmail.com";
        }];
        # potentially others, but I'm only listed those tested
        platforms = [ "x86_64-linux" ];
    };
}