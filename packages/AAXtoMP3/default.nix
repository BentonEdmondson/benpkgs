{ nixpkgs, ... }: nixpkgs.stdenv.mkDerivation rec {
  pname = "AAXtoMP3";
  version = "1.2";

  src = nixpkgs.fetchFromGitHub {
      owner = "KrumpetPirate";
      repo = pname;
      rev = "v${version}";
      sha256 = "11d145yj1sc9m9jhj70l8dh2mzzwb710hrpnzjzayxcaq122i9yf";
  };

  nativeBuildInputs = [ nixpkgs.makeWrapper ];

  buildInputs = [
    nixpkgs.ffmpeg
    nixpkgs.mediainfo
    nixpkgs.mp4v2
    nixpkgs.jq
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp AAXtoMP3 $out/bin
  '';

  fixupPhase = ''
    wrapProgram $out/bin/AAXtoMP3 --prefix PATH : ${nixpkgs.lib.makeBinPath buildInputs}
  '';
}
