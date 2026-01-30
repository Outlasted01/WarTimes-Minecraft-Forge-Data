# WESTFRONT 44 - SPEZIAL-ITEMS & NATIONEN-SHOP SYSTEM
**Version 3.0** | Datum: 29.01.2026

---

## 🎯 SPEZIAL-ITEMS SYSTEM

### 1. PANZERSCHOKOLADE (Deutschland)
**Item:** Kakaobohne  
**Preis:** 20 Eisen (200 BP)  
**Cooldown:** 5 Sekunden  
**Effekte:**
- ⚡ Speed II für 30 Sekunden (Schneller rennen!)
- 🤢 Übelkeit I für 15 Sekunden (kurze Desorientierung)

**Verwendung:**
1. Item im Rucksack haben
2. Mit Kakaobohne in der Hand halten
3. Automatisch aktiviert (mit Cooldown)

**Sound:** Experience Orb Pickup + Gold Block Hit

---

### 2. PANZER-SCHUB (USA)
**Item:** Amethyst-Splitter  
**Preis:** 20 Eisen (200 BP)  
**Cooldown:** 5 Sekunden  
**Effekt:**
- 🚀 Knockback Push - schneller Vorwärts-Boost
- Ideal für Panzerfahrer zum Durchbrechen

**Verwendung:**
1. Amethyst-Splitter im Rucksack
2. Mit Splitter in der Hand halten
3. Automatisch aktiviert + Teleport nach vorne

**Sound:** Item Pickup + Roboter-Sound (hoch)

---

## 💰 RESSOURCEN-BLOCK SYSTEM

### Aktivierung
**Item:** Holzaxt  
**Befehl:** Rechtsklick auf Block mit Holzaxt  

### Spawnt Ressourcen:

**Deutsche Seite (germany):**
- 5x Eisenbarren
- 2x Goldbarren

**US Seite (usa):**
- 4x Eisenbarren
- 3x Goldbarren (bessere Technologie!)

### Features
- Cooldown: 2 Minuten zwischen Aktivierungen pro Spieler
- Glowing-Effekt bei Aktivierung
- Sound-Feedback für alle in der Nähe
- Broadcast an alle Spieler
- Kann beliebig oft pro Runde verwendet werden

