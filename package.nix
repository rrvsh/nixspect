{ pkgs, ... }:
pkgs.writeShellScriptBin "nixspect" # sh
  ''
    nix build nixpkgs#$* --no-link
    ${pkgs.tree}/bin/tree $(nix eval --raw nixpkgs#$*.outPath)
  ''
