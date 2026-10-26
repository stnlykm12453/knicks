{ config, pkgs, ... }:

{
  imports = [
    ./theme.nix
    ./apps.nix
  ];
  programs.foot.enable = true;
  programs.fuzzel.enable = true;
  programs.swaylock.enable = true;
  services.mako.enable = true;
  services.polkit-gnome.enable = true;
  dconf.enable = true;

  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
    pavucontrol
  ];

  xdg.configFile."niri/config.kdl".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/knicks/home/config/niri/config.kdl";
  xdg.configFile."foot/foot.ini".source =
    config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/knicks/home/config/foot/foot.ini";
}
