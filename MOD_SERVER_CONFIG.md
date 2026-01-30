# 🎮 WESTFRONT 44 - MOD-SERVER KONFIGURATION

## 📋 SERVER-SETUP ANLEITUNG

### 1. SERVER-TYPEN (Getestet & Kompatibel)

✅ **Vanilla Server**
- Vollständig kompatibel
- Keine Anpassungen nötig
- Standard Minecraft 1.19+

✅ **Forge Server**
- Mit allen gängigen Mods kompatibel
- Item-Fallbacks aktiviert
- Performance-Optimierungen empfohlen

✅ **Fabric Server**
- Voll funktionsfähig
- Modded Items unterstützt
- Besser für Performance

✅ **Paper/Purpur Server**
- Optimiert für Bukkit-Plugins
- Extra Stabilität
- Empfohlen für große Server

❌ **Sponge Server** (Eingeschränkt)
- Einige Commands funktionieren nicht
- Workarounds verfügbar

---

## ⚙️ KONFIGURATION FÜR MOD-SERVER

### Forged-Server Einstellung (server.properties)

```properties
# Für optimale Performance mit Datapacks
max-tick-time=60000
enable-command-blocks=true
function-permission-level=2
```

### Fabric-Server Einstellung (server.properties)

```properties
# Fabric ist für Datapacks optimierter
max-tick-time=60000
enable-command-blocks=true
difficulty=2
pvp=true
```

### spigot.yml Anpassungen (Paper)

```yaml
settings:
  debug: false
  save-user-cache: true
  
world-settings:
  default:
    hunger:
      jump-sprint-exhaustion: 0.2
```

---

## 🛠️ INSTALLATION AUF MOD-SERVER

### Schritt 1: Datapack hochladen
```
Server-Root/world/datapacks/westernfrontlogic/
```

### Schritt 2: Reload durchführen
```
/reload
```

### Schritt 3: Setup starten
```
/function westernfront:setup
```

### Schritt 4: Ressourcen-Block spawnen
```
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### Schritt 5: Admin setzen
```
/tag @s add wf_admin
```

### Schritt 6: System testen
```
/trigger open_shop set 1
```

---

## 📊 PERFORMANCE EINSTELLUNGEN

### Für kleine Server (5-10 Spieler)
```
- Alle Features aktiv
- Normale Particle-Effekte
- Keine Optimierung nötig
```

### Für mittlere Server (10-30 Spieler)
```
- Particle-Rate auf 50% reduzieren
- Tick-Limiting aktivieren
- Performance/optimization.mcfunction laden
```

### Für große Server (30+ Spieler)
```
- Particle-Effekte minimieren
- Update-Rate auf 2 Ticks erhöhen
- Entity-Limiting aktivieren
- Diagnostics/health_check ausführen
```

---

## 🐛 MOD-KOMPATIBILITÄTS GUIDE

### Forge Mods

**Kompatibel:**
- ✅ Quark
- ✅ Twilight Forest
- ✅ The One Probe
- ✅ JEI (Just Enough Items)
- ✅ Baubles

**Mit Einschränkungen:**
- ⚠️ Tinker's Construct (Item-ID Konflikte möglich)
- ⚠️ Applied Energistics (Netzwerk-Last)

**Nicht kompatibel:**
- ❌ Grimdark (Worldgen Konflikte)
- ❌ Lycanites Mobs (Entity-Spawn Konflikte)

### Fabric Mods

**Kompatibel:**
- ✅ Lithium (Performance)
- ✅ Sodium (Rendering)
- ✅ Phosphor (Lighting)
- ✅ Starlight (Lighting)

**Mit Einschränkungen:**
- ⚠️ Carpet (Debug-Funktionen deaktivieren)

---

## 🔧 TROUBLESHOOTING

### Problem: Shop funktioniert nicht
**Lösung:**
```
/scoreboard objectives list
# Wenn objectives fehlen:
/function westernfront:setup
```

### Problem: Items werden nicht erkannt
**Lösung:**
```
# Teste mit standardem Item:
/give @s minecraft:cocoa_beans 1

