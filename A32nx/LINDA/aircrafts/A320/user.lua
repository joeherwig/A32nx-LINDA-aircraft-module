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
-- Debug-Message in-Sim
-- ipc.display("ABRK_SET: ".. autoBreakLevel,5)

mfd1Mode = 0
mfd1Range = 0
eicasEcam2Page = 1
eicasEcam2Functions = {"A32nx_EICAS_2_ECAM_PAGE_ENG","A32nx_EICAS_2_ECAM_PAGE_BLEED","A32nx_EICAS_2_ECAM_PAGE_PRESS","A32nx_EICAS_2_ECAM_PAGE_ELEC","A32nx_EICAS_2_ECAM_PAGE_HYD","A32nx_EICAS_2_ECAM_PAGE_FUEL","A32nx_EICAS_2_ECAM_PAGE_APU","A32nx_EICAS_2_ECAM_PAGE_COND","A32nx_EICAS_2_ECAM_PAGE_DOOR","A32nx_EICAS_2_ECAM_PAGE_WHEEL","A32nx_EICAS_2_ECAM_PAGE_FTCL","A32nx_EICAS_2_ECAM_PAGE_STS","A32nx_EICAS_2_ECAM_PAGE_cycle"}
autoBreakLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
chronoLState = 0

-- ## Overhead CALLS #####################################

function A32nx_OVHD_calls_ALL()
    ipc.writeLvar("L:PUSH_OVHD_CALLS_ALL", 1)
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
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_1_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_1")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_1_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_1_SET(adirs1Knob)
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
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_2_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_2")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_2_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_2_SET(adirs1Knob)
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
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_3_DEC()
     adirs1Knob = ipc.readLvar("L:A32NX_ADIRS_KNOB_3")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_3_SET(adirs1Knob) 
end

function A32nx_ADIRS_KNOB_3_SET(adirs1Knob)
     ipc.writeLvar("L:A32NX_ADIRS_KNOB_3", adirs1Knob) 
end

-- ## Overhead AntiIce #####################################

function A32nx_WINDSHIELD_DEICE_OFF()
     DspShow ("Ptot", "-off")
     ipc.control(67225, 0)
end

function A32nx_WINDSHIELD_DEICE_ON()
     DspShow ("Ptot", "-on")
     ipc.control(67225, 1)
end

-- ## Overhead Electics #####################################

