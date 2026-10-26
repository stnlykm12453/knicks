{
  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/82139be";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { ... }@inputs:
    let
      mkHost = hostname: inputs.nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit hostname inputs;
        };
        modules = [
          ./modules/core.nix
          ./modules/networking.nix
          ./hosts/${hostname}/configuration.nix
          ./hosts/${hostname}/hardware-configuration.nix
        ];
      };
    in
    {
      nixosConfigurations = {
        lappy = mkHost "lappy";
      };
    };
}
