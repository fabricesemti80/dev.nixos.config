{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "fabrice";
  home.homeDirectory = "/home/fabrice";

  imports = [
    ./starship.nix
    "${fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master"}/modules/vscode-server/home.nix"
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.
  programs.gpg = {
    enable = true;
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello world!" when run.
    # pkgs.hello
    bat
    btop
    direnv
    duf
    httpie
    git
    git-crypt
    gnupg
    pinentry_qt
    tree

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {

    # #SRC:  https://raw.githubusercontent.com/eudoxia0/dotfiles/e8a5d9ab6635182da13e58338a0f0149c40f77dd/root.nix
    # ".bashrc" = {
    #   source = ./sources/bashrc.sh;
    # };
    ".local/bin" = {
      source = ./sources/scripts;
      recursive = true;
    };

    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/fabrice/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  ## [Enabled] PROGRAMS

  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      alias cat='bat'
    '';
  };

  programs.git = {
    enable = true;
    userName = "Fabrice Semti";
    userEmail = "fabrice@fabricesemti.com";
    aliases = {
      gcam = "git commit -a -m";
      gco = "git checkout";
      gu = "git push -u origin HEAD";
      gd = "git pull origin";
      gh = "git checkout master";
      gb = "git branch";

    };

  };

  programs.ssh = {
    enable = true;
  };

  ## [Enabled] SERVICES

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "qt";
  };

  services.vscode-server.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}