{
  description = "XeLaTeX environment for compiling my CV";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      nativeBuildInputs = [
        (pkgs.texlive.combine {
          inherit
            (pkgs.texlive)
            scheme-small
            xetex
            latexmk
            fontspec
            pgf
            geometry
            hyperref
            fontawesome
            titlesec
            noto
            mfirstuc
            lipsum
            ;
        })
      ];
    };
    # Command runner for building the PDF
    apps.x86_64-linux.default = {
      type = "app";
      program =
        toString (pkgs.writeShellScriptBin "build-cv" ''
          xelatex en/cv.tex
          xelatex en/cv.tex
          echo "✅ CV compiled: en/cv.pdf"
        '')
        + "/bin/build-cv";
    };
  };
}
