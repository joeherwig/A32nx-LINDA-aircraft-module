-- USER CONFIGURATION FOR AUTOSAVE
-- Updated for LINDA 2.8.9
-- Feb 17

-- All the settings here could be overridden on per-plane basis
-- by creating file config-user.lua in correspnding plane's configs folder
-- (i.e. SIM/Modules/linda-cfg/aircrafts/Cessna 172/config-user.lua)
-- Use the same variables there with new desired values.

-- Autosave feature settings
-- =========================

-- Global autosave feature enable/disable
AUTOSAVE_ENABLE = 1

-- Make LINDA also save the default flight named "_linda_default",
-- so you could set it as default flight in your sim and make next
-- flight start from the same place
AUTOSAVE_DEFAULT_FLIGHT = 1

-- Make LINDA also save the _plane_specific_ default flight named "_linda_lastpos_AircraftID",
-- so you could load it manualy if you have several planes in use
-- and want to fast resume their flights
AUTOSAVE_PLANE_FLIGHT = 1

-- Make separate save file for each airport (logfile mode)
AUTOSAVE_EACH_AIRFIELD = 0


-- What systems should be turned OFF to trigger the autosave action:

-- Engine should be off
AUTOSAVE_ENGINE_CHECK = 1

-- Magneto should be off
AUTOSAVE_MAGNETO_CHECK = 1

-- Main battery should be off
AUTOSAVE_BATTERY_CHECK = 1

-- All lights should be off
AUTOSAVE_LIGHTS_CHECK = 1

-- Parking brake should be set
AUTOSAVE_PARKING_CHECK = 1