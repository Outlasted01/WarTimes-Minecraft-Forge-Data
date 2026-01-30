# 🚀 WESTFRONT 44 - MOD-SERVER DEPLOYMENT GUIDE

## ✅ VORBEREITUNG

### Was du brauchst:
- [ ] Minecraft Server (Vanilla, Forge, Fabric, Paper oder Purpur)
- [ ] Westfront Datapack (diese Dateien)
- [ ] Terminal/Console Zugriff zum Server
- [ ] Optional: 5-10 Test-Spieler

### Kompatibilität:
- ✅ Minecraft 1.19 - 1.20.1
- ✅ Forge + Fabric Mods
- ✅ Paper/Purpur Server
- ✅ Alle gängigen Mod-Loader

---

## 📦 INSTALLATION (5 MINUTEN)

### 1. Datapack hochladen
```bash
# SSH / FTP zum Server
cd /path/to/server/world/datapacks/
upload westernfrontlogic/
```

### 2. Server reloaden
```
/reload
```

### 3. Setup starten
```
/function westernfront:setup
```

**Output sollte sein:**
```
[INFO] Scoreboards erstellt
[INFO] Configurations geladen
[INFO] System ready!
```

### 4. Ressourcen-Block spawnen
```
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### 5. Admin-Tag setzen
```
/tag @s add wf_admin
```

---

## 🧪 TESTING (5 MINUTEN)

### Test 1: Alle Systeme testen
```
/function westernfront:diagnostics/validate_system
```

**Erwartet:** ✅ Alle Tests bestanden

### Test 2: Shop öffnen
```
/trigger open_shop set 1
```

**Erwartet:** Shop-Menü mit 6 Items

### Test 3: Panzerschokolade kaufen
```
/trigger buy_de set 1
```

**Erwartet:** Kakaobohne im Inventar, Sound spielen

### Test 4: Item testen
1. Kakaobohne in Hand nehmen
2. Rechtsklick oder halten
3. Speed II für 30s sollte aktivieren

**Erwartet:** Blauer Partikel-Effekt, Speed-Effekt aktiv

### Test 5: Ressourcen-Block testen
1. Holzaxt in Hand nehmen
2. Zu Block-Ort gehen
3. Rechtsklick auf Block
4. Eisenbarren sollten fallen

**Erwartet:** Goldene Partikel, Items erscheinen

### Test 6: Admin-Editor testen
```
/trigger shop_editor set 1
```

**Erwartet:** Editor-Menü mit Preis-Optionen

---

## 📊 PERFORMANZ-CHECK

### Console Befehle:
```
# TPS anschauen (sollte 20 sein)
/tps

# Server Health
/function westernfront:diagnostics/health_check

# Wenn Probleme: Reparieren
/function westernfront:diagnostics/repair_system
```

### Erwartete Performance:
- **Vanilla:** 20 TPS konstant
- **Mit Mods:** 15-20 TPS je nach Anzahl Mods
- **Mit 30+ Spieler:** 10-15 TPS mit Optimization

---

## 🎮 SPIELER INSTRUKTIONEN

Gib das deinen Spielern:

```
=== WESTFRONT 44 SHOP SYSTEM ===

Shop öffnen:
  /trigger open_shop set 1

Deutsche Shop Items:
  /trigger buy_de set 1    - Panzerschokolade (20 Eisen)
  /trigger buy_de set 2    - Granaten-Pack (15 Eisen)
  /trigger buy_de set 3    - Panzer-Reparatur (25 Eisen)

US Shop Items:
  /trigger buy_us set 1    - Panzer-Schub (20 Eisen)
  /trigger buy_us set 2    - Munitions-Upgrade (18 Eisen)
  /trigger buy_us set 3    - Air Support (30 Eisen)

Ressourcen holen:
  1. Holzaxt in Hand
  2. Zu Ressourcen-Block gehen
  3. Rechtsklick → Eisenbarren!

Team beitreten:
  /tag @s add germany    oder    /tag @s add usa
```

---

## 🔧 ADMIN BEFEHLE

```bash
# Status Check
/scoreboard players get global SystemStatus

