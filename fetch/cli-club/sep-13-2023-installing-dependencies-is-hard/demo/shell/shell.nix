{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.go_1_21
  ];

  shellHook = ''
    echo "Shell is ready with $(go version)"
  '';
}
