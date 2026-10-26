{ pkgs, inputs, ... }:
{

  programs.firefox.enable = true;
  programs.zed-editor.enable = true;
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name ="kombi";
      user.email = "stnlykm12453@gmail.com";
      init.defaultBranch = "main";
    };
  };


  home.packages = with pkgs; [
    spotify-player
    (pkgs.discord.override { withMoonlight = true; })
    prismlauncher
    easyeffects
  ];

}
