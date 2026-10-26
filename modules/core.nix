{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  security.rtkit.enable = true;

  networking.hostName = "kombi";

  time.timeZone = "America/New_York";

  users.users.kombi = {
    extraGroups = [ "wheel" "networkmanager" ];
    isNormalUser = true;
  };
  system.stateVersion = "26.11";
}
