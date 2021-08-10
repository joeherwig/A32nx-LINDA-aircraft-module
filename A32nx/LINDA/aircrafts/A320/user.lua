
-- Just a message in console
-- _log("[USER] User's modifications script is loaded...")
-- Debug-Message in-Sim
-- ipc.display("ABRK_set: ".. autoBrakeLevel,5)

mfd1MODE = 0
mfd1Range = 0
eicasEcam2Page = 1
bat1Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_1_PB_IS_AUTO")
bat2Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_2_PB_IS_AUTO")
eicasEcam2Functions = {"A32nx_EICAS_2_ECAM_PAGE_ENG","A32nx_EICAS_2_ECAM_PAGE_BLEED","A32nx_EICAS_2_ECAM_PAGE_PRESS","A32nx_EICAS_2_ECAM_PAGE_ELEC","A32nx_EICAS_2_ECAM_PAGE_HYD","A32nx_EICAS_2_ECAM_PAGE_FUEL","A32nx_EICAS_2_ECAM_PAGE_APU","A32nx_EICAS_2_ECAM_PAGE_COND","A32nx_EICAS_2_ECAM_PAGE_DOOR","A32nx_EICAS_2_ECAM_PAGE_WHEEL","A32nx_EICAS_2_ECAM_PAGE_FTCL","A32nx_EICAS_2_ECAM_PAGE_STS","A32nx_EICAS_2_ECAM_PAGE_cycle"}
autoBrakeLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
chronoLState = 0

-- ## Overhead CALLS #####################################
-- io
function A32nx_OVHD_CALLS_all()
    ipc.writeLvar("L:PUSH_OVHD_CALLS_ALL", 1)
end


-- ## Overhead Fuel ######################################
function A32nx_Fuel_Left_Tanks_1_on()
    ipc.writeLvar("L:XMLVAR_Momentary_PUSH_OVHD_FUEL_LTKPUMPS1_Pressed", 1)
end
-- ## Overhead ADIRS #####################################
function A32nx_ADIRS_KNOB_1_off()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_1_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_1_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_1_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_1_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_1_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_1_inc()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_1_MODE_SELECTOR_KNOB")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	A32nx_ADIRS_KNOB_1_set(adirs1Knob)
    DspShow ("ADIRS1", adirs1Knob)
end

