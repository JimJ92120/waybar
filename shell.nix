{ pkgs ? import <nixpkgs> {} }:
pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    nodejs
    yarn
  ];

  buildInputs = with pkgs;[

  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';
}