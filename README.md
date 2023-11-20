# A simple NixOS config

Nothing special just sets up your NixOS.

Setup losely based on: <https://youtu.be/Dy3KHMuDNS8?si=-KZHDO8MnKVYMhIv>

## Install

(On Nixos)

```sh

cd ~

nix-shell -p git

git clone https://github.com/fabricesemti80/dev.nixos.config.git

cd dev.nixos.config/

cp /etc/nixos/hardware-configuration.nix ./system/hardware-configuration.nix -f

./apply-system.sh && ./apply-users.sh

```
