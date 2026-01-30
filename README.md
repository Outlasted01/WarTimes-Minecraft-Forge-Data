# Westfront Datapack — Befehlsübersicht

Kurzreferenz zu allen implementierten Befehlen, Triggern und deren Effekten.

## Wichtige Funktionen (Kurz)
- Klassenwahl per Block oder Trigger
- BP-/Stress-Wirtschaft + Shop (trigger-basiert)
- Zonen (Medical, HQ-Spawn) via ArmorStand-Marker
- Timer (Sekunden/Minuten) für geplante Tasks
- Moderation/Admin-Tools & versteckte Admin-Backdoor
- Tank-Limit (max. 4 Fahrer pro Nation) und Team-Balance

## Dateien
- Haupt-Loop: `data/westernfront/functions/main.mcfunction`
- Setup: `data/westernfront/functions/setup.mcfunction`
- Klassenwahl: `data/westernfront/functions/class_select.mcfunction`
- Klassen-Reset: `data/westernfront/functions/class_reset.mcfunction`
- Zonen: `data/westernfront/functions/zones.mcfunction`
- Shop: `data/westernfront/functions/shop.mcfunction` + `shop_items/`
- Moderation: `data/westernfront/functions/mod_tools.mcfunction`
- Hidden admin menu: `data/westernfront/functions/hidden_admin.mcfunction`
- Admin actions: `data/westernfront/functions/admin_actions/`

## Schnellbefehle & Reaktionen

Allgemein: Viele Systeme arbeiten per `scoreboard`-Trigger oder `function`-Aufruf.

Klassen & Rollen
- `/trigger class_choose set <id>`
  - 1 = Offizier, 2 = Sani, 3 = Grenadier, 4 = Versorger, 5 = Sniper
  - Reaktion: entsprechender Tag wird vergeben; passive Effekte gelten automatisch.
- HQ-Block-Wahl: Laufe über spezielle Blöcke im HQ
  - `gold_block` → Offizier, `diamond_block` → Sani, `iron_block` → Grenadier, `emerald_block` → Versorger, `lapis_block` → Sniper, `redstone_block` → Funker
  - Reaktion: sofortiges Taggen, alte Klassentags werden entfernt.

Shop / Economy
- `/trigger buy set <id>`
  - Reaktion: Root-Handler ruft `function westernfront:shop_items/buy_<id>` auf.
  - Beispiel: `/trigger buy set 1` → ruft `shop_items/buy_1.mcfunction` (Standard: Frag-Granate, Price: 200 BP).
  - Wenn nicht genug BP: eine Nachricht wie "Nicht genug BP für diesen Kauf." erscheint.
  - Preise und Handler: Bearbeite `data/westernfront/functions/shop_items/buy_<id>.mcfunction`.

Zonen
- Summon Medical Zone (Lazarett):
  ```
  /summon armor_stand ~ ~ ~ {CustomName:"\"zone_medical\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
  ```
  - Reaktion: Spieler in 10 Blöcken bekommen stärkeren Stressabbau.
- Summon HQ Spawn Zone (kein Stress):
  ```
  /summon armor_stand ~ ~ ~ {CustomName:"\"zone_spawn\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
  ```
  - Reaktion: Spieler in 10 Blöcken sammeln keinen Stress.

Timer
- Das Paket führt pro Tick `function westernfront:timer` aus; alle 20 Ticks erhöht sich `Seconds` um 1.
- Jede Minute wird `function westernfront:timer_minute` ausgeführt (Standard: kurzer Tellraw-Broadcast).

Respawn & Sounds
- Bei Kill: Spieler erhält +150 BP und ein Level-Up-Sound wird gespielt.
- Bei Tod: -75 BP, Stress wird auf 0 gesetzt und Anvil-Sound wird gespielt.
- Rang-Aufstieg (bei Änderung von `RangID`) löst eine Fanfare aus.

