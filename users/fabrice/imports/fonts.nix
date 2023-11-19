{ lib, ... }:
let
in
{
  fonts.fontconfig = {
    enable = true;
  };
  # home.packages = [
  #   (pkgs.nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
  # ];

}
