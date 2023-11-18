{ lib, ... }:

let
  gitAliases = {
    l = "log --pretty=format:\"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [ %cn ]\" --decorate --date=short";
    a = "add";
    ap = "add -p";
    c = "commit --verbose";
    ca = "commit -a --verbose";
    cm = "commit -m";
    cam = "commit -a -m";
    m = "commit --amend --verbose";
    d = "diff";
    ds = "diff --stat";
    dc = "diff --cached";
    s = "status -s";
    co = "checkout";
    cob = "checkout -b";
    b = "!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'";
    la = "!git config -l | grep alias | cut -c 7-";
  };

in
{
  programs.git = {
    enable = true;
    userName = "Fabrice Semti";
    userEmail = "fabrice@fabricesemti.com";
    aliases = gitAliases;
  };
}
