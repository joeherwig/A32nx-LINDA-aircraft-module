-- Dummy user functions file
-- ===========================

-- This file is loaded right after main actions.lua script loaded.
-- You can use this file to:
-- 1. Override any functions or settings in main script
-- 2. Execute any desired startup sequence for this aircraft (i.e. your own c&d state macro)
-- 3. ... use your imagination

-- This file will not be replaced on the aircraft module update, so all of your modifications
-- will remain active. Best practice from this moment is DO NOT MAKE ANY CHANGES in original
-- actions.lua file. Make all the modifications HERE.

-- insert your code below here:


-- Just a message in console
_log("[USER] User's modifications script is loaded...")

mfd1Mode = 0
mfd1Range = 0
eicasEcam2Page = 1
eicasEcam2Functions = {"A32nx_EICAS_2_ECAM_PAGE_ENG","A32nx_EICAS_2_ECAM_PAGE_BLEED","A32nx_EICAS_2_ECAM_PAGE_PRESS","A32nx_EICAS_2_ECAM_PAGE_ELEC","A32nx_EICAS_2_ECAM_PAGE_HYD","A32nx_EICAS_2_ECAM_PAGE_FUEL","A32nx_EICAS_2_ECAM_PAGE_APU","A32nx_EICAS_2_ECAM_PAGE_COND","A32nx_EICAS_2_ECAM_PAGE_DOOR","A32nx_EICAS_2_ECAM_PAGE_WHEEL","A32nx_EICAS_2_ECAM_PAGE_FTCL","A32nx_EICAS_2_ECAM_PAGE_STS","A32nx_EICAS_2_ECAM_PAGE_cycle"}

-- ## AP / FCU #####################################

function A32nx_TOGGLE_FLIGHT_DIRECTOR()
     ipc.control(66288, 1)
end

function A32nx_SPD_Mode_Managed ()
     ipc.control(68066, 2)  
end 

function A32nx_SPD_Mode_Selected ()
     ipc.control(68066, 1)  
end 

function A32nx_HDG_Mode_Managed ()
     ipc.control(68065, 2)  
end 

function A32nx_HDG_Mode_Selected ()
     ipc.control(68065, 1)  
end 

function A32nx_ALT_Mode_Managed ()
     ipc.control(68067, 2)  
end 

function A32nx_ALT_Mode_Selected ()
     ipc.control(68067, 1)  
end 

function A32nx_VS_Mode_Managed ()
     ipc.control(68068, 2)  
end 

function A32nx_VS_Mode_Selected ()
     ipc.control(68068, 1)  
end 

function A32nx_AP_ON()
     ipc.control(65792,1)
end

function A32nx_AP_OFF()
     ipc.control(65791,1)
end

function A32nx_AP_LOC_HOLD()
     ipc.control(65723, 0)
end

function A32nx_AP_APR_HOLD()
     ipc.control(65724, 0)
end

function A32nx_AUTO_THROTTLE_TOGGLE()
     ipc.control(65860, 0)
end

function A32nx_TOGGLE_FLIGHT_DIRECTOR()
     ipc.control(66288, 1)
end

-- ## GlareShield #####################################

function A32nx_Autobreak_Off()
     ipc.control(66723, 0)
     DspShow ("A-BRK", "mid")
end

function A32nx_Autobreak_Low()
     ipc.control(66723, 2)
     DspShow ("A-BRK", "mid")
end

function A32nx_Autobreak_Mid()
     ipc.control(66723, 3)
     DspShow ("A-BRK", "mid")
end

function A32nx_Autobreak_Max()
     ipc.control(66723, 4)
     DspShow ("A-BRK", "max")
end

-- ## Overhead ADIRS #####################################

function A32nx_ADIRS_KNOB_1_OFF()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_1_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_1_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_1_INC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_1")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_1_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_1")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_1_SET(adirs1Knob)
     ipc.display("ADIRS 1 setting: " .. adirs1Knob .. "\n", 5)
     ipc.writeLvar("L:A32NX_ADIRS_KNOB_1", adirs1Knob) 
end

function A32nx_ADIRS_KNOB_2_OFF()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_2_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_2_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_2_INC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_2")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_2_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_2")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_2_SET(adirs1Knob)
     ipc.display("ADIRS 1 setting: " .. adirs1Knob .. "\n", 5)
     ipc.writeLvar("L:A32NX_ADIRS_KNOB_2", adirs1Knob) 
end

function A32nx_ADIRS_KNOB_3_OFF()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_3_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_3_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_3_INC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_3")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_3_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_3")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
     --ipc.display("ADIRS 1: " .. adirs1Knob .. "\n", 5)
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end
function A32nx_ADIRS_KNOB_3_SET(adirs1Knob)
     ipc.display("ADIRS 1 setting: " .. adirs1Knob .. "\n", 5)
     ipc.writeLvar("L:A32NX_ADIRS_KNOB_3", adirs1Knob) 
end


-- ## Overhead electrics #####################################

