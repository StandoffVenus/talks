{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.direnv
  ];

  shellHook = ''
    eval "$(direnv hook bash)"
  '';
}
