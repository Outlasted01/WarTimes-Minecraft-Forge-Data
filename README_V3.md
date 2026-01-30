# 🎮 WESTFRONT 44 - VERSION 3.0

<div align="center">

## ⚡ SPEZIAL-ITEMS & NATIONEN-SHOP SYSTEM

**Ein umfassendes Update für dein Minecraft Westfront Datapack**

![Version](https://img.shields.io/badge/Version-3.0-brightgreen)
![Status](https://img.shields.io/badge/Status-Active-green)
![Minecraft](https://img.shields.io/badge/Minecraft-1.17+-blue)
![License](https://img.shields.io/badge/License-Custom-orange)

</div>

---

## 📋 INHALTSVERZEICHNIS

- [🎯 Features](#-features)
- [🚀 Quick Start](#-quick-start)
- [📚 Dokumentation](#-dokumentation)
- [⚙️ Installation](#️-installation)
- [🎮 Spieler-Guide](#-spieler-guide)
- [👨‍💼 Admin-Guide](#-admin-guide)
- [📊 Technische Details](#-technische-details)
- [🐛 Support](#-support)

---

## 🎯 Features

### ⭐ Spezial-Items System

| Icon | Item | Team | Effekt | Preis |
|------|------|------|--------|-------|
| 🥔 | Panzerschokolade | 🇩🇪 | Speed II 30s | 20 Eisen |
| 🚀 | Panzer-Schub | 🇺🇸 | Knockback Push | 20 Eisen |
| 💣 | Granaten | 🇩🇪 | 4x Schüsse | 15 Eisen |
| 🔧 | Reparatur | 🇩🇪 | 2x Kits | 25 Eisen |
| 🔫 | Munition | 🇺🇸 | 3x Ammo | 18 Eisen |
| ☁️ | Air Support | 🇺🇸 | Token | 30 Eisen |

### 💰 Ressourcen-System
- Holzaxt-aktivierbar
- Spawnt Eisen & Gold
- Nation-spezifische Mengen
- 2 Min Cooldown

### 🛒 Nationen-Shops
- Deutsche Shop (3 Items)
- US Shop (3 Items)
- Dynamische Preise
- Clickable HUD

### ⚙️ Admin Shop-Editor
- Live-Preisanpassung
- Keine Neustarts nötig
- Benutzerfreundliche UI
- Admin-geschützt

---

## 🚀 Quick Start

### Für Spieler (30 Sekunden)

```bash
# Shop öffnen
/trigger open_shop set 1

# Panzerschokolade kaufen (Deutsch)
/trigger buy_de set 1

# Panzer-Schub kaufen (USA)
/trigger buy_us set 1
```

### Für Admins (2 Minuten)

```bash
# 1. Ressourcen-Block spawnen
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}

# 2. Admin-Tag setzen
/tag @s add wf_admin

# 3. Shop-Editor öffnen
/trigger shop_editor set 1

# 4. Preise ändern (z.B. Panzerschokolade auf 25)
/scoreboard players set cfg_de_panzer_preis Config 25
```

---

## 📚 Dokumentation

### 🎮 Für Spieler
- **[QUICK_REFERENCE.md](QUICK_REFERENCE.md)** - Schnelle Befehle & Preise
- **[SPEZIAL_ITEMS_SHOP.md](SPEZIAL_ITEMS_SHOP.md#-spieler-guide)** - Detaillierter Guide

### 👨‍💼 Für Admins
- **[SPEZIAL_ITEMS_SHOP.md](SPEZIAL_ITEMS_SHOP.md#️-admin-befehle)** - Admin-Anleitung
- **[SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md)** - Technische Details
- **[SETUP_SPEZIAL_ITEMS.sh](SETUP_SPEZIAL_ITEMS.sh)** - Installation

### 📖 Überblick
- **[DEPLOYMENT_SUMMARY.txt](DEPLOYMENT_SUMMARY.txt)** - Komplette Übersicht
- **[CHANGELOG_V3.0.md](CHANGELOG_V3.0.md)** - Was ist neu
- **[DOKUMENTATIONS_INDEX.md](DOKUMENTATIONS_INDEX.md)** - Doc Navigation

---

## ⚙️ Installation

### Schritt 1: Datei-Struktur
```
data/westernfront/functions/
├── special_items/          (6 neue Dateien)
├── shop/                   (13 neue Dateien)
└── shop_items/             (6 neue Dateien)
```

### Schritt 2: Initialisierung
Alle neuen Dateien sind bereits in `main.mcfunction` integriert.  
Führe einfach aus:
```
/function westernfront:setup
```

### Schritt 3: Ressourcen-Block
```
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### Schritt 4: Tests
```
/trigger open_shop set 1
```

---

## 🎮 Spieler-Guide

### Shop verwenden

```
/trigger open_shop set 1
```

**Dann auswählen:**
- Deutsche Shop Items (Deutsch)
- US Shop Items (USA)

### Panzerschokolade nutzen

1. `/trigger buy_de set 1` (kaufen)
2. Kakaobohne ins Inventar
3. In Hand nehmen
4. Rechtsklick → Speed Boost! ⚡

### Ressourcen bekommen

1. Holzaxt in Hand
2. Zu Ressourcen-Block laufen
3. Rechtsklick
4. Eisenbarren sammeln 💰

---

## 👨‍💼 Admin-Guide

### Shop-Editor

```
/trigger shop_editor set 1
```

**Features:**
- Preis ändern (+/- 5, +/- 10)
- Live-Anwendung
- Keine Neustarts

### Preise manuell setzen

```bash
# Deutsche Items
/scoreboard players set cfg_de_panzer_preis Config 25
/scoreboard players set cfg_de_granaten_preis Config 18
/scoreboard players set cfg_de_reparatur_preis Config 30

# US Items
/scoreboard players set cfg_us_panzerschub_preis Config 22
/scoreboard players set cfg_us_munition_preis Config 20
/scoreboard players set cfg_us_airsupport_preis Config 35
```

### Admin-Menü

```
/trigger zx_admin_747 set 1
```

---

## 📊 Technische Details

### Neue Scoreboards (16)
- `PanzerSchokoladeCooldown`
- `PanzerSchokoladeEffekt`
- `USPanzerschubCooldown`
- `ResourceBlockCooldown`
- `buy_de`, `buy_us`
- `open_shop`, `shop_editor`
- `MainShopOpen`, `check_price`
- `cfg_de_*` (6x Preise)
- `cfg_us_*` (3x Preise)

### Neue Trigger (5)
- `buy_de` - Deutsche Shop
- `buy_us` - US Shop
- `open_shop` - Shop öffnen
- `shop_editor` - Admin Editor
- `PrestigeReady` - Prestige System

### Neue Dateien (25+)

**Spezial-Items:**
```
special_items/
├── panzer_schokolade.mcfunction
├── panzer_schokolade_use.mcfunction
├── panzer_schokolade_activate.mcfunction
├── us_panzerschub.mcfunction
├── us_panzerschub_use.mcfunction
└── us_panzerschub_activate.mcfunction
```

**Shop-System:**
```
shop/
├── nationen_shop.mcfunction
├── main_shop_menu.mcfunction
├── open_shop_trigger.mcfunction
├── resource_block.mcfunction
├── resource_block_nearby.mcfunction
├── resource_spawn.mcfunction
├── shop_editor.mcfunction
├── shop_editor_menu.mcfunction
├── editor_de_1.mcfunction
└── dynamic_pricing.mcfunction
```

**Shop-Items:**
```
shop_items/
├── de_panzer_schokolade.mcfunction
├── de_granaten.mcfunction
├── de_panzer_reparatur.mcfunction
├── us_panzerschub.mcfunction
├── us_munition_upgrade.mcfunction
└── us_air_support.mcfunction
```

---

## 🐛 Support

### Häufige Fragen

**F: Shop funktioniert nicht?**  
A: Prüfe `/scoreboard objectives list` und `/tag @s list`

**F: Spezial-Items funktionieren nicht?**  
A: Item in der Hand? Richtige ID? 5s Cooldown?

**F: Ressourcen-Block nicht sichtbar?**  
A: `/tag @e[type=armor_stand] list` für Debug

**F: Preise ändern nicht?**  
A: Admin-Tag? `/tag @s add wf_admin`

### Troubleshooting

Siehe [QUICK_REFERENCE.md - Troubleshooting](QUICK_REFERENCE.md#-troubleshooting)

---

## 📊 Statistiken

| Metrik | Wert |
|--------|------|
| Neue Dateien | 25+ |
| Neue Scoreboards | 16 |
| Neue Trigger | 5 |
| Shop-Items | 6 |
| Dokumentation | 7 Dateien |
| Codezeilen | 2000+ |
| Komplexität | Mittel |
| Installation | 2 Minuten |

---

## 🎯 Features Überblick

### ✨ Was ist neu in V3.0

✅ **Spezial-Items System**
- Panzerschokolade (Deutsch)
- Panzer-Schub (USA)
- Cooldown-Management
- Auto-Aktivierung

✅ **Ressourcen-Block**
- Holzaxt-Aktivierbar
- Dynamische Spawns
- Nation-spezifisch
- 2 Min Cooldown

✅ **Nationen-Shops**
- Deutsche Shop (3 Items)
- US Shop (3 Items)
- Clickable HUD
- Nation-spezifisch

✅ **Admin Shop-Editor**
- Preis-Anpassung
- Live-Änderungen
- Sichere Admin-Kontrolle
- Benutzerfreundlich

✅ **Dynamische Preise**
- Keine Neustarts
- Echtzeit-Änderungen
- Config-basiert
- Persistent

---

## 🎮 Gameplay-Features

- Speed Boost für Deutsch (30s)
- Knockback Push für USA
- Ressourcen sammeln
- Items kaufen & verkaufen
- Admin-Kontrolle
- Dynamische Preise
- Sound & Effekte
- HUD-Interface

---

## 📈 Balancing

### Teuer Items (20+)
- Panzerschokolade (20 Eisen)
- Panzer-Schub (20 Eisen)
- Panzer-Reparatur (25 Eisen)
- Air Support (30 Eisen)

### Budget Items (15-18)
- Granaten-Pack (15 Eisen)
- Munitions-Upgrade (18 Eisen)

### Ressourcen
- Deutschland: 5 Eisen + 2 Gold
- USA: 4 Eisen + 3 Gold

---

## 🔄 Integration

✅ Vollständig in `main.mcfunction` integriert  
✅ Automatische Initialisierung in `setup.mcfunction`  
✅ Keine Konflikte mit bestehenden Systemen  
✅ Lädt sich jeden Tick automatisch  

---

## 📝 Version History

### V3.0 (29.01.2026) - AKTUELL
- Spezial-Items System
- Ressourcen-Block
- Nationen-Shops
- Admin Editor
- Dynamische Preise

### V2.0 (29.01.2026)
- Level & Prestige System
- Verbessertes Teamkill-System
- Erweitertes Achievement-System

### V1.0 (Früher)
- Basis-Systeme

---

## 🤝 Beitragen

Möchtest du Features hinzufügen?

1. Siehe [SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md)
2. Folge dem Code-Stil
3. Teste gründlich
4. Dokumentiere alles

---

## 📜 Lizenz

Custom Datapack für Westfront 44  
Nicht zum Verkauf. Nur für persönliche Nutzung.

---

## 🙏 Credits

**Westfront Development Team**  
Powered by Minecraft Datapacks

---

## 🎉 READY TO GO?

1. **Lese** [DEPLOYMENT_SUMMARY.txt](DEPLOYMENT_SUMMARY.txt) (5 min)
2. **Führe** [SETUP_SPEZIAL_ITEMS.sh](SETUP_SPEZIAL_ITEMS.sh) aus (2 min)
3. **Teste** `/trigger open_shop set 1` (1 min)
4. **Viel Spaß spielen!** 🚀

---

<div align="center">

### 🎮 WESTFRONT 44 - V3.0 IS LIVE! 🎮

**Viel Spaß auf der Western Front!**

[QUICK_REFERENCE.md](QUICK_REFERENCE.md) | [SPEZIAL_ITEMS_SHOP.md](SPEZIAL_ITEMS_SHOP.md) | [SYSTEM_ARCHITECTURE.md](SYSTEM_ARCHITECTURE.md)

---

**Fragen?** Siehe [DOKUMENTATIONS_INDEX.md](DOKUMENTATIONS_INDEX.md)

</div>
