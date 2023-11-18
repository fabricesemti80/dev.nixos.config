{ lib, ... }:
let
in
{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)"
      alias cat='bat'
    '';
  };
}