function A32nx_Bat1_SET(bat1Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_BAT_10_PB_IS_AUTO", bat1Status)
end

function A32nx_Bat1_ON()
     bat1Status = 1
	A32nx_Bat1_SET(bat1Status) 
end

function A32nx_Bat1_OFF()
     bat1Status = 0
	A32nx_Bat1_SET(bat1Status) 
end

function A32nx_Bat1_TOGGLE()
     bat1Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_10_PB_IS_AUTO")
     if bat1Status >= 1 then bat1Status = 0 else bat1Status = 1 end
	A32nx_Bat1_SET(bat1Status) 
end


function A32nx_Bat2_SET(bat2Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_BAT_11_PB_IS_AUTO", bat2Status)
end

function A32nx_Bat2_ON()
     bat2Status = 1
	A32nx_Bat2_SET(bat2Status) 
end

function A32nx_Bat2_OFF()
     bat2Status = 0
	A32nx_Bat2_SET(bat2Status) 
end

function A32nx_Bat2_TOGGLE()
     bat2Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_11_PB_IS_AUTO")
     if bat2Status >= 1 then bat2Status = 0 else bat2Status = 1 end
	A32nx_Bat2_SET(bat2Status) 
end


function A32nx_APU_Generator_OFF()
    ipc.control(66707, 0)
    DspShow ("APUG", "off")
end

function A32nx_APU_Generator_ON()
     ipc.control(66707, 1)
     DspShow ("APUG", "on")
end


-- ## FCU #####################################
--	SyncBackHDG (0, ipc.readUW(0x07CC), true)
--	SyncBackALT (0, ipc.readUD(0x07D4), true)
--	SyncBackVVS (0, ipc.readUW(0x07F2), true)
--	SyncBackCRS (0, ipc.readUW(0x0C4E), true)
--	SyncBackCRS2 (0, ipc.readUW(0x0C5E), true)

function A32nx_PFD_BTN_FD_1()
     ipc.control(66288, 1)
end

function A32nx_PFD_BTN_LS_1()
    ipc.activateHvar("H:A320_Neo_PFD_BTN_LS_1")
end
-- SPEED -----------------

function A32nx_SPD_Mode_Selected ()
    ipc.activateHvar("H:A320_Neo_FCU_SPD_PUSH")
    DspShow ("SPD", "set")
    SyncBackSPD (0, ipc.readUW(0x07E2), true)
end

function A32nx_SPD_Mode_Managed ()
    ipc.activateHvar("H:A320_Neo_FCU_SPD_PUSH")
    DspShow ("SPD", "mngd")
   	SyncBackSPD (0, ipc.readUW(0x07E2), true)
end
-- HEADING -----------------

function A32nx_HDG_Mode_Selected ()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_PULL")
    DspShow ("HDG", "set")
    SyncBackHDG (0, ipc.readUW(0x07CC), true)
end

function A32nx_HDG_Mode_Managed ()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_PUSH")
    DspShow ("HDG", "mngd")
    SyncBackHDG (0, ipc.readUW(0x07CC), true)
end 
-- ALTITUDE -----------------
function A32nx_ALT_Mode_Selected ()
    ipc.activateHvar("H:A320_Neo_FCU_ALT_PULL")
     DspShow ("ALT", "set")
     SyncBackALT (0, ipc.readUD(0x07D4), true)
end

function A32nx_ALT_Mode_Managed ()
    ipc.activateHvar("H:A320_Neo_FCU_ALT_PUSH")
     DspShow ("ALT", "mngd")
     SyncBackALT (0, ipc.readUD(0x07D4), true)
end 

-- VERTICAL SPEED -----------------
function A32nx_VS_Mode_Selected ()
    ipc.activateHvar("H:A320_Neo_FCU_VS_PULL")
    DspShow ("VS", "set")
    SyncBackVVS (0, ipc.readUW(0x07F2), true)
end 

function A32nx_VS_Mode_Managed ()
    ipc.activateHvar("H:A320_Neo_FCU_VS_PUSH")
     DspShow ("VS", "mngd")
     SyncBackVVS (0, ipc.readUW(0x07F2), true)
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

function A32nx_FCU_APPR_MODE_TOGGLE()
    ipc.control(65724)
    --ipc.activateHvar("H:A320_Neo_FCU_APPR_PUSH")
end

-- function A32nx_FCU_EXPED_PUSH()
--    ipc.activateHvar("H:A320_Neo_FCU_EXPED_PUSH")
--    DspShow ("EXPED", "push")
--end

function A32nx_FCU_VVS_show()
	local vsSelected = ipc.readLvar("L:A32NX_AUTOPILOT_VS_SELECTED")
	DspShow("VS", vsSelected)
end

-- ## GlareShield #####################################
function A32nx_chrono_L_SET(chronoLState)
    ipc.writeLvar("L:PUSH_AUTOPILOT_CHRONO_L", chronoLState) 
    ipc.display("Chrono Left: ".. chronoLState)
end

function A32nx_chrono_L_START()
    A32nx_chrono_L_SET(1)
end

function A32nx_chrono_L_STOP()
    A32nx_chrono_L_SET(0)
end

function A32nx_chrono_L_RESET()
    A32nx_chrono_L_SET(2)
end

function A32nx_chrono_L_CYCLE()
    if chronoLState == 0 then 
        chronoLState = 1 
    elseif chronoLState == 1 then
        chronoLState = 0
    elseif chronoLState == 2 then
        chronoLState = 0
    end
    A32nx_chrono_L_SET(chronoLState)
end

function A32nx_Autobreak_Off()
     A32nx_Autobreak_SET(0) 
end

function A32nx_Autobreak_Low()
     A32nx_Autobreak_SET(1) 
end

function A32nx_Autobreak_Mid()
     A32nx_Autobreak_SET(2) 
end

function A32nx_Autobreak_Max()
     A32nx_Autobreak_SET(3) 
end

function A32nx_Autobreak_Low_Toggle()
     if ipc.readLvar("L:XMLVAR_Autobrakes_Level") > 0 then A32nx_Autobreak_SET(0) else A32nx_Autobreak_SET(1) end
end

function A32nx_Autobreak_Mid_Toggle()
     if ipc.readLvar("L:XMLVAR_Autobrakes_Level") > 0 then A32nx_Autobreak_SET(0) else A32nx_Autobreak_SET(2) end
end

function A32nx_Autobreak_Max_Toggle()
     if ipc.readLvar("L:XMLVAR_Autobrakes_Level") > 0 then A32nx_Autobreak_SET(0) else A32nx_Autobreak_SET(3) end
end

function A32nx_Autobreak_SET(autoBreakLevel)
     ipc.writeLvar("L:XMLVAR_Autobrakes_Level", autoBreakLevel) 
     local autoBreakLevelText = {"off","low","mid","max"}
     DspShow ("A-BRK", autoBreakLevelText[autoBreakLevel+1])
end

function A32nx_Autobreak_INC()
     autoBreakLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
     if autoBreakLevel >= 3 then autoBreakLevel = 3 else autoBreakLevel = autoBreakLevel + 1 end
	A32nx_Autobreak_SET(autoBreakLevel) 
end

function A32nx_Autobreak_DEC()
     autoBreakLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
     if autoBreakLevel <= 0 then autoBreakLevel = 0 else autoBreakLevel = autoBreakLevel - 1 end
	A32nx_Autobreak_SET(autoBreakLevel) 
end

function A32nx_Autobreak_CYCLE()
     autoBreakLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
     if autoBreakLevel >= 3 then autoBreakLevel = 0 else autoBreakLevel = autoBreakLevel + 1 end
	A32nx_Autobreak_SET(autoBreakLevel) 
end

function A32nx_MFD_BTN_TerrOnND_1_TOGGLE()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_TERRONND_1")
end

-- # Flight controls #####################################
function A32nx_Spoiler_Arm_ON ()
    ipc.control(66068, 1)
end

function A32nx_Spoiler_Arm_OFF ()
    ipc.control(66068, 0)
end


-- ## MFD 1 controls #####################################
-- MFD Mode --------------------------------------
function A32nx_MFD_BTN_CSTR_1()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_CSTR_1")
end

function A32nx_MFD_BTN_WPT_1()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_WPT_1")
end

function A32nx_MFD_BTN_VORD_1()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_VORD_1")
end

function A32nx_MFD_BTN_NDB_1()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_NDB_1")
end

function A32nx_MFD_BTN_ARPT_1()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_ARPT_1")
end

function A32nx_MFD_NAV_MODE_1_LS()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 0)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_VOR()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 1)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_NAV()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 2)
     mfd1Mode = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_ARC()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 3)
     mfd1Mode = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
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
end