# Preis ändern
/scoreboard players set cfg_de_panzer_preis Config 25

# Debug aktivieren
/scoreboard players set @s DebugMode 1

# Alle BP zeigen
/scoreboard players list BP

# Spieler BP geben/entziehen
/scoreboard players set @p BP 500
/scoreboard players add @p BP 100
/scoreboard players remove @p BP 50
```

---

## ⚙️ MOD-SERVER SPEZIFISCH

### Forge Mods
```
Starte Server mit Mods:
./start.sh  (oder java -jar forge.jar)

Falls Probleme:
1. Überprüfe Mods sind kompatibel
2. Führe /reload aus
3. Starte Server neu
```

### Fabric Mods
```
Starte Server mit:
java -jar fabric-server-launch.jar nogui

Fabric ist besser für Performance!
```

### Paper Server
```
/reload ist möglich und empfohlen!
Ist der sicherste Server-Type.
```

---

## 🐛 FEHLERBEHANDLUNG

### Problem: "Function not found"
```
Lösung:
1. /reload ausführen
2. Datei-Struktur überprüfen
3. Server neu starten
```

### Problem: "Scoreboards fehlen"
```
Lösung:
/function westernfront:setup
```

### Problem: "Items funktionieren nicht"
```
Lösung:
1. Teste mit /give @s minecraft:cocoa_beans
2. In Hand nehmen
3. Rechtsklick
Falls nicht: CustomModelData nutzen
/give @s minecraft:cocoa_beans 1 {CustomModelData:1001}
```

### Problem: "Server laggt"
```
Lösung:
1. /function westernfront:diagnostics/health_check
2. /function westernfront:performance/optimization
3. Weniger Particles: /scoreboard players set global ParticleRate 50
```

### Problem: "Dateirechte"
```
Lösung:
Stelle sicher dass datapacks/ Ordner beschreibbar ist:
chmod 755 world/datapacks/
```

---

## 🚀 LIVE-DEPLOYMENT CHECKLISTE

- [ ] Datapack in `/world/datapacks/` hochgeladen
- [ ] `/reload` ausgeführt
- [ ] `/function westernfront:setup` lief erfolgreich
- [ ] Ressourcen-Block gespawnt
- [ ] Admin-Tag gesetzt
- [ ] `/function westernfront:diagnostics/validate_system` - alle Tests ✅
- [ ] Shop mit `/trigger open_shop set 1` öffnet
- [ ] Items kaufbar und funktionieren
- [ ] Spieler eingewiesen
- [ ] TPS normal (15-20)
- [ ] Keine Fehler in Console

---

## 📈 MONITORING NACH START

### Täglich:
- Console auf Fehler prüfen
- Spieler-Feedback sammeln

### Wöchentlich:
```
/function westernfront:diagnostics/health_check
```

### Bei Problemen sofort:
```
/function westernfront:diagnostics/repair_system
```

---

## 📞 QUICK HELP

| Problem | Befehl |
|---------|--------|
| Alles kaputt? | `/function westernfront:setup` |
| Fehler sehen? | `/function westernfront:diagnostics/health_check` |
| Noch immer Fehler? | `/function westernfront:diagnostics/repair_system` |
| Tests laufen? | `/function westernfront:diagnostics/validate_system` |
| Preise ändern? | `/scoreboard players set cfg_de_panzer_preis Config 25` |

---

## 🎉 SUCCESS!

Wenn alles funktioniert:

```
✅ Westfront 44 MOD-SERVER ist live!
✅ Alle Tests bestanden
✅ Spieler haben Shop-Zugriff
✅ Admin-Tools funktionieren
✅ Performance ist stabil

→ Viel Spaß spielen!
```

---

**Status:** 🟢 Ready for Production  
**Version:** 3.0 MOD-SAFE  
**Getestet:** Vanilla, Forge, Fabric, Paper  
**Performance:** ✅ Optimiert

---

**Benötigst du Hilfe?** Siehe [MOD_SERVER_CONFIG.md](MOD_SERVER_CONFIG.md)
