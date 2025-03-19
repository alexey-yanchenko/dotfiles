# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, inputs, pkgs, lib, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tomsk";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
    options = "caps:escape";
  };

  programs.dconf.profiles.user = {
    databases = [
    {
      lockAll = true;
      settings = {
        "org/gnome/desktop/wm/keybindings" = {
          maximize = [ "<Control><Alt>Up" ];
          unmaximize = [ "<Control><Alt>Down" ];
          switch-input-source = [ "<Alt>Shift_L" ];
          switch-input-source-backward = [ "<Shift>Alt_L" ];
          switch-to-workspace-up = [""];
          switch-to-workspace-down = [""];
        };
        "org/gnome/desktop/wm/preferences" = {
          button-layout = ":minimize,maximize,close";
        };

        "org/gnome/desktop/input-sources" = {
          sources = [
            (lib.gvariant.mkTuple [
             "xkb"
             "us"
            ])
            (lib.gvariant.mkTuple [
              "xkb"
              "ru"
            ])
          ];
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "dash-to-dock@micxgx.gmail.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "system-monitor@gnome-shell-extensions.gcampax.github.com"
            "status-icons@gnome-shell-extensions.gcampax.github.com"
          ];
          favorite-apps =  [
            "google-chrome.desktop"
            "com.mitchellh.ghostty.desktop"
            "org.telegram.desktop.desktop"
            "org.gnome.Nautilus.desktop"
          ];
        };
        "org/gnome/shell/extensions/system-monitor" = {
          show-swap = false;
          show-upload = false;
        };
        "org/gnome/shell/extensions/dash-to-dock" = {
          dash-max-icon-size = lib.gvariant.mkInt32(32);
          dock-fixed = false;
          always-center-icons = true;
          custom-theme-shrink = true;
          extend-height = true;
          show-trash = false;
        };
        "org/gnome/desktop/interface" = {
          icon-theme = "Yaru";
        };
        "org/gnome/settings-daemon/plugins/power" = {
          sleep-inactive-ac-type = "nothing";
        };
      };
    }
    ];
  };

  programs.appimage = {
    enable = true;
    binfmt = true;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.elkin = {
    isNormalUser = true;
    description = "Elkin";
    extraGroups = [ "networkmanager" "wheel" "docker" "vboxsf" ];
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [
    (final: _: {
      unstable = import inputs.nixpkgs-unstable {
        inherit (final.stdenv.hostPlatform) system;
        inherit (final) config;
      };
     })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    btop
    ripgrep
    fd
    gcc
    neovim
    yazi
    git
    gitflow
    ghostty
    tmux
    nerdfonts
    fastfetch
    bash-completion
    oh-my-posh
    google-chrome
    telegram-desktop
    nekoray
    brave
    vlc
    remmina
    discord
    shutter
    dconf-editor
    menulibre
    gnome-extension-manager
    gnomeExtensions.dash-to-dock
    yaru-theme
  ];

  # Docker
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
