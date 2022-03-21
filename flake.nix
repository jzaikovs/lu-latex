{  
  description = "University of Latvia LaTeX thesis";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachDefaultSystem (system:
    let
      # Use the unfree package repository, 
      # because we need corefonts which are proprietary 
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      }; 
      # Define a subset of TeX Live needed for building the document
      texlive = pkgs.texlive.combine {
        inherit (pkgs.texlive)
          # Start out w/ small scheme, because we need xetex
          scheme-small
          # Extra TexLive packages
          # See https://ctan.org/ for more
          thmtools
          cleveref
          glossaries
          mfirstuc
          xfor
          datatool
          svn-prov
          bigfoot
          xstring
          was
          multirow
          tocloft
          titlesec
          appendix
          bookmark
          soul;
      };
    in rec {
      # The exported packages by this Nix flake
      packages = {
        # The only export is this thesis text document
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "ul-latex-thesis";
          # The build source is the git repository
          src = self;
          # List of dependencies for building this document
          buildInputs = [
            pkgs.coreutils 
            pkgs.gnumake
            pkgs.corefonts
            pkgs.gnused
            pkgs.gnugrep
            texlive
          ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = [ pkgs.corefonts ]; };
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}"
            make
          '';
          installPhase = ''
            mkdir -p $out
            cp out/main.pdf $out/
          '';
        };
      };
      defaultPackage = packages.document;
    });
}