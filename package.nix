{ pkgs, ... }:
pkgs.writeShellScriptBin "nixspect" # sh
  ''
    ${pkgs.tree}/bin/tree $(nix eval --raw nixpkgs#$*.outPath)
  ''