function A32nx_FCU_APPR_MODE_On()
	ipc.writeLvar("L:A32NX_FCU_APPR_MODE_ACTIVE", 1) 
     appr =  ipc.readLvar("L:A32NX_FCU_APPR_MODE_ACTIVE") 
     DspShow ("APPR", appr)
end

function A32nx_FCU_APPR_MODE_Off()
    ipc.writeLvar("L:A32NX_FCU_APPR_MODE_ACTIVE", 0)
    appr =  ipc.readLvar("L:A32NX_FCU_APPR_MODE_ACTIVE")
    DspShow ("APPR", appr)
end

function A32nx_WINDSHIELD_DEICE_OFF()
     DspShow ("Ptot", "-off")
     ipc.control(67225, 0)
end

function A32nx_WINDSHIELD_DEICE_ON()
     DspShow ("Ptot", "-on")
     ipc.control(67225, 1)
end

function A32nx_APU_Generator_OFF()
     ipc.control(66707, 0)
     DspShow ("APUG", "off")
end

function A32nx_APU_Generator_ON()
     ipc.control(66707, 1)
     DspShow ("APUG", "on")
end

-- # Flight controls #####################################
function A32nx_Spoiler_Arm_ON ()
    ipc.control(66068, 1)
end

function A32nx_Spoiler_Arm_OFF ()
    ipc.control(66068, 0)
end


-- ## MFD controls #####################################
-- MFD Mode --------------------------------------
function A32nx_MFD_NAV_MODE_1_LS()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 0)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

function A32nx_MFD_NAV_MODE_1_VOR()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 1)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

function A32nx_MFD_NAV_MODE_1_NAV()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 2)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

function A32nx_MFD_NAV_MODE_1_ARC()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 3)
     mfd1Mode = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

function A32nx_MFD_NAV_MODE_1_PLAN()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 4)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
     DspShow ("MFDr", mfd1Mode)
end

function A32nx_MFD_NAV_MODE_1_INC()
     mfd1Mode = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     if mfd1Mode >= 5 then mfd1Mode = 5 else mfd1Mode = mfd1Mode + 1 end
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", mfd1Mode)
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

function A32nx_MFD_NAV_MODE_1_DEC()
     mfd1Mode = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     if mfd1Mode <= 0 then mfd1Mode = 0 else mfd1Mode = mfd1Mode - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", mfd1Mode)
     ipc.display("MFD mode: " .. mfd1Mode .. "\n", 5)
end

-- MFD Range --------------------------------------
function A32nx_MFD_Range_1_10()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 0)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_20()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 1)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_40()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 2)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_80()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 3)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_160()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 4)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_320()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 5)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_INC()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range >= 5 then mfd1Range = 5 else mfd1Range = mfd1Range + 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

function A32nx_MFD_Range_1_DEC()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range <= 0 then mfd1Range = 0 else mfd1Range = mfd1Range - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
     ipc.display("MFD range: " .. mfd1Range .. "\n", 5)
end

-- ## EICAS ECAM Buttons #####################################

function A32nx_EICAS_2_ECAM_PAGE_ENG()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_ENG")
     eicasEcam2Page = 1
end

function A32nx_EICAS_2_ECAM_PAGE_BLEED()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_BLEED")
     eicasEcam2Page = 2
end

function A32nx_EICAS_2_ECAM_PAGE_PRESS()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_PRESS")
     eicasEcam2Page = 3
end

function A32nx_EICAS_2_ECAM_PAGE_ELEC()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_ELEC")
     eicasEcam2Page = 4
end

function A32nx_EICAS_2_ECAM_PAGE_HYD()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_HYD")
     eicasEcam2Page = 5
end

function A32nx_EICAS_2_ECAM_PAGE_FUEL()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_FUEL")
     eicasEcam2Page = 6
end

function A32nx_EICAS_2_ECAM_PAGE_APU()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_APU")
     eicasEcam2Page = 7
end

function A32nx_EICAS_2_ECAM_PAGE_COND()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_COND")
     eicasEcam2Page = 8
end

function A32nx_EICAS_2_ECAM_PAGE_DOOR()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_DOOR")
     eicasEcam2Page = 9
end

function A32nx_EICAS_2_ECAM_PAGE_WHEEL()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_WHEEL")
     eicasEcam2Page = 10
end

function A32nx_EICAS_2_ECAM_PAGE_FTCL()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_FTCL")
     eicasEcam2Page = 11
end

function A32nx_EICAS_2_ECAM_PAGE_STS()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_STS")
     eicasEcam2Page = 12
end

function A32nx_EICAS_2_ECAM_PAGE_cycle()
     if type(_G[eicasEcam2Functions[eicasEcam2Page]]) == 'function' then
          assert(_G[eicasEcam2Functions[eicasEcam2Page]])()
     end
     if eicasEcam2Page >= 12 then eicasEcam2Page = 1 else eicasEcam2Page = eicasEcam2Page + 1 end
end