# UnitedFormats

A Bukkit/Spigot/Paper/Purpur Minecraft plugin that replaces default player join, quit, death, chat, and unknown command messages with configurable presets.

## Features

- Replace default join, quit, death, and unknown command messages.
- Optional custom chat format.
- Multiple presets in `config.yml`.
- Per-world message overrides.
- `blacklist-worlds` option to leave specific worlds untouched.
- Reload configuration without restarting the server.
- Preview the active preset in-game.
- Compiles to Java 8 bytecode for broad Minecraft server compatibility.
- Uses the Bukkit/Spigot API, so it also supports Purpur.

## Compatibility

UnitedFormats is designed for Bukkit-compatible server software such as Spigot, Paper, and Purpur. It avoids Paper-only APIs and does not set a fixed `api-version`, which helps it load on older servers too.

No plugin can honestly guarantee support for every Minecraft version forever, because server APIs and Java requirements change, but this project targets the widest practical compatibility range.

## Commands

- `/unitedformats reload` reloads `config.yml`.
- `/unitedformats presets` lists configured presets.
- `/unitedformats preset <name>` changes the active preset and saves it.
- `/unitedformats preview` shows example messages from the active preset.

Aliases: `/uf`, `/formats`

Permission: `unitedformats.admin`

## Placeholders

- `{player}` player username.
- `{display_name}` player display name.
- `{world}` current world name.
- `{x}`, `{y}`, `{z}` block coordinates.
- `{message}` chat message, only for chat.
- `{killer}` killer name for death messages, or `unknown`.
- `{command}` unknown command text without the first `/`.

## Per-World Messages

Use `worlds` in `config.yml` to override messages for one world. The plugin checks the player's current world first, then falls back to the active preset.

```yaml
blacklist-worlds:
  - disabled_world

worlds:
  world_nether:
    join:
      enabled: true
      message: "&4[Nether] &c{display_name} entered the heat"
```

Worlds listed in `blacklist-worlds` keep the server's default messages.

## Build

Install Java/JDK and Maven, then run:

```bash
mvn package
```

On Windows, you can also run:

```bat
build.bat
```

The plugin jar will be created in `target/UnitedFormats-1.0.0.jar`.

## Install

1. Put the built jar in your server's `plugins` folder.
2. Start the server once.
3. Edit `plugins/UnitedFormats/config.yml`.
4. Run `/uf reload`.