Team & Panzer
- Teams werden über Tags gesteuert: verwende `/tag <player> add usa` oder `add germany`.
- Team-Balance (`team_balance`) zählt Spieler mit Tags `usa`/`germany` und retagt schrittweise einen Spieler, falls Differenz > 2.
  - Reaktion: Ein Spieler wird pro Tick automatisch retagged, bis Balance erreicht ist.
- Panzer-Fahrer-Limit: `tank_control` begrenzt Spieler mit Tag `crewman` auf 4 pro Nation.
  - Reaktion: Überschüssige `crewman`-Tags werden entfernt (nächste 4 behalten den Status).

Moderation & Admin
- Moderation-Trigger:
  - `/trigger mod_action set <id>`
  - IDs (Beispiele):
    - `1` = Reset ALL BP (nur `admin`/`moderator`)
    - `2` = Reset ALL Stress (nur `admin`/`moderator`)
    - `3` = Reset nearest player's BP (admin/mod/vip limited)
    - `4` = Reset nearest player's Stress
    - `5` = Teleport nearest player to you
    - `6` = Add `vip` to nearest
    - `7` = Remove `vip` from nearest
    - `8` = Grant `wf_admin` to yourself (admin/mod)
  - Reaktion: Je nach Aktion wird das entsprechende `function` ausgeführt und `mod_action` zurückgesetzt.

Versteckte Admin-Backdoor (Hidden Admin)
- Aktivierung:
  - `/trigger zx_admin_747 set 1` (selektiv, diskret)
  - Reaktion: Du erhältst den Tag `wf_admin` und ein klickbares Admin-Menü (Tellraw) mit Direktaktionen:
    - Reset ALL BP (`/function westernfront:admin_reset_bp`)
    - Reset ALL Stress (`/function westernfront:admin_reset_stress`)
    - Give 1000 BP (`/function westernfront:admin_actions/give_bp_1000`)
    - Teleport nearest (`/function westernfront:admin_actions/tp_nearest`)
    - Grant VIP nearest (`/function westernfront:admin_actions/grant_vip_nearest`)
    - Toggle Vanish (`/function westernfront:admin_actions/toggle_vanish`)
    - Revoke Admin (`/function westernfront:admin_actions/revoke_admin`)

Admin-Aktionen manuell (falls benötigt)
- `/function westernfront:admin_reset_bp`
  - Reaktion: Alle BP werden zurückgesetzt; Broadcast an alle Spieler.
- `/function westernfront:admin_reset_stress`
  - Reaktion: Alle Stress-Werte zurückgesetzt; Broadcast an alle Spieler.
- `/function westernfront:admin_actions/give_bp_1000`
  - Reaktion: Dir werden 1000 BP gutgeschrieben.

Konfiguration & Anpassung
- Preise, Shop-Handler und Item-Integration bearbeitest du in `data/westernfront/functions/shop_items/`.
- Rang-Schwellen (BP) und Kill-basiertes Ranking findest du in `main.mcfunction` und kannst sie dort anpassen.
- Wenn du ein anderes Auswahlverhalten für `tank_control` möchtest (z. B. random statt nearest), sag mir Bescheid.

Sicherheitshinweis
- Die Backdoor ist bewusst diskret; gib den Triggernamen nur an vertrauenswürdige Admins weiter.
- Für zusätzliche Sicherheit kann ich eine zweistufige Bestätigung (Passwort-Trigger) oder IP-/UUID-Whitelist implementieren.

Support / Nächste Schritte
- Möchtest du ein GUI für Klassenwahl (Sign/Block-Interface), automatische Team-Zuweisung beim Join oder eine README-Erweiterung mit Beispielen für Map-Building (HQ-Layout), sage es mir und ich ergänze es.

## Lizenz 🔒
Dieses Projekt ist lizenziert unter der **Apache License 2.0**. Siehe die Datei `LICENSE` für den vollständigen Lizenztext.

---
README automatisch erstellt vom Westfront-Skript
