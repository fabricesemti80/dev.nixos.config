{ lib, ... }:
let
  lang = icon: color: {
    symbol = icon;
    format = "[$symbol ](${color})";
  };
in
{
  programs.starship = {
    enable = true;
    settings = {
    # ~/.config/starship.toml

add_newline = false
command_timeout = 1000
format = """$os$username$hostname$kubernetes$directory$git_branch$git_status"""

# Drop ugly default prompt characters
[character]
success_symbol = ''
error_symbol = ''

# ---

[os]
format = '[$symbol](bold white) '   
disabled = false

[os.symbols]
Windows = ''
Arch = '󰣇'
Ubuntu = ''
Macos = '󰀵'

# ---

# Shows the username
[username]
style_user = 'white bold'
style_root = 'black bold'
format = '[$user]($style) '
disabled = false
show_always = true

# Shows the hostname
[hostname]
ssh_only = false
format = 'on [$hostname](bold yellow) '
disabled = false

# Shows current directory
[directory]
truncation_length = 1
truncation_symbol = '…/'
home_symbol = '󰋜 ~'
read_only_style = '197'
read_only = '  '
format = 'at [$path]($style)[$read_only]($read_only_style) '

# Shows current git branch
[git_branch]
symbol = ' '
format = 'via [$symbol$branch]($style)'
# truncation_length = 4
truncation_symbol = '…/'
style = 'bold green'

# Shows current git status
[git_status]
format = '[$all_status$ahead_behind]($style) '
style = 'bold green'
conflicted = '🏳'
up_to_date = ''
untracked = ' '
ahead = '⇡${count}'
diverged = '⇕⇡${ahead_count}⇣${behind_count}'
behind = '⇣${count}'
stashed = ' '
modified = ' '
staged = '[++\($count\)](green)'
renamed = '襁 '
deleted = ' '

# Shows kubernetes context and namespace
[kubernetes]
format = 'via [󱃾 $context\($namespace\)](bold purple) '
disabled = false

# ---

[vagrant]
disabled = true

[docker_context]
disabled = true

[helm]
disabled = true

[python]
disabled = true

[nodejs]
disabled = true

[ruby]
disabled = true

[terraform]
disabled = true
    };
  };
}
