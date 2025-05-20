{
  description = "A tool to inspect the outPath of a Nix package.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    inputs:
    let
      forAllSystems = inputs.nixpkgs.lib.genAttrs [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages."${system}";
        in
        {
          nixspect = import ./package.nix { inherit pkgs; };
          default = inputs.self.packages."${system}".nixspect;
        }
      );
    };
}
