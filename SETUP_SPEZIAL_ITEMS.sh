#!/bin/bash
# SETUP GUIDE für Westfront Spezial-Items & Shop System
# Führe diese Schritte durch um alles korrekt zu installieren

# 1. Ressourcen-Block platzieren (als Admin)
# Schreibe in die Chat:
/summon armor_stand 0 64 0 {CustomName:"\"resource_block\"",Invisible:1b,Invulnerable:1b,NoGravity:1b,Marker:1b}

# 2. Default-Preise setzen (einmalig, läuft aber auch auto in setup.mcfunction)
/scoreboard players set cfg_de_panzer_preis Config 20
/scoreboard players set cfg_de_granaten_preis Config 15
/scoreboard players set cfg_de_reparatur_preis Config 25
/scoreboard players set cfg_us_panzerschub_preis Config 20
/scoreboard players set cfg_us_munition_preis Config 18
/scoreboard players set cfg_us_airsupport_preis Config 30

# 3. Admin-Tag geben für Shop-Editor
/tag @s add wf_admin

# 4. Testen: Shop aufrufen
/trigger buy_de set 1
/trigger buy_us set 1

# 5. Shop-Editor öffnen (nur Admins)
/trigger shop_editor set 1

# 6. Spieler in Team einteilen
/tag @s add germany
/tag @s add usa

# FERTIG! System ist einsatzbereit.