function A32nx_ADIRS_KNOB_1_dec()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_1_MODE_SELECTOR_KNOB")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_1_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_1_set(adirs1Knob)
     ipc.writeLvar("L:A32NX_OVHD_ADIRS_IR_1_MODE_SELECTOR_KNOB", adirs1Knob)
     DspShow ("ADIR1", adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_off()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_2_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_2_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_2_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_inc()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_2_MODE_SELECTOR_KNOB")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	A32nx_ADIRS_KNOB_2_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_dec()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_2_MODE_SELECTOR_KNOB")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_2_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_2_set(adirs1Knob)
     ipc.writeLvar("L:A32NX_OVHD_ADIRS_IR_2_MODE_SELECTOR_KNOB", adirs1Knob)
     DspShow ("ADIR2", adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_off()
     adirs1Knob = 0
     A32nx_ADIRS_KNOB_3_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_NAV()
     adirs1Knob = 1
	A32nx_ADIRS_KNOB_3_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_ATT()
     adirs1Knob = 2
	A32nx_ADIRS_KNOB_3_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_inc()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_3_MODE_SELECTOR_KNOB")
     if adirs1Knob >= 2 then adirs1Knob = 2 else adirs1Knob = adirs1Knob + 1 end
	A32nx_ADIRS_KNOB_3_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_dec()
     adirs1Knob = ipc.readLvar("L:A32NX_OVHD_ADIRS_IR_3_MODE_SELECTOR_KNOB")
     if adirs1Knob <= 0 then adirs1Knob = 0 else adirs1Knob = adirs1Knob - 1 end
	A32nx_ADIRS_KNOB_3_set(adirs1Knob)
end

function A32nx_ADIRS_KNOB_3_set(adirs1Knob)
     ipc.writeLvar("L:A32NX_OVHD_ADIRS_IR_3_MODE_SELECTOR_KNOB", adirs1Knob)
     DspShow ("ADIR3", adirs1Knob)
end


-- ## Overhead AntiIce #####################################

function A32nx_WING_DEICE_toggle()
     ipc.control(66337, 0)
end

function A32nx_ENG_1_DEICE_toggle()
     ipc.control(66484, 0)
end

function A32nx_ENG_2_DEICE_toggle()
     ipc.control(66485, 0)
end

function A32nx_WINDSHIELD_DEICE_off()
     ipc.writeLvar("L:A32NX_MAN_PITOT_HEAT", 0)
end

function A32nx_WINDSHIELD_DEICE_on()
     ipc.writeLvar("L:A32NX_MAN_PITOT_HEAT", 1)
end

function A32nx_WINDSHIELD_DEICE_toggle()
    if ipc.readLvar("L:A32NX_MAN_PITOT_HEAT") <= 0
        then ipc.writeLvar("L:A32NX_MAN_PITOT_HEAT", 1)
    else
        ipc.writeLvar("L:A32NX_MAN_PITOT_HEAT", 0)
	end
end

-- ## Overhead Electics #####################################
-- $$ Ext Power
function A32nx_External_Power_on()
    ipc.writeLvar("L:A32NX_OVHD_ELEC_EXT_PWR_PB_IS_ON", 1)
    DspSPD ("ExtPwr","on    ")
end

function A32nx_External_Power_off()
    ipc.writeLvar("L:A32NX_OVHD_ELEC_EXT_PWR_PB_IS_ON", 0)
    DspSPD ("ExtPwr","off   ")
end

-- $$ Batteries
function A32nx_Bat1_set(bat1Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_BAT_1_PB_IS_AUTO", bat1Status)
end

function A32nx_Bat1_on()
    bat1Status = 1
	A32nx_Bat1_set(bat1Status)
end

function A32nx_Bat1_off()
     bat1Status = 0
	A32nx_Bat1_set(bat1Status)
end

function A32nx_Bat1_toggle()
     bat1Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_1_PB_IS_AUTO")
     ipc.display(bat1Status, 1)
     if bat1Status >= 1 then bat1Status = 0 else bat1Status = 1 end
	A32nx_Bat1_set(bat1Status)
end


function A32nx_Bat2_set(bat2Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_BAT_2_PB_IS_AUTO", bat2Status)
end

function A32nx_Bat2_on()
     bat2Status = 1
	A32nx_Bat2_set(bat2Status)
end

function A32nx_Bat2_off()
     bat2Status = 0
	A32nx_Bat2_set(bat2Status)
end

function A32nx_Bat2_toggle()
     bat2Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_2_PB_IS_AUTO")
     if bat2Status >= 1 then bat2Status = 0 else bat2Status = 1 end
	A32nx_Bat2_set(bat2Status)
end

-- $$ Generators
function A32nx_Gen1_set(Gen1Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_ENG_GEN_1_PB_IS_ON", Gen1Status)
end

function A32nx_Gen1_on()
    Gen1Status = 1
	A32nx_Gen1_set(Gen1Status)
end

function A32nx_Gen1_off()
     Gen1Status = 0
	A32nx_Gen1_set(Gen1Status)
end

function A32nx_Gen1_toggle()
     Gen1Status = ipc.readLvar("L:A32NX_OVHD_ELEC_ENG_GEN_1_PB_IS_ON")
     ipc.display(Gen1Status, 1)
     if Gen1Status >= 1 then Gen1Status = 0 else Gen1Status = 1 end
	A32nx_Gen1_set(Gen1Status)
end


function A32nx_Gen2_set(Gen2Status)
    ipc.writeLvar("L:A32NX_OVHD_ELEC_ENG_GEN_2_PB_IS_ON", Gen2Status)
end

function A32nx_Gen2_on()
     Gen2Status = 1
	A32nx_Gen2_set(Gen2Status)
end

function A32nx_Gen2_off()
     Gen2Status = 0
	A32nx_Gen2_set(Gen2Status)
end

function A32nx_Gen2_toggle()
     Gen2Status = ipc.readLvar("L:A32NX_OVHD_ELEC_ENG_GEN_2_PB_IS_ON")
     if Gen2Status >= 1 then Gen2Status = 0 else Gen2Status = 1 end
	A32nx_Gen2_set(Gen2Status)
end

-- $$ APU
function A32nx_APU_MASTER_set(apuMaster)
    ipc.writeLvar("L:A32NX_OVHD_APU_MASTER_SW_PB_IS_ON", APU_MASTERStatus)
end

function A32nx_APU_MASTER_on()
     APU_MASTERStatus = 1
	A32nx_APU_MASTER_set(APU_MASTERStatus)
end

function A32nx_APU_MASTER_off()
     APU_MASTERStatus = 0
	A32nx_APU_MASTER_set(APU_MASTERStatus)
end

function A32nx_APU_MASTER_toggle()
     APU_MASTERStatus = ipc.readLvar("L:A32NX_OVHD_APU_MASTER_SW_PB_IS_ON")
     if APU_MASTERStatus >= 1 then APU_MASTERStatus = 0 else APU_MASTERStatus = 1 end
	A32nx_APU_MASTER_set(APU_MASTERStatus)
end

function A32nx_APU_START_set(apuSTART)
    ipc.writeLvar("L:A32NX_OVHD_APU_START_PB_IS_ON", APU_STARTStatus)
end

function A32nx_APU_START_on()
     APU_STARTStatus = 1
	A32nx_APU_START_set(APU_STARTStatus)
end

function A32nx_APU_START_off()
     APU_STARTStatus = 0
	A32nx_APU_START_set(APU_STARTStatus)
end

function A32nx_APU_START_toggle()
     APU_STARTStatus = ipc.readLvar("L:A32NX_OVHD_APU_START_PB_IS_ON")
     if APU_STARTStatus >= 1 then APU_STARTStatus = 0 else APU_STARTStatus = 1 end
	A32nx_APU_START_set(APU_STARTStatus)
end

function A32nx_APU_Generator_off()
    ipc.control(66707, 0)
    DspShow ("APUG", "off   ")
end

-- io
function A32nx_APU_Generator_on()
     ipc.control(66707, 1)
     DspShow ("APUG", "on   ")
end
-- $$ APU pneu bleed -------------
function A32nx_OVHD_PNEU_APU_BLEED_set(apuPneyBleed)
    ipc.writeLvar("L:A32NX_OVHD_PNEU_APU_BLEED_PB_IS_ON", apuPneyBleed)
end

function  A32nx_OVHD_PNEU_APU_BLEED_on()
     apuPneyBleed = 1
	 A32nx_OVHD_PNEU_APU_BLEED_set(apuPneyBleed)
end

function  A32nx_OVHD_PNEU_APU_BLEED_off()
     apuPneyBleed = 0
	 A32nx_OVHD_PNEU_APU_BLEED_set(apuPneyBleed)
end

function  A32nx_OVHD_PNEU_APU_BLEED_toggle()
     apuPneyBleed = ipc.readLvar("L:A32NX_OVHD_PNEU_APU_BLEED_PB_IS_ON")
     if apuPneyBleed >= 1 then apuPneyBleed = 0 else apuPneyBleed = 1 end
	 A32nx_OVHD_PNEU_APU_BLEED_set(apuPneyBleed)
end

-- ## Master Warn+Caution #####################################
function A32nx_PUSH_AUTOPILOT_MASTERAWARN_L ()
    ipc.writeLvar("L:PUSH_AUTOPILOT_MASTERAWARN_L")
end

function A32nx_PUSH_AUTOPILOT_MASTERCAUT_L ()
    ipc.writeLvar("L:PUSH_AUTOPILOT_MASTERCAUT_L")
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
function A32nx_FCU_SPD_inc()
    ipc.activateHvar("H:A320_Neo_FCU_SPEED_INC")
end

function A32nx_FCU_SPD_dec()
    ipc.activateHvar("H:A320_Neo_FCU_SPEED_DEC")
end

function A32nx_FCU_SPD_MACH_TOGGLE_push()
    ipc.activateHvar("")
end

function A32nx_FCU_SPD_MODE_selected ()
    ipc.activateHvar("H:A320_Neo_FCU_SPEED_PULL")
    DspShow ("SPD", "set")
    SyncBackSPD (0, ipc.readUW(0x07E2), true)
end

function A32nx_SPD_MODE_managed ()
    ipc.activateHvar("H:A320_Neo_FCU_SPEED_PUSH")
    DspShow ("SPD", "mngd")
   	SyncBackSPD (0, ipc.readUW(0x07E2), true)
end
-- HEADING -----------------

function A32nx_HDG_MODE_selected ()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_PULL")
    DspShow ("HDG", "set")
    SyncBackHDG (0, ipc.readUW(0x07CC), true)
end

function A32nx_HDG_MODE_managed ()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_PUSH")
    DspShow ("HDG", "mngd")
    SyncBackHDG (0, ipc.readLvar("L:A320_Neo_FCU_HDG_SET_DATA"), true)
end

function A32nx_HDG_inc()
    ipc.activateHvar("H:A32NX_FCU_HDG_INC")
    ipc.sleep(20)
    SyncBackHDG (0, ipc.readLvar("L:A320_Neo_FCU_HDG_SET_DATA"), true)
end

function A32nx_HDG_incfast()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_INC")
    ipc.sleep(20)
    SyncBackHDG (0, ipc.readLvar("L:A320_Neo_FCU_HDG_SET_DATA"), true)
end

function A32nx_HDG_dec()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_DEC")
    ipc.sleep(20)
    SyncBackHDG (0, ipc.readLvar("L:A320_Neo_FCU_HDG_SET_DATA"), true)
end

function A32nx_HDG_decfast()
    ipc.activateHvar("H:A320_Neo_FCU_HDG_DEC")
    ipc.sleep(20)
    SyncBackHDG (0, ipc.readLvar("L:A320_Neo_FCU_HDG_SET_DATA"), true)
end

-- ALTITUDE -----------------
function A32nx_ALT_MODE_selected ()
    ipc.activateHvar("H:A320_Neo_FCU_ALT_PULL")
     DspShow ("ALT", "set")
     SyncBackALT (0, ipc.readUD(0x07D4), true)
end

function A32nx_ALT_MODE_managed ()
    ipc.activateHvar("H:A320_Neo_FCU_ALT_PUSH")
     DspShow ("ALT", "mngd")
     SyncBackALT (0, ipc.readUD(0x07D4), true)
end

function A32nx_ALT_inc()
     ipc.writeLvar("L:XMLVAR_Autopilot_Altitude_Increment", 100)
    MSFS_ALT_inc()
end

function A32nx_ALT_incfast()
     ipc.writeLvar("L:XMLVAR_Autopilot_Altitude_Increment", 1000)
    MSFS_ALT_inc()
    DspALT (ipc.readUD(0x07D4))
end

function A32nx_ALT_dec()
    ipc.writeLvar("L:XMLVAR_Autopilot_Altitude_Increment", 100)
    MSFS_ALT_dec()
    DspALT (ipc.readUD(0x07D4))
end

function A32nx_ALT_decfast()
    ipc.writeLvar("L:XMLVAR_Autopilot_Altitude_Increment", 1000)
    MSFS_ALT_inc()
    DspALT (ipc.readUD(0x07D4))
end

function A32nx_FCU_ALT_show()
	local altSelected = round(ipc.readUD(0x07CC)/65536*3.28084/100)
    DspALT (altSelected)
end
-- VERTICAL SPEED -----------------
function A32nx_AP_VS_VAR_inc()
    ipc.activateHvar("H:AP_VS_VAR_INC")
end

function A32nx_AP_VS_VAR_dec()
    ipc.activateHvar("H:AP_VS_VAR_DEC")
end

function A32nx_VS_MODE_selected ()
    ipc.activateHvar("H:A320_Neo_FCU_VS_PULL")
    DspShow ("VS", "set")
    SyncBackVVS (0, ipc.readUW(0x07F2), true)
end

function A32nx_VS_MODE_managed ()
    ipc.activateHvar("H:A320_Neo_FCU_VS_PUSH")
     DspShow ("VS", "mngd")
     SyncBackVVS (0, ipc.readUW(0x07F2), true)
end

function A32nx_AP_on()
     ipc.control(65792,1)
end

function A32nx_AP_off()
     ipc.control(65791,1)
end

function A32nx_AP_1_push()
    ipc.activateHvar("H:FCU_AP_1_PUSH")
end

function A32nx_AP_2_push()
    ipc.activateHvar("H:FCU_AP_2_PUSH")
end

function A32nx_FCU_AP_DISCONNECT_push()
    ipc.activateHvar("H:FCU_AP_DISCONNECT_PUSH")
end

function A32nx_AP_LOC_toggle()
     ipc.control(65723, 0)
end

function A32nx_AP_APR_toggle()
     ipc.control(65724, 0)
end

function A32nx_AUTO_THROTTLE_toggle()
     ipc.control(65860, 0)
end

function A32nx_FCU_APPR_MODE_toggle()
    --ipc.control(65724)
    ipc.activateHvar("H:FCU_APPR_PUSH")
    DspShow ("APPR", "tgl")
end

function A32nx_FCU_EXPED_push()
    ipc.activateHvar("H:FCU_EXPED_PUSH")
    DspShow ("EXPED", "tgl")
end

function A32nx_FCU_VVS_show()
	local vsSelected = ipc.readLvar("L:A32NX_AUTOPILOT_VS_SELECTED")
    ipc.display(vsSelected)
    DspVVSs(vsSelected)
end

-- ## GlareShield #####################################
function A32nx_chrono_L_set(chronoLState)
    ipc.writeLvar("L:PUSH_AUTOPILOT_CHRONO_L", chronoLState)
    ipc.display("Chrono Left: ".. chronoLState)
end

function A32nx_chrono_L_start()
    A32nx_chrono_L_set(1)
end

function A32nx_chrono_L_stop()
    A32nx_chrono_L_set(0)
end

function A32nx_chrono_L_reset()
    A32nx_chrono_L_set(2)
end

function A32nx_chrono_L_cycle()
    if chronoLState == 0 then
        chronoLState = 1
    elseif chronoLState == 1 then
        chronoLState = 0
    elseif chronoLState == 2 then
        chronoLState = 0
    end
    A32nx_chrono_L_set(chronoLState)
end

function A32nx_AUTOBRAKE_off()
     A32nx_AUTOBRAKE_set(0)
end

function A32nx_AUTOBRAKE_low()
     A32nx_AUTOBRAKE_set(1)
end

function A32nx_AUTOBRAKE_mid()
     A32nx_AUTOBRAKE_set(2)
end

function A32nx_AUTOBRAKE_max()
     A32nx_AUTOBRAKE_set(3)
end

function A32nx_AUTOBRAKE_low_toggle()
     if ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE") ~= 1 then A32nx_AUTOBRAKE_set(1) else A32nx_AUTOBRAKE_set(0) end
end

function A32nx_AUTOBRAKE_mid_toggle()
     if ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE") ~= 2 then A32nx_AUTOBRAKE_set(2) else A32nx_AUTOBRAKE_set(0) end
end

function A32nx_AUTOBRAKE_max_toggle()
     if ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE") ~= 3 then A32nx_AUTOBRAKE_set(3) else A32nx_AUTOBRAKE_set(0) end
end

function A32nx_AUTOBRAKE_set(autoBrakeLevel)
     ipc.writeLvar("L:A32NX_AUTOBRAKES_ARMED_MODE", autoBrakeLevel)
     local autoBrakeLevelText = {"off","low","mid","max"}
     DspShow ("A-BRK", autoBrakeLevelText[autoBrakeLevel+1])
end

function A32nx_AUTOBRAKE_inc()
     autoBrakeLevel = ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE")
     if autoBrakeLevel >= 3 then autoBrakeLevel = 3 else autoBrakeLevel = autoBrakeLevel + 1 end
	A32nx_AUTOBRAKE_set(autoBrakeLevel)
end

function A32nx_AUTOBRAKE_dec()
     autoBrakeLevel = ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE")
     if autoBrakeLevel <= 0 then autoBrakeLevel = 0 else autoBrakeLevel = autoBrakeLevel - 1 end
	A32nx_AUTOBRAKE_set(autoBrakeLevel)
end

function A32nx_AUTOBRAKE_cycle()
     autoBrakeLevel = ipc.readLvar("L:A32NX_AUTOBRAKES_ARMED_MODE")
     if autoBrakeLevel >= 3 then autoBrakeLevel = 0 else autoBrakeLevel = autoBrakeLevel + 1 end
	A32nx_AUTOBRAKE_set(autoBrakeLevel)
end

function A32nx_MFD_BTN_TERRONND_1_toggle()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_TERRONND_1")
end

-- # Flight controls #####################################
function A32nx_Spoiler_Arm_on ()
    ipc.control(66068, 1)
end

function A32nx_Spoiler_Arm_off ()
    ipc.control(66068, 0)
end


-- ## MFD 1 controls #####################################
-- MFD MODE --------------------------------------
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

function A32nx_MFD_NAV_MODE_1_ls()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 0)
     mfd1MODE = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_vor()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 1)
     mfd1MODE = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_nav()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 2)
     mfd1MODE = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_arc()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 3)
     mfd1MODE = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