# Falls nicht funktioniert, nutze CustomModelData:
/give @s minecraft:cocoa_beans 1 {CustomModelData:1001}
```

### Problem: Server laggt
**Lösung:**
```
# Aktiviere Performance-Optimierungen:
/function westernfront:performance/optimization

# Reduziere Particle-Effekte:
/scoreboard players set global ParticleRate 50
```

### Problem: Ressourcen-Block nicht sichtbar
**Lösung:**
```
# Überprüfe ob Block existiert:
/tag @e[name=resource_block] list

# Falls nicht, spawn wieder:
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}
```

### Problem: Fehler im Chat (Mod-Konflikt)
**Lösung:**
```
# Aktiviere Debug-Mode:
/scoreboard players set @s DebugMode 1

# Schaue nach Fehlern:
/function westernfront:diagnostics/health_check

# Falls Problem: Repariere System
/function westernfront:diagnostics/repair_system
```

---

## 📈 MONITORING & LOGS

### System Status überprüfen
```
/scoreboard players get global SystemStatus
```

### Error Count sehen
```
/scoreboard players get global ErrorCount
```

### Debug-Informationen aktivieren
```
/scoreboard players set @s DebugMode 1
```

### Logs überprüfen
```
# Server-Console für Fehler prüfen
# Oder die Spieler fragen ob Nachrichten fehlen
```

---

## 🚀 OPTIMIZATION TIPS

### 1. Scoreboard-Cleanup
```
# Manchmal sammeln sich alte Werte an
/scoreboard players reset * BP
# (Warnung: Setzt alle BP auf 0!)
```

### 2. Entity-Cleanup
```
# Entferne verwaiste Entities
/kill @e[type=armor_stand,name=!resource_block]
```

### 3. Tick-Limiting
```
# Erhöhe Updatezyklus auf 2 Ticks:
/scoreboard players set global TickLimit 2
```

### 4. Particle-Reduktion
```
# Schalte Effekte aus:
/scoreboard players set global ParticleRate 0
```

---

## 🎯 BEST PRACTICES FÜR MOD-SERVER

1. **Regelmäßig testen**
   - Wöchentlich: `/function westernfront:diagnostics/health_check`

2. **Backups machen**
   - Vor Major-Updates datapacks sichern

3. **Performance monitoren**
   - Nutze `/tps` command um Lag zu prüfen

4. **Spieler-Feedback sammeln**
   - Items/Preise basierend auf Feedback anpassen

5. **Mods kompatibel halten**
   - Nur getestete Mods verwenden
   - Mod-Updates überprüfen

---

## 📞 SUPPORT KONTAKTE

### Wenn etwas nicht funktioniert:

1. **Konsole prüfen** - Suche nach Fehlermeldungen
2. **Setup nochmal fahren** - `/function westernfront:setup`
3. **Health Check fahren** - `/function westernfront:diagnostics/health_check`
4. **Im Notfall reparieren** - `/function westernfront:diagnostics/repair_system`

---

## 📋 CHECKLISTE FÜR MOD-SERVER SETUP

- [ ] Server-Software (Forge/Fabric/Paper) installiert
- [ ] Westfront Datapack hochgeladen
- [ ] `/reload` ausgeführt
- [ ] `/function westernfront:setup` ausgführt
- [ ] Resource-Block gespawnt
- [ ] Admin-Tag gesetzt
- [ ] Shop getestet: `/trigger open_shop set 1`
- [ ] Items getestet: `/trigger buy_de set 1`
- [ ] Health-Check ausgeführt: `/function westernfront:diagnostics/health_check`
- [ ] Alle Spieler informiert

---

✅ **Dein Server ist nun MOD-READY!**

**Viel Spaß mit Westfront 44 auf dem Mod-Server!** 🚀