function A32nx_MFD_NAV_MODE_1_DEC()
     mfd1Mode = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     if mfd1Mode <= 0 then mfd1Mode = 0 else mfd1Mode = mfd1Mode - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", mfd1Mode)
end

-- MFD Range --------------------------------------
function A32nx_MFD_Range_1_10()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 0)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_20()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 1)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_40()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 2)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_80()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 3)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_160()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 4)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_320()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 5)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
end

function A32nx_MFD_Range_1_INC()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range >= 5 then mfd1Range = 5 else mfd1Range = mfd1Range + 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
end

function A32nx_MFD_Range_1_DEC()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range <= 0 then mfd1Range = 0 else mfd1Range = mfd1Range - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
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

-- ## CDU left #####################################

function A32nx_CDU_1_BTN_DIR()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DIR")
end

function A32nx_CDU_1_BTN_PROG()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PROG")
end

function A32nx_CDU_1_BTN_PERF()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PERF")
end

function A32nx_CDU_1_BTN_INIT()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_INIT")
end

function A32nx_CDU_1_BTN_DATA()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DATA")
end

function A32nx_CDU_1_BTN_FPLN()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_FPLN")
end

function A32nx_CDU_1_BTN_RAD()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_RAD")
end

function A32nx_CDU_1_BTN_FUEL()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_FUEL")
end

function A32nx_CDU_1_BTN_SEC()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_SEC")
end

function A32nx_CDU_1_BTN_ATC()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_ATC")
end

function A32nx_CDU_1_BTN_MENU()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_MENU")
end

function A32nx_CDU_1_BTN_AIRPORT()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_AIRPORT")
end

function A32nx_CDU_1_BTN_UP()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_UP")
end

function A32nx_CDU_1_BTN_DOWN()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DOWN")
end

function A32nx_CDU_1_BTN_PREVPAGE()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PREVPAGE")
end

function A32nx_CDU_1_BTN_NEXTPAGE()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_NEXTPAGE")
end

function A32nx_CDU_1_BTN_L1()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L1")
end

function A32nx_CDU_1_BTN_L2()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L2")
end

function A32nx_CDU_1_BTN_L3()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L3")
end

function A32nx_CDU_1_BTN_L4()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L4")
end

function A32nx_CDU_1_BTN_L5()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L5")
end

function A32nx_CDU_1_BTN_L6()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L6")
end

function A32nx_CDU_1_BTN_R1()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R1")
end

function A32nx_CDU_1_BTN_R2()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R2")
end

function A32nx_CDU_1_BTN_R3()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R3")
end