end

function A32nx_MFD_NAV_MODE_1_plan()
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", 4)
     mfd1MODE = ipc.readLvar("A320_Neo_MFD_NAV_MODE_1")
     DspShow ("MFDr", mfd1MODE)
end

function A32nx_MFD_NAV_MODE_1_inc()
     mfd1MODE = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     if mfd1MODE >= 5 then mfd1MODE = 5 else mfd1MODE = mfd1MODE + 1 end
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", mfd1MODE)
end

function A32nx_MFD_NAV_MODE_1_dec()
     mfd1MODE = ipc.readLvar("L:A320_Neo_MFD_NAV_MODE_1")
     if mfd1MODE <= 0 then mfd1MODE = 0 else mfd1MODE = mfd1MODE - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_NAV_MODE_1", mfd1MODE)
end

-- MFD Range --------------------------------------
function A32nx_MFD_RANGE_1_10()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 0)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_20()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 1)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_40()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 2)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_80()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 3)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_160()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 4)
     mfd1Range = ipc.readLvar("A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_320()
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", 5)
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
end

function A32nx_MFD_RANGE_1_inc()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range >= 5 then mfd1Range = 5 else mfd1Range = mfd1Range + 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
end

function A32nx_MFD_RANGE_1_dec()
     mfd1Range = ipc.readLvar("L:A320_Neo_MFD_Range_1")
     if mfd1Range <= 0 then mfd1Range = 0 else mfd1Range = mfd1Range - 1 end
     ipc.writeLvar("L:A320_Neo_MFD_Range_1", mfd1Range)
end

-- ## EICAS ECAM Buttons #####################################

function A32nx_EICAS_2_ECAM_PAGE_eng()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_ENG")
     eicasEcam2Page = 1
end

function A32nx_EICAS_2_ECAM_PAGE_bleed()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_BLEED")
     eicasEcam2Page = 2
end

function A32nx_EICAS_2_ECAM_PAGE_press()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_PRESS")
     eicasEcam2Page = 3
end

function A32nx_EICAS_2_ECAM_PAGE_elec()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_ELEC")
     eicasEcam2Page = 4
end

function A32nx_EICAS_2_ECAM_PAGE_hyd()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_HYD")
     eicasEcam2Page = 5
end

function A32nx_EICAS_2_ECAM_PAGE_fuel()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_FUEL")
     eicasEcam2Page = 6
end

function A32nx_EICAS_2_ECAM_PAGE_apu()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_APU")
     eicasEcam2Page = 7
end

function A32nx_EICAS_2_ECAM_PAGE_cond()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_COND")
     eicasEcam2Page = 8
end

function A32nx_EICAS_2_ECAM_PAGE_door()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_DOOR")
     eicasEcam2Page = 9
end

function A32nx_EICAS_2_ECAM_PAGE_wheel()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_WHEEL")
     eicasEcam2Page = 10
end

function A32nx_EICAS_2_ECAM_PAGE_fctl()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_FTCL")
     eicasEcam2Page = 11
end

function A32nx_EICAS_2_ECAM_PAGE_sts()
     ipc.activateHvar("H:A320_Neo_EICAS_2_ECAM_CHANGE_PAGE_STS")
     eicasEcam2Page = 12
end

function A32nx_EICAS_2_ECAM_ALL_press()
    ipc.writeLvar("L:A32NX_ECAM_ALL_Push_IsDown", 1)
end
function A32nx_EICAS_2_ECAM_ALL_release()
    ipc.writeLvar("L:A32NX_ECAM_ALL_Push_IsDown", 0)
end

-- ## CDU left #####################################

function A32nx_CDU_1_BTN_dir()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DIR")
end

function A32nx_CDU_1_BTN_prog()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PROG")
end

function A32nx_CDU_1_BTN_perf()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PERF")
end

function A32nx_CDU_1_BTN_init()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_INIT")
end

function A32nx_CDU_1_BTN_data()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DATA")
end

function A32nx_CDU_1_BTN_fpln()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_FPLN")
end

function A32nx_CDU_1_BTN_rad()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_RAD")
end

function A32nx_CDU_1_BTN_fuel()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_FUEL")
end

function A32nx_CDU_1_BTN_sec()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_SEC")
end

function A32nx_CDU_1_BTN_atc()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_ATC")
end

function A32nx_CDU_1_BTN_menu()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_MENU")
end

function A32nx_CDU_1_BTN_airport()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_AIRPORT")
end

function A32nx_CDU_1_BTN_up()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_UP")
end

function A32nx_CDU_1_BTN_down()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DOWN")
end

function A32nx_CDU_1_BTN_prevpage()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PREVPAGE")
end

function A32nx_CDU_1_BTN_nextpage()
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

function A32nx_CDU_1_BTN_dot()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DOT")
end

function A32nx_CDU_1_BTN_plusminus()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_PLUSMINUS")
end

function A32nx_CDU_1_BTN_sp()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_SP")
end

function A32nx_CDU_1_BTN_div()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_DIV")
end

function A32nx_CDU_1_BTN_ovfy()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_OVFY")
end

function A32nx_CDU_1_BTN_clr()
    ipc.activateHvar("H:A320_Neo_CDU_1_BTN_CLR")
end
-- ## ENGINES #####################################
function A32nx_ENGINE_MODE_set(engMode)
    ipc.control(67017, engMode)
    ipc.control(67018, engMode)
end

function A32nx_ENGINE_MODE_crank()
    A32nx_ENGINE_MODE_set(0)
end

function A32nx_ENGINE_MODE_norm()
    A32nx_ENGINE_MODE_set(1)
end

function A32nx_ENGINE_MODE_start()
    A32nx_ENGINE_MODE_set(2)
end

function A32nx_ENGINE_1_on()
    ipc.writeLvar("L:A32NX_ENGINE_STATE:1", 1)
    DspShow ("Eng1", ipc.writeLvar("L:A32NX_ENGINE_STATE:1"))
end

function A32nx_ENGINE_1_off()
    ipc.writeLvar("L:A32NX_ENGINE_STATE:1", 2)
    DspShow ("Eng1", ipc.writeLvar("L:A32NX_ENGINE_STATE:1"))
end

function A32nx_ENGINES_MASTER_on()
    ipc.control(66224, 0)
end
function A32nx_ENGINES_MASTER_off()
    ipc.control(66531, 0)
end

-- ## TCAS #####################################
function A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
    ipc.writeLvar("L:A32NX_SWITCH_TCAS_Position", tcasSwitchPos)
    local tcasMODE = {"STBY","TA","TA/RA"}
    DspShow("TCAS",tcasMODE[tcasSwitchPos + 1 ])
end

function A32nx_TCAS_SWITCH_POS_stby()
    tcasSwitchPos = 0
    A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

function A32nx_TCAS_SWITCH_POS_ta()
    tcasSwitchPos = 1
    A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

function A32nx_TCAS_SWITCH_POS_tara()
    tcasSwitchPos = 2
    A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

function A32nx_TCAS_SWITCH_POS_inc()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos >= 2 then tcasSwitchPos = 2 else tcasSwitchPos = tcasSwitchPos + 1 end
	A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

function A32nx_TCAS_SWITCH_POS_dec()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos <= 0 then tcasSwitchPos = 0 else tcasSwitchPos = tcasSwitchPos - 1 end
	A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

function A32nx_TCAS_SWITCH_POS_cycle()
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    if tcasSwitchPos >= 2 then tcasSwitchPos = 0 else tcasSwitchPos = tcasSwitchPos + 1 end
	A32nx_TCAS_SWITCH_POS_set(tcasSwitchPos)
end

-- ## Test stuff ################
-- $$ Test
function dispRefresh ()
    val = ipc.readLvar("L:A32NX_AUTOPILOT_VS_SELECTED")
    val = ipc.readLvar("L:A32NX_AUTOPILOT_HEADING_SELECTED")
    DspHDG (val)
end