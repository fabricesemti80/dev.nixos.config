{ lib, ... }:
let
in
{
  programs.bash = {
    enable = true;
    initExtra = ''
      eval "$(starship init bash)" # enable `starship`
      eval "$(direnv hook bash)"   # enable `direnv`
      alias cat='bat'              # cat is now bat!
    '';
  };
}
