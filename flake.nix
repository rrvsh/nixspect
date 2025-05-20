{
  description = "A tool to inspect the outPath of a Nix package.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      packages.x86_64-linux.nixspect = import ./package.nix { inherit pkgs; };
      packages.x86_64-linux.default = inputs.self.packages.x86_64-linux.nixspect;
    };
}
