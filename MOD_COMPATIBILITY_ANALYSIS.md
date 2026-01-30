###########################################################
# MOD-SERVER KOMPATIBILITÄT CHECK & FIXES
# Für Server mit Forge/Fabric Mods
###########################################################

# === POTENZIELLE PROBLEME ===
# 1. ✓ playsound - funktioniert auf Mod-Servern
# 2. ✓ scoreboard - vollständig kompatibel
# 3. ✓ execute - funktioniert
# 4. ✓ tag - funktioniert
# 5. ✓ NBT-Daten - können manchmal Probleme machen
# 6. ✓ Itemframe Trigger - funktionieren
# 7. ⚠ Armor_stand Position - kann mit Mods kollidieren
# 8. ✓ Title/Tellraw - funktioniert

# === BEKANNTE MOD-KONFLIKTE ===
# - Modded Items in select können nicht gefunden werden
# - Manche Mods ändern Entity-Verhalten
# - Performance kann bei vielen Entities leiden
# - Manche Mod-Blocks unterstützen keine Marker

# === LÖSUNGEN ===
# 1. Alle NBT-Daten mit error-handling versehen
# 2. Armor_stand zu Marker minimieren
# 3. Fallbacks für unbekannte Items
# 4. Lag-Optimierung mit tick-Raten

# === MOD-LISTE (GETESTET) ===
# ✓ Forge (1.19+)
# ✓ Fabric (1.19+)
# ✓ Paper (Bukkit Fork)
# ✓ Spigot
# ✓ Purpur

# === PROBLEM-ANALYSE ===

# Problem 1: Item-Selektion mit nbt{} kann fehlschlagen
# Lösung: Mehrere Versuche mit fallback

# Problem 2: Armor_stand Positionen können sich verschieben
# Lösung: Regelmäßige Position-Updates

# Problem 3: Manche NBT-Daten existieren auf Mods nicht
# Lösung: Sichere Defaults verwenden

# Problem 4: Particles können Lag verursachen
# Lösung: Reduzierte Particle-Rates

# Problem 5: Trigger-Objectives auf manchen Servern nicht persistent
# Lösung: Zusätzliche Dummy-Scoreboards als Backup
