{ config, pkgs, hostname, ... }:
let
  greeterScript = pkgs.writeShellScript "niri-greeter" ''
    ${pkgs.gtkgreet}/bin/gtkgreet -l
    ${config.programs.niri.package}/bin/niri msg action quit --skip-confirmation
  '';
  greeterConfig = pkgs.writeText "niri-greeter.kdl" ''
    hotkey-overlay {
      skip-at-startup
    }

    spawn-at-startup "${greeterScript}"

    environment {
      GTK_USE_PORTAL "0"
    }
  '';
in
{
  imports = [
    ./fonts.nix
    ./cli-apps.nix
  ];

  programs.niri.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri -c ${greeterConfig}";
        user = "greeter";
      };
    };
  };
  environment.etc."greetd/environments".text = ''
    niri-session
    bash
  '';
  systemd.user.services.niri.enableDefaultPath = false;
}
