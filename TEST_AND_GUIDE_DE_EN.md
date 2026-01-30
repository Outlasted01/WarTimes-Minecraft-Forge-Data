TEST AND GUIDE — GERMAN (DE) / ENGLISH (EN)

---

**Kurz:** Diese Datei beschreibt, wie du alle Systeme testest (lokal auf dem Server) und was die erwarteten Ausgaben sind. Schritte sind in Deutsch und Englisch vorhanden.

**Wichtig:** Alle folgenden Commands müssen im Minecraft-Server-Chat (Operator / RCON) ausgeführt werden.

---

## 1) Schnell-Checks / Quick sanity checks

DE:
- Lade Datapack neu: `/reload`
- Initialisiere Scoreboards & Defaults: `/function westernfront:setup`
- Führe die 10-Point Validierung aus: `/function westernfront:diagnostics/validate_system`
- Optional Health-Check (zeigt SystemStatus & löst ggf. Repair aus): `/function westernfront:diagnostics/health_check`
- Manuelle Reparatur (wenn nötig): `/function westernfront:diagnostics/repair_system`

EN:
- Reload datapack: `/reload`
- Initialize scoreboards & defaults: `/function westernfront:setup`
- Run the 10-point validation: `/function westernfront:diagnostics/validate_system`
- Optional health check (shows SystemStatus & triggers repair if needed): `/function westernfront:diagnostics/health_check`
- Manual repair (if needed): `/function westernfront:diagnostics/repair_system`

---

## 2) Was die Validierung (`/function westernfront:diagnostics/validate_system`) prüft

DE:
Die Validierung führt diese Tests in dieser Reihenfolge aus (siehe `data/westernfront/functions/diagnostics/validate_system.mcfunction`):

1. Scoreboards (`BP`, `Level`, etc.) — Ausgabe: `[✅] BP Scoreboard OK` oder Fehler-Meldung.
2. Level System — setzt `Level` ggf. und meldet `Level System OK`.
3. Trigger System — legt temporäres `test_trigger` an und meldet `Trigger System OK`.
4. Shop Trigger (`buy_de`, `buy_us`, `open_shop`) — aktiviert Trigger und meldet `Shop Trigger OK`.
5. Item Detection — prüft, ob Spieler `minecraft:cocoa_beans` in der Hand hat; meldet `Item Detection OK` oder Info wenn leer.
6. Ressourcen-Block — prüft Entities namens `resource_block` und meldet Existenz oder Warnung.
7. Sound System — spielt `ui.button.click` und meldet `Sound System OK`.
8. Effect System — erteilt kurz `speed` und meldet `Effect System OK`.
9. Admin System — prüft Tag `wf_admin` und meldet Status.
10. Tag System — setzt temporären Tag `test_tag` und entfernt ihn; meldet `Tag System OK`.

Am Ende zeigt die Funktion eine zusammenfassende Erfolgsmeldung: `✅ ALLE TESTS BESTANDEN!` wenn alles in Ordnung ist.

EN:
The validation runs the following checks (see `data/westernfront/functions/diagnostics/validate_system.mcfunction`):

1. Scoreboards (`BP`, `Level`, etc.) — output: `[✅] BP Scoreboard OK` or error.
2. Level System — sets `Level` if needed and reports `Level System OK`.
3. Trigger System — creates a temporary `test_trigger` and reports `Trigger System OK`.
4. Shop triggers (`buy_de`, `buy_us`, `open_shop`) — enables triggers and reports `Shop Trigger OK`.
5. Item Detection — checks if player holds `minecraft:cocoa_beans`; reports `Item Detection OK` or an info message if empty.
6. Resource Block — checks for entities named `resource_block`, reports existence or warning.
7. Sound System — plays `ui.button.click` and reports `Sound System OK`.
8. Effect System — gives a short `speed` effect and reports `Effect System OK`.
9. Admin System — checks tag `wf_admin` and reports status.
10. Tag System — adds and removes a temporary `test_tag` and reports `Tag System OK`.

At the end the function prints a summary: `✅ ALL TESTS PASSED!` if all checks succeed.

---

## 3) Erwartete Ausgaben / Expected outputs

DE:
- Bei Erfolg: mehrere grüne `[✅]` Meldungen und am Ende `✅ ALLE TESTS BESTANDEN!`.
- Wenn Resource-Block fehlt: gelbe Warnung `Resource Block nicht gefunden - spawne mit: /summon armor_stand...`.
- Wenn Item nicht in Hand: blaue Info `Item Detection: Kein Item in Hand`.

EN:
- On success: several green `[✅]` messages and finally `✅ ALL TESTS PASSED!`.
- If resource block is missing: yellow warning `Resource Block not found - spawn with: /summon armor_stand...`.
- If item not held: blue info `Item Detection: No item in hand`.

---