function A32nx_CDU_1_BTN_R4()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R4")
end

function A32nx_CDU_1_BTN_R5()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R5")
end

function A32nx_CDU_1_BTN_R6()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R6")
end

function A32nx_CDU_1_BTN_A()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_A")
end

function A32nx_CDU_1_BTN_B()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_B")
end

function A32nx_CDU_1_BTN_C()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_C")
end

function A32nx_CDU_1_BTN_D()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_D")
end

function A32nx_CDU_1_BTN_E()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_E")
end

function A32nx_CDU_1_BTN_F()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_F")
end

function A32nx_CDU_1_BTN_G()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_G")
end

function A32nx_CDU_1_BTN_H()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_H")
end

function A32nx_CDU_1_BTN_I()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_I")
end

function A32nx_CDU_1_BTN_J()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_J")
end

function A32nx_CDU_1_BTN_K()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_K")
end

function A32nx_CDU_1_BTN_L()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_L")
end

function A32nx_CDU_1_BTN_M()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_M")
end

function A32nx_CDU_1_BTN_N()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_N")
end

function A32nx_CDU_1_BTN_O()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_O")
end

function A32nx_CDU_1_BTN_P()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_P")
end

function A32nx_CDU_1_BTN_Q()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_Q")
end

function A32nx_CDU_1_BTN_R()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_R")
end

function A32nx_CDU_1_BTN_S()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_S")
end

function A32nx_CDU_1_BTN_T()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_T")
end

function A32nx_CDU_1_BTN_U()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_U")
end

function A32nx_CDU_1_BTN_V()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_V")
end

function A32nx_CDU_1_BTN_W()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_W")
end

function A32nx_CDU_1_BTN_X()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_X")
end

function A32nx_CDU_1_BTN_Y()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_Y")
end

function A32nx_CDU_1_BTN_Z()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_Z")
end

function A32nx_CDU_1_BTN_1()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_1")
end

function A32nx_CDU_1_BTN_2()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_2")
end

function A32nx_CDU_1_BTN_3()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_3")
end

function A32nx_CDU_1_BTN_4()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_4")
end

function A32nx_CDU_1_BTN_5()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_5")
end

function A32nx_CDU_1_BTN_6()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_6")
end

function A32nx_CDU_1_BTN_7()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_7")
end

function A32nx_CDU_1_BTN_8()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_8")
end

function A32nx_CDU_1_BTN_9()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_9")
end

function A32nx_CDU_1_BTN_0()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_0")
end

function A32nx_CDU_1_BTN_DOT()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DOT")
end

function A32nx_CDU_1_BTN_PLUSMINUS()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PLUSMINUS")
end

function A32nx_CDU_1_BTN_SP()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_SP")
end

function A32nx_CDU_1_BTN_DIV()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DIV")
end

function A32nx_CDU_1_BTN_OVFY()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_OVFY")
end

function A32nx_CDU_1_BTN_CLR()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_CLR")
end

-- ## TCAS #####################################
function A32nx_TCAS_switch_pos_SET(tcasSwitchPos)
    ipc.writeLvar("L:A32NX_SWITCH_TCAS_Position", tcasSwitchPos) 
    local tcasMode = {"STBY","TA","TA/RA"}
    DspShow("TCAS",tcasMode[tcasSwitchPos + 1 ])
end

function A32nx_TCAS_switch_pos_STBY()
    tcasSwitchPos = 0
    A32nx_TCAS_switch_pos_SET(tcasSwitchPos)
end

function A32nx_TCAS_switch_pos_TA()
    tcasSwitchPos = 1
    A32nx_TCAS_switch_pos_SET(tcasSwitchPos)
end

function A32nx_TCAS_switch_pos_TARA()
    tcasSwitchPos = 2
    A32nx_TCAS_switch_pos_SET(tcasSwitchPos)
end

function A32nx_TCAS_switch_pos_INC()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos >= 2 then tcasSwitchPos = 2 else tcasSwitchPos = tcasSwitchPos + 1 end
	A32nx_TCAS_switch_pos_SET(tcasSwitchPos) 
end

function A32nx_TCAS_switch_pos_DEC()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos <= 0 then tcasSwitchPos = 0 else tcasSwitchPos = tcasSwitchPos - 1 end
	A32nx_TCAS_switch_pos_SET(tcasSwitchPos) 
end

function A32nx_TCAS_switch_pos_CYCLE()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos >= 2 then tcasSwitchPos = 0 else tcasSwitchPos = tcasSwitchPos + 1 end
	A32nx_TCAS_switch_pos_SET(tcasSwitchPos) 
end

