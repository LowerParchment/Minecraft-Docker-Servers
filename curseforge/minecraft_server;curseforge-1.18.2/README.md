# Forge Base Server - Minecraft 1.18.2 (Forge 40.3.0)

## Why This Exists

Time for a story:

When I tried to self-host a modpack for me and my girlfriend (CurseForge: Life in the Village 4 to be exact), I ran into every blocker imaginable:

- The **modpack didn’t provide official server files** via CurseForge.
- The **modpack worked client-side but failed server-side** due to unresolved mod dependencies.
- The **Forge launcher was incompatible** with the way the pack was built.
- Some mods were **client-only or completely broken in multiplayer**, but there was no doc, no toggle, no warning.
- The **modpack author ignored weeks of complaints**, deferring to a Discord mod team while still collecting server hosting revenue through affiliate codes. Meaning they *did* have the correct server files — just hosted on a 3rd-party provider they were pushing people toward, instead of providing it on their about section. Claiming that the pack "wasnt out of alpha yet".

**That’s not open-source. That’s bait-and-switch and I won't stand for it.**

I built this image out of **pure spite** — and a desire to make sure nobody else has to go through as much bullshit as I did - to an extent anyway.

So this project is for *everyone* — a fully open, remixable, drop-in Forge server base image that **you control**. No lock-in. No shell games. Just you and your mods.

---

## What's Inside This Image

- Java 17 (Temurin, containerized — no need to install Java manually)
- Forge 1.18.2 (build 40.3.0, server-ready)
- Volume-mountable folder (`/app`) for your configs, mods, worlds
- Auto EULA acceptance
- Configurable RAM (defaults to 4GB)
- No mods included — clean slate for drag-and-drop installation

---

## How to Hook This In

1. **Install Docker:**
   - Windows/macOS: https://docs.docker.com/desktop/install/
   - Enable **WSL 2** and integration if you're on Windows

2. **Pull the Image:**
   ```bash
   docker pull lowerparchment/minecraft_server:yourSpecificTaggedImageYouNeedHere
   ```

3. **Create a folder for your server:**
   ```bash
   mkdir C:\GameServers\Forge1182
   ```

4. **Run the container:**
   ```bash
   docker run -d -p 25565:25565 ^
     -v C:\GameServers\Forge1182:/app ^
     --name mymoddedserver ^
     lowerparchment/minecraft_server:yourSpecificTaggedImageYouNeedHere
   ```

Your server folder is now ready to edit via Windows GUI at:
```
C:\GameServers\Forge1182
```

---

## Customization Steps

###  1. Add Mods
- Open your modpack's client folder:  
  `%APPDATA%\.minecraft\instances\<YourModpackName>\mods`
  Or you can find them by navigating to the client installed forge and opening file location from their menus.
- Copy all `.jar` files into:  
  `C:\GameServers\Forge1182\mods`

### 2. Add Configs
- Same thing: copy the entire `config/` folder from your modpack client
- Paste it into `C:\GameServers\Forge1182\config`

### 3. (Optional) Beef Up RAM
- Open `start.sh` inside the container, or rebuild the image with updated values:
  ```bash
  java -Xmx8G -Xms4G -jar forge-*.jar nogui
  ```

### 4. Tweak Server Properties
Edit `server.properties` inside the mounted folder. Want PvP off? Enable command blocks? Crank the view distance? It’s all in there.

---

## Want to Extract the Files Instead of Running Docker?

If you just want to extract the raw server folder to configure without running Docker:

```bash
docker create --name forge-dump lowerparchment/minecraft_server:yourSpecificTaggedImageYouNeedHere
docker cp forge-dump:/app ./ForgeServerDump
docker rm forge-dump
```

You’ll now have a folder called `ForgeServerDump` with everything inside it.

---

## DON'T FORGET TO PORT FORWARD YOUR ROUTER!!!

---

## Need Help?

Always try ChatGPT first if you kind of know what you're doing. It's a great way to point you in the right direction with syntax issues.

Otherwise:
Reach out on Discord: **lowerparchment**

I'm here to help, not gatekeep. If a mod isn’t loading, you’re hitting version hell, dependency issues, or Docker won’t start — hit me up. I'll help the best that I can within reason. NOTE: I may not have a solution for you and I'm mainly leaving this as a way to get docker-image-specific help, not necessarily fixing your modpack.

---

*Built with blinding rage, Red Bull (Summer Edition: White Peach obviously), and a burning hatred for unresponsive modpack devs.*  
**Last updated:** June 17, 2025
