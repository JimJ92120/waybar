# waybar

Some `waybar` config and theming.

![screenshot](./screenshot.png)

---

---

# installation

| requirements |     |
| ------------ | --- |
| `node`       |     |

```sh
git clone <repository-name>

npm install
```

# build

```sh
npm run build:dev # development
npm run build # production
```

### output

```
/
  /config
    style.css
  /dist
    style.css
```

# run

Copy the `config/` directory content to `~/.config/waybar` then:

```sh
cd ~/.config/waybar

chmod +x ./waybar.sh

./waybar.sh
```

---

---

# add module

#### config

```json
// config/config.json
{
  "modules-left": [],
  "modules-center": [],
  "modules-right": ["custom-my-module"],
  "custom/reboot-bios": {
    "format": "&#9965;",
    "return-type": "",
    "on-click": "systemctl reboot --firmware-setup",
    "tooltip": false
  }
}
```

#### style

```scss
// src/modules/custom-my-module.scss
.custom-* {
  //
}

// src/main.scss
window#waybar {
  @import "./modules/custom-my-module.scss";
}
```

---

---

# nixos

Example to add to `nixos` configuration with `home-manager`:

```nix
{ pkgs, lib, ... }:

let
  USERNAME = "username";

  WAYBAR_CONFIG_DIRECTORY = /path/to/waybar/config;
in
{
  fonts.packages = with pkgs; [
    font-awesome
  ];

  home-manager = {
    users.${USERNAME} = {
      home = {
        file = lib.mkMerge [
          {
            ".config/waybar" = {
              source = WAYBAR_CONFIG_DIRECTORY;
              recursive = true;
            };
          }
          {
            ".config/waybar/waybar.sh" = {
              source = WAYBAR_CONFIG_DIRECTORY + "/waybar.sh";
              executable = true;
            };
          }
          {
            ".config/waybar/modules/mediaplayer.py" = {
              source = WAYBAR_CONFIG_DIRECTORY + "/modules/mediaplayer.py";
              executable = true;
            };
          }
        ];
      };

      programs = {
        waybar = {
          enable = true;
        };
      };

      wayland.windowManager.hyprland = {
        settings = {
          exec-once = [
            "sh ~/.config/waybar/waybar.sh"
          ];
        };
      };
    };
  };
}
```
