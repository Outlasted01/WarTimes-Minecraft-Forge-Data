# ⚡ WESTFRONT 44 - QUICK REFERENCE

## 🎯 SPIELER-SCHNELLBEFEHLE

### Shop öffnen (Main Menu)
```
/trigger open_shop set 1
```

### Deutsche Shop Items kaufen
```
/trigger buy_de set 1    # Panzerschokolade (20 Eisen)
/trigger buy_de set 2    # Granaten-Pack (15 Eisen)
/trigger buy_de set 3    # Panzer-Reparatur (25 Eisen)
```

### US Shop Items kaufen
```
/trigger buy_us set 1    # Panzer-Schub (20 Eisen)
/trigger buy_us set 2    # Munitions-Upgrade (18 Eisen)
/trigger buy_us set 3    # Air Support (30 Eisen)
```

### Achievement Journal
```
/trigger ach_journal set 1
```

### Prestige nehmen
```
/trigger PrestigeReady set 1
```

---

## ⚙️ ADMIN-SCHNELLBEFEHLE

### Shop-Editor öffnen
```
/trigger shop_editor set 1
```

### Spezial-Items Preis setzen
```
/scoreboard players set cfg_de_panzer_preis Config 25
/scoreboard players set cfg_us_panzerschub_preis Config 22
```

### Ressourcen-Block spawnen
```
/summon armor_stand ~ ~ ~ {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### Admin-Menü
```
/trigger zx_admin_747 set 1
```

### Spieler tagen
```
/tag @s add germany
/tag @s add usa
/tag @s add wf_admin
/tag @s add crewman
/tag @s add officer
```

---

## 📊 PREISLISTE

### Deutsche Items
| Item | Preis | Effekt |
|------|-------|--------|
| Panzerschokolade | 20 Eisen | Speed II (30s) + Übelkeit |
| Granaten-Pack | 15 Eisen | 4x Granaten |
| Panzer-Reparatur | 25 Eisen | 2x Reparatur |

### US Items
| Item | Preis | Effekt |
|------|-------|--------|
| Panzer-Schub | 20 Eisen | Forward Push |
| Munitions-Upgrade | 18 Eisen | 3x Ammunition |
| Air Support | 30 Eisen | Unterstützung |

### Ressourcen (pro Aktivierung)
| Team | Eisen | Gold |
|------|-------|------|
| Deutschland | 5 | 2 |
| USA | 4 | 3 |

---

## 🎮 SPEZIAL-ITEM NUTZUNG

### Panzerschokolade (Kakaobohne)
1. Item im Inventar haben
2. In Hand nehmen
3. Rechtsklick oder einfach halten
4. Automatisch aktiviert (5s Cooldown)

### Panzer-Schub (Amethyst-Splitter)
1. Item im Inventar haben
2. In Hand nehmen
3. Rechtsklick aktiviert
4. Teleportiert nach vorne (5s Cooldown)

### Ressourcen (Holzaxt)
1. Holzaxt haben
2. Zu Ressourcen-Block laufen
3. Rechtsklick oder in Nähe stehen
4. Items fallen automatisch (2min Cooldown)

---

## 🏆 RÄNGE & LEVEL

### Level (1-5)
- Level 1: 0-999 BP
- Level 2: 1000-2999 BP
- Level 3: 3000-5999 BP
- Level 4: 6000-9999 BP
- Level 5: 10000+ BP → Prestige möglich!

### Rang nach Kills
- Rang 1: 0-99 Kills
- Rang 2: 100-499 Kills
- Rang 3: 500-999 Kills
- Rang 4: 1000-1999 Kills
- Rang 5: 2000-4999 Kills
- Rang 6: 5000-9999 Kills
- Rang 7: 10000+ Kills

---

## 🔥 TEAMKILL-SYSTEM

| Stufe | Teamkills | Effekt |
|-------|-----------|--------|
| 1 | 1 | Warnung (gelb) |
| 2 | 2-3 | Slowness I |
| 3 | 4 | Slowness II + Weakness |
| 4 | 5+ | 20min Ban |

---

## 🏅 WICHTIGE ACHIEVEMENTS

- **Dienstältester Gold**: 6000 Min Spielzeit
- **Materialschlacht Gold**: 1.000.000 Schüsse
- **Bollwerk Gold**: 10.000 Defense-Kills
- **Panzer-General Gold**: 2.500 Fahrzeuge zerstört
- **Sanitätsrat Gold**: 7.500 Heilungen
- **Der Unaufhaltsame**: 3x Prestige erreichen

---

## 📁 WICHTIGE DATEIEN

### Hauptfunktionen
- `main.mcfunction` - Master Loop
- `setup.mcfunction` - Initialisierung
- `level_system.mcfunction` - Level & Prestige
- `prestige_handler.mcfunction` - Prestige-Benachrichtigungen
- `achievements_check.mcfunction` - Achievements

### Shop-System
- `shop/nationen_shop.mcfunction` - Main Shop Handler
- `shop/main_shop_menu.mcfunction` - Shop UI
- `shop/shop_editor.mcfunction` - Admin Editor
- `shop/resource_block.mcfunction` - Ressourcen

### Spezial-Items
- `special_items/panzer_schokolade.mcfunction` - Deutsch Item
- `special_items/us_panzerschub.mcfunction` - US Item

---

## 🐛 TROUBLESHOOTING

### Shop funktioniert nicht
- Scores korrekt gesetzt? `/scoreboard objectives list`
- Tags korrekt? `/tag @s list`
- Trigger aktiviert? `/trigger open_shop set 1`

### Spezial-Items funktionieren nicht
- Item in der Hand?
- Richtige ID? (Kakao = Deutsch, Amethyst = US)
- Cooldown abgelaufen? (5 Sekunden)

### Ressourcen-Block nicht funktioniert
- Block existiert? `/tag @e[type=armor_stand] list`
- Holzaxt in der Hand?
- 2min Cooldown beachten?

### Admin-Menü nicht sichtbar
- Tag `wf_admin` haben? `/tag @s add wf_admin`
- Trigger richtig? `/trigger zx_admin_747 set 1`

---

**Fragen? Siehe SPEZIAL_ITEMS_SHOP.md für detaillierte Dokumentation!**
