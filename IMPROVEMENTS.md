# WESTFRONT 44 - SYSTEM-VERBESSERUNGEN

## 🎮 VERBESSERTES LEVEL-SYSTEM

### Neues Level-System (Level 1-5)
Das neue Level-System ist an BP gebunden:
- **Level 1**: 0-999 BP
- **Level 2**: 1000-2999 BP
- **Level 3**: 3000-5999 BP
- **Level 4**: 6000-9999 BP
- **Level 5**: 10000+ BP

### Prestige-Mechanik
Wenn ein Spieler **Level 5** erreicht, kann er **Prestige** nehmen:
```
/trigger PrestigeReady set 1
```
**Effekte:**
- BP wird auf 0 zurückgesetzt
- Level wird auf 1 zurückgesetzt
- PrestigeCount erhöht sich um 1
- Explosion-Sound und Fanfare-Effekt
- Alle Spieler erhalten eine Benachrichtigung
- Spieler mit Prestige erhalten Glowing-Effekt

**Prestige-Achievements:**
- 1x Prestige: Spezial-Achievement
- 3x Prestige: "Der Unaufhaltsame" Achievement

---

## 🎯 VERBESSERTES TEAMKILL-SYSTEM

### Progressive Strafen (0-5 Stufen)

**Stufe 1 (1 Teamkill):**
- Warnung mit gelbem Icon ⚠
- Private Nachricht

**Stufe 2 (2-3 Teamkills):**
- Slowness I für 5 Sekunden
- Gold-farbige Warnung
- Villager-Sound ("Nein!")

**Stufe 3 (4 Teamkills):**
- Slowness II für 10 Sekunden
- Weakness I für 10 Sekunden
- Rote Warnung: "Noch ein Teamkill und du wirst gebannt!"
- Enderman-Schrei-Sound

**Stufe 4+ (5 Teamkills):**
- 20 Minuten Ban
- Teleportation zum Spawn
- Broadcast an alle Spieler
- Tag "banned" gesetzt
- Counter wird zurückgesetzt

### Teamkill-Tracking
- `TeamKills`: Aktueller Counter (wird bei Ban zurückgesetzt)
- `TeamKillsTotal`: Lebenslanger Counter (für Achievements)

---

## 🏅 VERBESSERTES ACHIEVEMENT-SYSTEM

### Kategorien & Meilensteine

**Spielzeit (PlayMinutes):**
- Bronze: 100 Minuten (1h 40m)
- Silber: 3000 Minuten (50h)
- Gold: 6000 Minuten (100h)

**Kugel-Verschießer (BulletsFired):**
- Bronze: 50,000 Schüsse
- Silber: 250,000 Schüsse
- Gold: 1,000,000 Schüsse

**Verteidigungs-Kills (DefKills):**
- Bronze: 500 Kills
- Silber: 2,500 Kills
- Gold: 10,000 Kills

**Runden-Gewinner (RoundsWonDE + RoundsWonUS):**
- Bronze: beide Seiten 50+ Siege
- Silber: beide Seiten 250+ Siege
- Gold: beide Seiten 500+ Siege

**Panzer-Zerstörer (VehiclesDestroyed):**
- Bronze: 100 Fahrzeuge
- Silber: 500 Fahrzeuge
- Gold: 2,500 Fahrzeuge

**Sanitätsrat (HealsRevives):**
- Bronze: 500 Heilungen/Belebungen
- Silber: 2,500 Heilungen/Belebungen
- Gold: 7,500 Heilungen/Belebungen

**Zusätzliche Achievements:**
- Stahlfresser: 1,000+ Panzer-Treffer einstecken
- Kameraden-Sip Legende: 12+ Events pro Jahr teilnehmen
- Erz-Landesverräter: 1,000+ Teamkills (geheimes Achievement)
- Der Unaufhaltsame: 3x Prestige oder Max Rang erreichen

---

## 📊 NEUE SCOREBOARD-OBJECTIVES

```
scoreboard objectives add Level dummy              # Aktuelles Level (1-5)
scoreboard objectives add PrestigeCount dummy      # Prestige-Zähler
scoreboard objectives add PrestigeReady trigger    # Prestige aktivieren
scoreboard objectives add LastLevel dummy          # Zur Nachricht-Verwaltung
```

---

## 🔧 VERWENDUNG DER NEUEN SYSTEME

### Level-Up verfolgen:
Der `RangID` wird automatisch berechnet und ist die höhere von:
- BP-basiertes Level (1-5)
- Kills-basierter Rang (1-7)

### Prestige nehmen:
```
/trigger PrestigeReady set 1
```

### Teamkill-Status überprüfen:
- `/scoreboard players get @s TeamKills` - Aktueller Counter
- `/scoreboard players get @s TeamKillsTotal` - Lebenslang

---

## 🎵 NEUE SOUND-EFFEKTE

- **Level-Up**: `entity.player.levelup`
- **Prestige**: `entity.dragon.fireball.explode`
- **Teamkill Warnung**: `entity.villager.no`
- **Hohe Teamkills**: `entity.enderman.scream`
- **Kill**: `entity.player.levelup` + Fanfare

---

## 📝 FUNKTIONS-DATEIEN

Neue/Modifizierte Dateien:
- `level_system.mcfunction` - Neues Level-System mit Prestige
- `prestige_handler.mcfunction` - Prestige-Verwaltung
- `teamkill_check.mcfunction` - Verbessertes Teamkill-System
- `achievements_check.mcfunction` - Erweitertes Achievement-System
- `setup.mcfunction` - Neue Scoreboards
- `main.mcfunction` - Integration aller neuen Systeme

---

**Version**: 2.0  
**Datum**: 2026-01-29  
**Status**: Alle Systeme aktiv und integriert
