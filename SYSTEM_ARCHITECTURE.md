# WESTFRONT 44 - SYSTEM-ARCHITEKTUR 🏗️

```
┌─────────────────────────────────────────────────────────────────┐
│                    WESTFRONT MAIN LOOP                           │
│                   (main.mcfunction)                              │
└──────────────────────────────┬──────────────────────────────────┘
                                │
                ┌───────────────┼───────────────┐
                │               │               │
        ┌───────▼────────┐     │      ┌────────▼──────────┐
        │ SPEZIAL ITEMS  │     │      │  TEAM BALANCE     │
        └────────────────┘     │      └───────────────────┘
          • Panzer-          │
            schokolade         │      ┌────────────────────┐
          • Panzer-Schub       │      │  SHOP SYSTEMS      │
          • Cooldown-Tracker   │      └────────┬───────────┘
                               │               │
                      ┌────────▼────────┐      │
                      │  RESSOURCEN     │      │
                      │  BLOCK          │      │
                      └─────────────────┘      │
                                               │
                        ┌──────────────────────┼───────┐
                        │                      │       │
                   ┌────▼──────┐    ┌─────────▼────┐ │
                   │ DEUTSCHE   │    │ US SHOP      │ │
                   │ SHOP       │    │              │ │
                   ├────────────┤    ├──────────────┤ │
                   │ Panzer     │    │ Panzer-Schub │ │
                   │ Schoko     │    │ Munition     │ │
                   │ Granaten   │    │ Air Support  │ │
                   │ Reparatur  │    │              │ │
                   └────────────┘    └──────────────┘ │
                                                       │
                                    ┌──────────────────▼─────┐
                                    │ SHOP EDITOR (Admin)    │
                                    │ • Preis ändern        │
                                    │ • Items bearbeiten     │
                                    └───────────────────────┘
```

## 📊 DATEN-FLUSS

```
SPIELER AKTION
    │
    ├─ /trigger buy_de set 1 ──┬──> nationen_shop.mcfunction
    │                           │
    │                           └──> dynamic_pricing.mcfunction
    │                               │
    │                               └──> de_panzer_schokolade.mcfunction
    │                                   │
    └─ /trigger buy_us set 1 ──────────> Eisenbarren ✓
                                        │
                                        ├──> Effecte angewendet
                                        ├──> Sound gespielt
                                        └──> Broadcast gesendet
```

## 🎮 TRIGGER-STRUKTUR

```
┌─────────────────────────────────────┐
│         TRIGGER SYSTEM              │
├─────────────────────────────────────┤
│                                     │
│  /trigger open_shop set 1           │
│  └─> open_shop_trigger.mcfunction   │
│      └─> main_shop_menu.mcfunction  │
│                                     │
│  /trigger buy_de set <id>           │
│  └─> nationen_shop.mcfunction       │
│      └─> de_*.mcfunction            │
│                                     │
│  /trigger buy_us set <id>           │
│  └─> nationen_shop.mcfunction       │
│      └─> us_*.mcfunction            │
│                                     │
│  /trigger shop_editor set 1         │
│  └─> shop_editor.mcfunction         │
│      └─> shop_editor_menu.mcfunction│
│          └─> editor_de_1.mcfunction │
│                                     │
│  /trigger PrestigeReady set 1       │
│  └─> level_system.mcfunction        │
│                                     │
└─────────────────────────────────────┘
```

## 💾 SCOREBOARD-STRUKTUR

```
SPEZIAL-ITEMS TRACKING
├─ PanzerSchokoladeCooldown (0-100 Ticks)
├─ PanzerSchokoladeEffekt (0-600 Ticks)
├─ USPanzerschubCooldown (0-100 Ticks)
└─ ResourceBlockCooldown (0-2400 Ticks)

SHOP PREISE (Config)
├─ cfg_de_panzer_preis (default: 20)
├─ cfg_de_granaten_preis (default: 15)
├─ cfg_de_reparatur_preis (default: 25)
├─ cfg_us_panzerschub_preis (default: 20)
├─ cfg_us_munition_preis (default: 18)
└─ cfg_us_airsupport_preis (default: 30)

SHOP TRIGGER
├─ buy_de (1-3)
├─ buy_us (1-3)
├─ open_shop
└─ shop_editor

LEVEL-SYSTEM
├─ Level (1-5)
├─ PrestigeCount
├─ PrestigeReady
└─ LastLevel
```