## 4) Praktische Testbefehle / Practical test commands

DE (Beispiele):

- Reload + Setup:
```bash
/reload
/function westernfront:setup
```

- Volle Validierung:
```bash
/function westernfront:diagnostics/validate_system
```

- Health-Check (manuell auslösen):
```bash
/function westernfront:diagnostics/health_check
```

- Reparatur erzwingen:
```bash
/function westernfront:diagnostics/repair_system
```

- Item Detection testen (gib dir Cocoa Beans mit CustomModelData falls nötig):
```bash
/give @s minecraft:cocoa_beans 1
# oder mit CustomModelData (falls Mod-Item erzwungen werden soll):
/give @s minecraft:cocoa_beans 1 0 {CustomModelData:1001,display:{Name:'{"text":"Panzer-Schokolade"}'}}
```

- Resource Block manuell spawnen (falls nicht gefunden):
```bash
/summon armor_stand ~ ~ ~ {CustomName:"\"resource_block\"",Invisible:1b,Marker:1b}
```

EN (Examples):

- Reload + Setup:
```bash
/reload
/function westernfront:setup
```

- Full validation:
```bash
/function westernfront:diagnostics/validate_system
```

- Health check (manual):
```bash
/function westernfront:diagnostics/health_check
```

- Force repair:
```bash
/function westernfront:diagnostics/repair_system
```

- Test item detection (give cocoa beans, or with CustomModelData for modded item):
```bash
/give @s minecraft:cocoa_beans 1
# or with CustomModelData (to emulate modded item):
/give @s minecraft:cocoa_beans 1 0 {CustomModelData:1001,display:{Name:'{"text":"Panzer-Schokolade"}'}}
```

- Spawn resource block manually:
```bash
/summon armor_stand ~ ~ ~ {CustomName:"\"resource_block\"",Invisible:1b,Marker:1b}
```

---

## 5) Troubleshooting / Fehlerbehebung

DE:
- Resource Block fehlt: spawn manuell (siehe oben), dann `/function westernfront:diagnostics/validate_system` erneut ausführen.
- Item wird nicht erkannt: versuche `minecraft:cocoa` statt `minecraft:cocoa_beans`, oder gib das Item mit `CustomModelData` (Mod-Fallback testen).
- Scoreboards nicht vorhanden: `/function westernfront:setup` ausführen.
- SystemStatus=2 (Fehler): `/function westernfront:diagnostics/repair_system` ausführen; logs erscheinen für Admins.
- Server laggt: `/function westernfront:performance/optimization` ausführen und prüfe Mods.

EN:
- Resource block missing: spawn manually (see above), then rerun `/function westernfront:diagnostics/validate_system`.
- Item not detected: try `minecraft:cocoa` instead of `minecraft:cocoa_beans`, or give item with `CustomModelData` to test mod fallback.
- Scoreboards missing: run `/function westernfront:setup`.
- SystemStatus=2 (error): run `/function westernfront:diagnostics/repair_system`; admin logs will appear.
- Server lag: run `/function westernfront:performance/optimization` and review installed mods.

---

## 6) Weitere Hinweise & Admin-Commands / Extra notes

DE:
- Debug Mode für Admins aktivieren:
```bash
/scoreboard players set <yourname> DebugMode 1
```
- Admin-spezifische Nachrichten erscheinen nur für Spieler mit `tag=admin`.
- Health-Check ist geplant per `schedule` alle 6000t (5 Minuten). Du kannst das Intervall in `data/westernfront/functions/diagnostics/error_logging.mcfunction` anpassen.

EN:
- Enable Debug Mode for admins:
```bash
/scoreboard players set <yourname> DebugMode 1
```
- Admin-specific messages only show for players with `tag=admin`.
- The health-check is scheduled every 6000 ticks (5 minutes). Adjust the interval in `data/westernfront/functions/diagnostics/error_logging.mcfunction` if needed.

---

## 7) Wo die relevanten Dateien sind / Where the relevant files are

- Setup: `data/westernfront/functions/setup.mcfunction`
- Validation: `data/westernfront/functions/diagnostics/validate_system.mcfunction`
- Health-Check: `data/westernfront/functions/diagnostics/health_check.mcfunction`
- Repair: `data/westernfront/functions/diagnostics/repair_system.mcfunction`
- Error Logging: `data/westernfront/functions/diagnostics/error_logging.mcfunction`
- Performance: `data/westernfront/functions/performance/optimization.mcfunction`

---

Wenn du möchtest, kann ich jetzt:
- die Datei als gedruckte Checkliste anpassen,
- Beispiel-RCON-Skripte erstellen, oder
- die Validations-Funktionen erweitern, um automatisch Log-Dateien auf dem Server abzulegen.

Sag mir, welche der drei Optionen du möchtest, dann mache ich es als Nächstes.
