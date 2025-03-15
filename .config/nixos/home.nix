{ config, pkgs, ... }:

{
  # TODO please change the username & home directory to your own
  home.username = "elkin";
  home.homeDirectory = "/home/elkin";

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  home.file.".bash_profile".text = ''
    # managed by home-manager
    [[ -f ~/.bashrc ]] && . ~/.bashrc
  '';

  home.stateVersion = "24.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
