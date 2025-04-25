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

#