**Befehl zum Spawnen des Blocks:**
```
/summon armor_stand ~ ~ ~ {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

---

## 🛒 NATIONEN-SPEZIFISCHE SHOPS

### DEUTSCHER SHOP
**Trigger:** `/trigger buy_de set <id>`

| ID | Item | Kosten | Beschreibung |
|----|------|--------|-------------|
| 1 | Panzerschokolade | 20 Eisen | Speed Boost + Übelkeit |
| 2 | Granaten-Pack | 15 Eisen | 4x Granaten |
| 3 | Panzer-Reparatur | 25 Eisen | 2x Reparatur-Kits |

### US SHOP
**Trigger:** `/trigger buy_us set <id>`

| ID | Item | Kosten | Beschreibung |
|----|------|--------|-------------|
| 1 | Panzer-Schub | 20 Eisen | Push-Boost für Panzer |
| 2 | Munitions-Upgrade | 18 Eisen | 3x Munitions-Upgrade |
| 3 | Air Support | 30 Eisen | Luftunterstützung Token |

---

## ⚙️ SHOP-EDITOR HUD

### Admin-Zugriff
**Nur für Spieler mit `wf_admin` Tag!**

**Befehl:** `/trigger shop_editor set 1`

### Features
✅ Visuelles Menü mit Clickable Links  
✅ Preise ändern für jedes Item  
✅ Dynamische Preisanwendung  
✅ Live-Bearbeitung ohne Neustart  

### Verwendung
1. Admin nutzt `/trigger shop_editor set 1`
2. Klickt auf gewünschtes Item zum Bearbeiten
3. Wählt Preis-Anpassung (+/- 5, +/- 10)
4. Änderungen sofort aktiv
5. Mit [← ZURÜCK] zur Hauptliste zurück

### Admin-Befehl für Preis-Setzung (manuell):
```
/scoreboard players set cfg_de_panzer_preis Config 20
/scoreboard players set cfg_us_panzerschub_preis Config 20
```

---

## 📊 TECHNISCHE DETAILS

### Neue Scoreboards
```
PanzerSchokoladeCooldown    - Abkühl-Zeit Tracker
PanzerSchokoladeEffekt      - Effekt-Duration Tracker
USPanzerschubCooldown       - US Item Cooldown
ResourceBlockCooldown       - Ressourcen-Block Cooldown
buy_de                      - Deutsche Shop Trigger
buy_us                      - US Shop Trigger
shop_editor                 - Admin Shop-Editor Trigger
check_price                 - Dynamischer Preis-Check
```

### Dynamische Preise (Config)
```
cfg_de_panzer_preis         - Panzerschokolade (Standard: 20)
cfg_de_granaten_preis       - Granaten (Standard: 15)
cfg_de_reparatur_preis      - Reparatur (Standard: 25)
cfg_us_panzerschub_preis    - Panzer-Schub (Standard: 20)
cfg_us_munition_preis       - Munition (Standard: 18)
cfg_us_airsupport_preis     - Air Support (Standard: 30)
```

---

## 🎮 SPIELER-GUIDE

### Shop verwenden:
```
/trigger buy_de set 1    # Panzerschokolade kaufen (Deutsch)
/trigger buy_us set 1    # Panzer-Schub kaufen (USA)
```

### Ressourcen bekommen:
1. Holzaxt in der Hand haben
2. Zu Ressourcen-Block laufen
3. Rechtsklick (oder nah genug stehen)
4. Eisen- & Goldbarren erhalten

### Spezial-Items nutzen:
1. Item im Inventar haben
2. Mit Item in der Hand
3. Automatisch aktiviert bei Rechtsklick
4. 5 Sekunden Cooldown beachten!

---

## 🔧 ADMIN-BEFEHLE

### Shop-Editor öffnen:
```
/trigger shop_editor set 1
```

### Manuell Preise setzen:
```
/scoreboard players set cfg_de_panzer_preis Config 25
/scoreboard players set cfg_us_panzerschub_preis Config 22
```

### Ressourcen-Block spawnen:
```
/summon armor_stand ~ ~ ~ {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### Spieler Ressourcen geben:
```
/give @s minecraft:iron_ingot 5
/give @s minecraft:gold_ingot 2
```

---

## 📝 FUNKTIONS-DATEIEN

**Spezial-Items:**
- `special_items/panzer_schokolade.mcfunction`
- `special_items/panzer_schokolade_use.mcfunction`
- `special_items/panzer_schokolade_activate.mcfunction`
- `special_items/us_panzerschub.mcfunction`
- `special_items/us_panzerschub_use.mcfunction`
- `special_items/us_panzerschub_activate.mcfunction`

**Ressourcen-System:**
- `shop/resource_block.mcfunction`
- `shop/resource_block_nearby.mcfunction`
- `shop/resource_spawn.mcfunction`

**Shop-Systeme:**
- `shop/nationen_shop.mcfunction`
- `shop/dynamic_pricing.mcfunction`
- `shop/shop_editor.mcfunction`
- `shop/shop_editor_menu.mcfunction`
- `shop/editor_de_1.mcfunction`

**Shop-Items:**
- `shop_items/de_panzer_schokolade.mcfunction`
- `shop_items/de_granaten.mcfunction`
- `shop_items/de_panzer_reparatur.mcfunction`
- `shop_items/us_panzerschub.mcfunction`
- `shop_items/us_munition_upgrade.mcfunction`
- `shop_items/us_air_support.mcfunction`

---

## 🎵 SOUND-EFFEKTE

| Event | Sound |
|-------|-------|
| Panzerschokolade | `entity.experience_orb.pickup` |
| Panzer-Schub | `entity.item.pickup` |
| Ressourcen erhalten | `entity.experience_orb.pickup` |
| Shop-Editor | `ui.button.click` |

---

## 🌍 BALANCING

**Teuer Items (20+ Eisen):**
- Panzerschokolade (20)
- Panzer-Schub (20)
- Panzer-Reparatur (25)
- Air Support (30)

**Günstigere Items (15-18 Eisen):**
- Granaten-Pack (15)
- Munitions-Upgrade (18)

**Ressourcen pro Aktivierung:**
- Deutschland: 5 Eisen + 2 Gold
- USA: 4 Eisen + 3 Gold

---

**Status:** ✅ Alle Systeme aktiv und voll integriert  
**Letzte Update:** 29.01.2026  
**Autor:** Westfront Datapack Team
