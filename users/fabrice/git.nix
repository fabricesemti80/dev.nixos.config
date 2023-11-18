{ lib, ... }:
let
in
{
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
}