## 📂 DATEI-HIERARCHIE

```
data/westernfront/functions/
│
├─ main.mcfunction (MASTER LOOP)
├─ setup.mcfunction (INITIALISIERUNG)
│
├─ special_items/
│  ├─ panzer_schokolade.mcfunction
│  ├─ panzer_schokolade_use.mcfunction
│  ├─ panzer_schokolade_activate.mcfunction
│  ├─ us_panzerschub.mcfunction
│  ├─ us_panzerschub_use.mcfunction
│  └─ us_panzerschub_activate.mcfunction
│
├─ shop/
│  ├─ nationen_shop.mcfunction (HANDLER)
│  ├─ main_shop_menu.mcfunction (UI)
│  ├─ open_shop_trigger.mcfunction
│  ├─ resource_block.mcfunction
│  ├─ resource_block_nearby.mcfunction
│  ├─ resource_spawn.mcfunction
│  ├─ shop_editor.mcfunction (ADMIN)
│  ├─ shop_editor_menu.mcfunction
│  ├─ editor_de_1.mcfunction
│  ├─ editor_de_2.mcfunction
│  ├─ editor_de_3.mcfunction
│  └─ dynamic_pricing.mcfunction
│
├─ shop_items/
│  ├─ de_panzer_schokolade.mcfunction
│  ├─ de_granaten.mcfunction
│  ├─ de_panzer_reparatur.mcfunction
│  ├─ us_panzerschub.mcfunction
│  ├─ us_munition_upgrade.mcfunction
│  └─ us_air_support.mcfunction
│
├─ level_system.mcfunction
├─ prestige_handler.mcfunction
├─ achievements_check.mcfunction
└─ ...
```

## 🔄 EXECUTION-ORDER

```
JEDER TICK (50ms):
1. main.mcfunction wird ausgeführt
2. Spezial-Items Handler (Cooldown-Reducer)
3. Ressourcen-Block Handler
4. Nationen-Shop Handler
5. Dynamic Pricing Check
6. Shop-Editor Handler
7. Shop-Menü Update
8. Level-System Update
9. Prestige-Handler
10. Achievements Check

Dann: Alle Team-Balance, Klassen-Systeme, etc.
```

## 🎯 BEISPIEL-FLOW: ITEM KAUFEN

```
SPIELER STARTET:
/trigger buy_de set 1

SYSTEM PRÜFT:
1. Hat Spieler wf_admin oder in germany/usa?
2. Kann Trigger verarbeitet werden?

NATIONEN_SHOP.MCFUNCTION:
1. Preis aus Config holen (cfg_de_panzer_preis = 20)
2. Spieler BP mit Preis vergleichen
3. Wenn genug: de_panzer_schokolade.mcfunction ausführen
4. Wenn nicht: Fehlermeldung

DE_PANZER_SCHOKOLADE.MCFUNCTION:
1. Kakaobohne ins Inventar geben
2. 20 Eisen (200 BP) abziehen
3. Cooldown auf 100 setzen
4. Sound spielen
5. Nachricht senden
6. Broadcast an alle

SPIELER HAT ITEM:
1. Item in Hand
2. Rechtsklick oder auto
3. panzer_schokolade_activate läuft
4. Speed II + Nausea gegeben
5. Effekt läuft 30/15 Sekunden
```

---

**Diese Architektur ermöglicht:**
✅ Einfache Preisanpassung ohne Code-Änderungen  
✅ Leichte Item-Hinzufügung (neue Dateien)  
✅ Admin-Kontrolle ohne Konsole  
✅ Team-spezifische Shops  
✅ Dynamische Effekte und Sounds  
✅ Umfassendes Tracking und Logging  
