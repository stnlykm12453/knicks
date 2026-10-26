{ inputs, nixpkgs, ... }:

{
  imports = [
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.kombi = {
        home.stateVersion = "26.11";
        imports = [
                    ../../home/modules/desktop.nix
                    ../../home/modules/small-games.nix
                  ];
      };
    }
    ../../modules/desktop.nix
    ../../modules/audio.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
