-- ## FCU

-- $$ Autopilot Buttons
function A32nx_FCU_AP_1_toggle()
    DspShow('PARK',EvtPtr)
    ipc.control(EvtPtr + 0)
    DspShow('AP1','tgl')
end

function A32nx_FCU_AP_2_toggle()
    ipc.control(EvtPtr + 1)
    DspShow('AP2','tgl')
end

function A32nx_FCU_AP_Disconnect()
    ipc.control(EvtPtr + 2)
    DspShow('AP','disc')
end

function A32nx_FCU_ATHR_toggle()
    ipc.control(EvtPtr + 3)
    DspShow('ATHR','tgl')
end

function A32nx_FCU_ATHR_Disconnect()
    ipc.control(EvtPtr + 4)
    DspShow('ATHR','disc')
end

function A32nx_FCU_LOC_toggle()
    ipc.control(EvtPtr + 29)
    DspShow('LOC','tgl')
end

function A32nx_FCU_APPR_toggle()
    ipc.control(EvtPtr + 30)
    DspShow('ATHR','tgl')
end

function A32nx_FCU_EXPED_toggle()
    ipc.control(EvtPtr + 31)
    DspShow ("EXPD", "tgl")
end

-- $$ SPEED -----------------
function A32nx_FCU_SPD_inc()
    ipc.control(EvtPtr + 5)
    A32NX_DspSPD()
end

function A32nx_FCU_SPD_incfast()
    for i = 1, 5, 1 do
        ipc.control(EvtPtr + 5)
        A32NX_DspSPD()
    end
end

function A32nx_FCU_SPD_dec()
    ipc.control(EvtPtr + 6)
    A32NX_DspSPD()
end

function A32nx_FCU_SPD_decfast()
    for i = 1, 5, 1 do
        ipc.control(EvtPtr + 6)
        A32NX_DspSPD()
    end
end

function A32nx_FCU_SPD_MODE_selected ()
    ipc.control(EvtPtr + 9)
    DspShow ("SPD", "set")
    A32NX_DspSPD()
end

function A32nx_FCU_SPD_MODE_managed ()
    ipc.control(EvtPtr + 8)
    DspShow ("SPD", "mngd")
    A32NX_DspSPD()
end

-- $$ HEADING -----------------

function A32nx_FCU_HDG_inc()
    --ipc.control(65879,0)
    ipc.control(EvtPtr + 11)
    A32NX_DspHDG()
end

function A32nx_FCU_HDG_incfast()
    for i = 1, 5, 1 do
        --ipc.control(65879,0)
    ipc.control(EvtPtr + 11)
        A32NX_DspHDG()
    end
end

function A32nx_FCU_HDG_dec()
    --ipc.control(65880,0)
    ipc.control(EvtPtr + 12)
    A32NX_DspHDG()
end

function A32nx_FCU_HDG_decfast()
    for i = 1, 5, 1 do
        --ipc.control(65880,0)
        ipc.control(EvtPtr + 12)
        A32NX_DspHDG()
    end
end

function A32nx_FCU_HDG_MODE_selected ()
    --ipc.control(65815, 0)
    ipc.control(EvtPtr + 15)
    DspShow ("HDG", "set")
    ipc.sleep(200)
    A32NX_DspSPD()
end

function A32nx_FCU_HDG_MODE_managed ()
    --ipc.control(65807,0)
    ipc.control(EvtPtr + 14)
    DspShow ("HDG", "mngd")
    ipc.sleep(200)
    A32NX_DspSPD()
end

-- $$ ALTITUDE -----------------

function A32nx_FCU_ALT_inc()
    --ipc.control(65892,1)
    ipc.control(EvtPtr + 17)
    local AltStep = ipc.readLvar("L:XMLVAR_Autopilot_Altitude_Increment")
    local alt = round(getALTValue()/AltStep)*AltStep + AltStep
    --_loggg('alt=' .. alt)
    setALTValue(alt)
    ipc.control(66124, getALTValue())
    A32NX_DspALT()
end

function A32nx_FCU_ALT_dec()
    --ipc.control(65893,1)
    ipc.control(EvtPtr + 18)
    local AltStep = ipc.readLvar("L:XMLVAR_Autopilot_Altitude_Increment")
    local alt = round(getALTValue()/AltStep)*AltStep - AltStep
    --_loggg('alt=' .. alt)
    setALTValue(alt)
    ipc.control(66124, getALTValue())
    A32NX_DspALT()
end

function A32nx_FCU_ALT_MODE_selected ()
    --ipc.control(65816)
    ipc.control(EvtPtr + 21)
    DspShow ("ALT", "set")
    A32NX_DspALT()
end

function A32nx_FCU_ALT_MODE_managed ()
    --ipc.control(65808)
    ipc.control(EvtPtr + 20)
    DspShow ("ALT", "mngd")
    A32NX_DspALT()
end

function A32nx_FCU_ALT_STEP_100()
    ipc.writeLvar("XMLVAR_Autopilot_Altitude_Increment", 100)
    DspShow("STEP","100")
end

function A32nx_FCU_ALT_STEP_1000()
    ipc.writeLvar("XMLVAR_Autopilot_Altitude_Increment", 1000)
    DspShow("STEP","1000")
end

function A32nx_FCU_ALT_STEP_toggle()
    step = ipc.readLvar("XMLVAR_Autopilot_Altitude_Increment")
    if step == 100 then
        A32nx_FCU_ALT_STEP_1000()
    else
        A32nx_FCU_ALT_STEP_100()
    end
end

-- $$ VS

function A32nx_FCU_VS_inc()
    --ipc.control(65894)
    ipc.control(EvtPtr + 24)
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_dec()
    --ipc.control(65895)
    ipc.control(EvtPtr + 25)
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_MODE_push ()
    ipc.control(EvtPtr + 27)
    DspShow ("VS", "push")
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_MODE_pull ()
    ipc.control(EvtPtr + 28)
    DspShow ("VS", "pull")
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_MODE_selected ()
    --ipc.control(66101)
    ipc.control(EvtPtr + 28)
    DspShow ("VS", "set")
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_MODE_managed ()
    --ipc.control(66100)
    ipc.control(EvtPtr + 27)
    DspShow ("VS", "mngd")
    A32NX_DspVVS ()
end

function A32nx_FCU_VS_MODE_level_off ()
    ipc.control(EvtPtr + 26,0) -- zero rate of climb
    DspShow ("VS", "mngd")
    A32NX_DspVVS ()
end

function A32nx_FCU_FPA_MODE_toggle ()
    ipc.control(66099)
    DspShow ("FPA", "tog")
    A32NX_DspVVS (1)
    A32NX_DspHDGtxt()
end

-------------------------------------------------------

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

-- ## Overhead CALLS #####################################
-- io
function A32nx_OVHD_CALLS_all()
    ipc.writeLvar("L:PUSH_OVHD_CALLS_ALL", 1)
end

-- ## Overhead Fuel ######################################

function A32NX_OVHD_FUEL_PUMP_L1_on()
    if ipc.readUB(0x0b05) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('L1')
    end
end

function A32NX_OVHD_FUEL_PUMP_L1_off()
    if ipc.readUB(0x0b05) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('L1')
    end
end

function A32NX_OVHD_FUEL_PUMP_L1_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('L1')
end

--

function A32NX_OVHD_FUEL_PUMP_L2_on()
    if ipc.readUB(0x0b0B) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('L2')
    end
end

function A32NX_OVHD_FUEL_PUMP_L2_off()
    if ipc.readUB(0x0b0B) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('L2')
    end
end

function A32NX_OVHD_FUEL_PUMP_L2_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('L2')
end

--

function A32NX_OVHD_FUEL_PUMP_C1_on()
    if ipc.readUB(0x0b03) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('C1')
    end
end

function A32NX_OVHD_FUEL_PUMP_C1_off()
    if ipc.readUB(0x0b03) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('C1')
    end
end

function A32NX_OVHD_FUEL_PUMP_C1_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('C1')
end

--

function A32NX_OVHD_FUEL_PUMP_C2_on()
    if ipc.readUB(0x0b09) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('C2')
    end
end

function A32NX_OVHD_FUEL_PUMP_C2_off()
    if ipc.readUB(0x0b09) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('C2')
    end
end

function A32NX_OVHD_FUEL_PUMP_C2_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('C2')
end

--

function A32NX_OVHD_FUEL_PUMP_R1_on()
    if ipc.readUB(0x0b07) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('R1')
    end
end

function A32NX_OVHD_FUEL_PUMP_R1_off()
    if ipc.readUB(0x0b07) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('R1')
    end
end

function A32NX_OVHD_FUEL_PUMP_R1_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('R1')
end

--

function A32NX_OVHD_FUEL_PUMP_R2_on()
    if ipc.readUB(0x0b11) ~= 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('R2')
    end
end

function A32NX_OVHD_FUEL_PUMP_R2_off()
    if ipc.readUB(0x0b11) == 1 then
        A32NX_OVHD_FUEL_PUMP_toggle('R2')
    end
end

function A32NX_OVHD_FUEL_PUMP_R2_toggle()
    A32NX_OVHD_FUEL_PUMP_toggle('R2')
end

--

function A32NX_OVHD_FUEL_PUMP_toggle(p)
    if p == nil then return end
    if p == 'L1' then n = 2
    elseif p == 'L2' then n = 5
    elseif p == 'C1' then n = 1
    elseif p == 'C2' then n = 4
    elseif p == 'R1' then n = 3
    elseif p == 'R2' then n = 6
    else return end
    ipc.control(67191,n)
    DspShow('FPMP', p)
end

--

function A32NX_OVHD_FUEL_PUMP_ALL_toggle()
    A32NX_OVHD_FUEL_PUMP_L1_toggle()
    A32NX_OVHD_FUEL_PUMP_L2_toggle()
    A32NX_OVHD_FUEL_PUMP_C1_toggle()
    A32NX_OVHD_FUEL_PUMP_C2_toggle()
    A32NX_OVHD_FUEL_PUMP_R1_toggle()
    -- pump R2 remains on to prevent eng shutdown
    --A32NX_OVHD_FUEL_PUMP_R2_toggle()
end

function A32NX_OVHD_FUEL_PUMP_ALL_on()
    A32NX_OVHD_FUEL_PUMP_L1_on()
    A32NX_OVHD_FUEL_PUMP_L2_on()
    A32NX_OVHD_FUEL_PUMP_C1_on()
    A32NX_OVHD_FUEL_PUMP_C2_on()
    A32NX_OVHD_FUEL_PUMP_R1_on()
    A32NX_OVHD_FUEL_PUMP_R2_on()
end

function A32NX_OVHD_FUEL_PUMP_ALL_off()
    A32NX_OVHD_FUEL_PUMP_L1_off()
    A32NX_OVHD_FUEL_PUMP_L2_off()
    A32NX_OVHD_FUEL_PUMP_C1_off()
    A32NX_OVHD_FUEL_PUMP_C2_off()
    A32NX_OVHD_FUEL_PUMP_R1_off()
    -- pump R2 remains on to prevent eng shutdown
    --A32NX_OVHD_FUEL_PUMP_R2_off()
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

-- ## Overhead Electrics #####################################
-- $$ External Power
function A32nx_External_Power_toggle()
    ipc.control(67090, 0)
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
  function A32nx_Gen1_on()
    ipc.writeUW(0x0892, 2)
    DspShow ("Gen1", ipc.readUW(0x0892) )
end

function A32nx_Gen1_off()
    ipc.writeUW(0x0892, 0)
    DspShow ("Gen1", ipc.readUW(0x0892) )
end

function A32nx_Gen1_toggle()
     if ipc.readUW(0x0892) > 0
     then ipc.writeUW(0x0892, 0)
     else ipc.writeUW(0x0892, 2)
     end
end

function A32nx_Gen2_on()
    ipc.writeUW(0x092A, 2)
    DspShow ("Gen2", ipc.readUW(0x092A) )
end

function A32nx_Gen2_off()
    ipc.writeUW(0x092A, 0)
    DspShow ("Gen2", ipc.readUW(0x092A) )
end

function A32nx_Gen2_toggle()
     if ipc.readUW(0x092A) > 0
     then ipc.writeUW(0x092A, 0)
     else ipc.writeUW(0x092A, 2)
     end
end


-- ## Overhead Lights & Signs #####################################

-- $$ Lights
function A32nx_StrobeLts_on()
    ipc.execCalcCode("1 (>L:LIGHTING_STROBE_0) 1 (>L:STROBE_0_Auto) 1 0 r (>K:2:STROBES_SET)")
end
function A32nx_StrobeLts_auto()
    ipc.execCalcCode("0 (>L:LIGHTING_STROBE_0) 0 (>L:STROBE_0_Auto) 1 0 r (>K:2:STROBES_SET)")
end
function A32nx_StrobeLts_off()
    ipc.execCalcCode("2 (>L:LIGHTING_STROBE_0) 0 (>L:STROBE_0_Auto) 0 0 r (>K:2:STROBES_SET)")
end

function A32nx_BeaconLts_on()
    ipc.execCalcCode("0 1 (>K:2:BEACON_LIGHTS_SET)")
end
function A32nx_BeaconLts_off()
    ipc.execCalcCode("0 0 (>K:2:BEACON_LIGHTS_SET)")
end

function A32nx_RwyTurnLts_on()
    ipc.execCalcCode("1 s0 (>L:LIGHTING_TAXI_2) 2 l0 (>K:2:TAXI_LIGHTS_SET) 3 l0 (>K:2:TAXI_LIGHTS_SET)")
end
function A32nx_RwyTurnLts_off()
    ipc.execCalcCode("0 s0 (>L:LIGHTING_TAXI_2) 2 l0 (>K:2:TAXI_LIGHTS_SET) 3 l0 (>K:2:TAXI_LIGHTS_SET)")
end

function A32nx_LandingLts_L_Pos(pos)
    ipc.writeLvar("L:LIGHTING_LANDING_2", pos)
end
function A32nx_LandingLts_L_retract()
     A32nx_LandingLts_L_Pos(2)
end
function A32nx_LandingLts_L_off()
     A32nx_LandingLts_L_Pos(1)
end
function A32nx_LandingLts_L_on()
     A32nx_LandingLts_L_Pos(0)
end

function A32nx_LandingLts_R_Pos(pos)
    ipc.writeLvar("L:LIGHTING_LANDING_3", pos)
end
function A32nx_LandingLts_R_retract()
     A32nx_LandingLts_R_Pos(2)
end
function A32nx_LandingLts_R_off()
     A32nx_LandingLts_R_Pos(1)
end
function A32nx_LandingLts_R_on()
    A32nx_LandingLts_R_Pos(0)
end

function A32nx_LandingLts_Both_Pos(pos)
    A32nx_LandingLts_L_Pos(pos)
    A32nx_LandingLts_R_Pos(pos)
end
function A32nx_LandingLts_Both_retract()
     A32nx_LandingLts_L_Pos(2)
     A32nx_LandingLts_R_Pos(2)
end
function A32nx_LandingLts_Both_off()
     A32nx_LandingLts_L_Pos(1)
     A32nx_LandingLts_R_Pos(1)
end
function A32nx_LandingLts_Both_on()
     A32nx_LandingLts_L_Pos(0)
     A32nx_LandingLts_R_Pos(0)
end

function A32nx_NoseLts_TO()
    ipc.execCalcCode("0 (>L:LIGHTING_LANDING_1) 1 1 r (>K:2:LANDING_LIGHTS_SET) 0 1 r (>K:2:TAXI_LIGHTS_SET)")
end
function A32nx_NoseLts_taxi()
    ipc.execCalcCode("1 (>L:LIGHTING_LANDING_1) 0 1 r (>K:2:LANDING_LIGHTS_SET) 1 1 r (>K:2:TAXI_LIGHTS_SET)")
end
function A32nx_NoseLts_off()
    ipc.execCalcCode("2 (>L:LIGHTING_LANDING_1) 0 1 r (>K:2:LANDING_LIGHTS_SET) 0 1 r (>K:2:TAXI_LIGHTS_SET)")
end
-- $$ internal

function A32nx_EmerExitLts_Pos(pos)
    ipc.writeLvar("L:XMLVAR_SWITCH_OVHD_INTLT_EMEREXIT_Position", pos)
end
function A32nx_EmerExitLts_off()
     A32nx_EmerExitLts_Pos(2)
end
function A32nx_EmerExitLts_arm()
     A32nx_EmerExitLts_Pos(1)
end
function A32nx_EmerExitLts_on()
     A32nx_EmerExitLts_Pos(0)
end

-- $$ Signs
function A32nx_Seatbelt_on()
    ipc.writeLvar("L:XMLVAR_SWITCH_OVHD_INTLT_SEATBELT_Position", 1)
end
function A32nx_Seatbelt_off()
    ipc.writeLvar("L:XMLVAR_SWITCH_OVHD_INTLT_SEATBELT_Position", 0)
end

function A32nx_NoSmoking_Pos(pos)
    ipc.writeLvar("L:XMLVAR_SWITCH_OVHD_INTLT_NOSMOKING_Position", pos)
end

function A32nx_NoSmoking_off()
     A32nx_NoSmoking_Pos(2)
end

function A32nx_NoSmoking_auto()
     A32nx_NoSmoking_Pos(1)
end

function A32nx_NoSmoking_on()
    A32nx_NoSmoking_Pos(0)
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
function A32nx_MasterWarning_push ()
    ipc.writeLvar("L:A32NX_MASTER_WARNING")
end

function A32nx_MasterCaution_push ()
    ipc.writeLvar("L:A32NX_MASTER_CAUTION")
end

-- $$ BARO Reference
function A32nx_BARO_inc()
    ipc.control(65883,0)
    if BaroMode == 1 then
        ipc.control(65883,0)
        ipc.control(65883,0)
    end
    DspShow('BARO','inc')
end
function A32nx_BARO_dec()
    ipc.control(65884,0)
    if BaroMode == 1 then
        ipc.control(65884,0)
        ipc.control(65884,0)
    end
    DspShow('BARO','dec')
end
function A32nx_BARO_Mode_HPa()
    ipc.writeLvar("L:XMLVAR_Baro_Selector_HPA_1", 1)
    BaroMode = 1
    DspShow('BARO','HPa')
end
function A32nx_BARO_Mode_InHg()
    ipc.writeLvar("L:XMLVAR_Baro_Selector_HPA_1", 0)
    BaroMode = 0
    DspShow('BARO','InHg')
end
function A32nx_BARO_Mode_toggle()
    if ipc.readLvar("L:XMLVAR_Baro_Selector_HPA_1") == 0 then
        A32nx_BARO_Mode_HPa()
    else
        A32nx_BARO_Mode_InHg()
    end
end
function A32nx_BARO_qfe()
    ipc.writeLvar("L:XMLVAR_Baro1_Mode",0)
    BaroRef = 0
    DspShow('BARO', 'qfe')
end
function A32nx_BARO_qnh()
    ipc.writeLvar("L:XMLVAR_Baro1_Mode",1)
    BaroRef = 1
    DspShow('BARO', 'qnh')
end
function A32nx_BARO_std()
    ipc.writeLvar("L:XMLVAR_Baro1_Mode",2)
    DspShow('BARO', 'std')
end
function A32nx_BARO_pull()
    A32nx_BARO_std()
end
function A32nx_BARO_push()
    Lval = ipc.readLvar("L:XMLVAR_Baro1_Mode")
    if Lval == 0 then
        A32nx_BARO_qnh()
    elseif Lval == 1 then
        A32nx_BARO_qfe()
    elseif BaroRef > 0 then
        A32nx_BARO_qnh()
    else
        A32nx_BARO_qfe()
    end
end
function A32nx_BARO_toggle()
    Lval = ipc.readLvar("L:XMLVAR_Baro1_Mode")
    if Lval > 1 then
        A32nx_BARO_push()
    else
        A32nx_BARO_pull()
    end
end

-- ## MAIN PANEL #####################################

-- $$ Autobrake ---------------------------------

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

-- $$ Landing Gear Handle
function A32nx_MAIN_LANDING_GEAR_up()
    ipc.writeUD(0x0BE8, 0)
    DspShow('GEAR','up')
end
function A32nx_MAIN_LANDING_GEAR_down()
    ipc.writeUD(0x0BE8, 16383)
    DspShow('GEAR','down')
end
function A32nx_MAIN_LANDING_GEAR_toggle()
    if ipc.readUD(0x0BE8) > 0 then
        A32nx_MAIN_LANDING_GEAR_up()
    else
        A32nx_MAIN_LANDING_GEAR_down()
    end
end

-- $$ Terronnd
function A32nx_MFD_BTN_TERRONND_1_toggle()
    ipc.activateHvar("H:A320_Neo_MFD_BTN_TERRONND_1")
end

-- $$ Standby Chrono elapsed timer ##

function A32nx_STBY_CHRONO_elapsed_time_run ()
         ipc.writeLvar("L:A32NX_CHRONO_ET_SWITCH_POS", 0)
end

function A32nx_STBY_CHRONO_elapsed_time_stop ()
         ipc.writeLvar("L:A32NX_CHRONO_ET_SWITCH_POS", 1)
end

function A32nx_STBY_CHRONO_elapsed_time_reset ()
         ipc.writeLvar("L:A32NX_CHRONO_ET_SWITCH_POS", 2)
end

function A32nx_STBY_CHRONO_elapsed_time_up ()
local pos = ipc.readLvar("L:A32NX_CHRONO_ET_SWITCH_POS")
         if pos == 2 then
         A32nx_STBY_CHRONO_elapsed_time_stop ()
         else
            if pos == 1 then
            A32nx_STBY_CHRONO_elapsed_time_run ()
            end
         end
end

function A32nx_STBY_CHRONO_elapsed_time_down ()
local pos = ipc.readLvar("L:A32NX_CHRONO_ET_SWITCH_POS")
         if pos == 0 then
         A32nx_STBY_CHRONO_elapsed_time_stop ()
         else
            if pos == 1 then
            A32nx_STBY_CHRONO_elapsed_time_reset ()
            end
         end
end

function A32nx_STBY_CHRONO_elapsed_time_cycle ()
local pos = ipc.readLvar("L:A32NX_CHRONO_ET_SWITCH_POS")
          if pos == 0 then
          A32nx_STBY_CHRONO_elapsed_time_reset ()
          else
          A32nx_STBY_CHRONO_elapsed_time_up ()
          end
end
-- # Flight controls #####################################
function A32nx_Spoiler_Arm_on ()
    ipc.control(66068, 1)
end

function A32nx_Spoiler_Arm_off ()
    ipc.control(66068, 0)
end


-- ## MFD 1 controls #####################################
-- $$ MFD MODE --------------------------------------
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
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", 0)
     mfd1MODE = ipc.readLvar("A32NX_EFIS_L_ND_MODE")
end

function A32nx_MFD_NAV_MODE_1_vor()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", 1)
     mfd1MODE = ipc.readLvar("A32NX_EFIS_L_ND_MODE")
end

function A32nx_MFD_NAV_MODE_1_nav()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", 2)
     mfd1MODE = ipc.readLvar("A32NX_EFIS_L_ND_MODE")
end

function A32nx_MFD_NAV_MODE_1_arc()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", 3)
     mfd1MODE = ipc.readLvar("L:A32NX_EFIS_L_ND_MODE")
end

function A32nx_MFD_NAV_MODE_1_plan()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", 4)
     mfd1MODE = ipc.readLvar("A32NX_EFIS_L_ND_MODE")
     DspShow ("MFDr", mfd1MODE)
end

function A32nx_MFD_NAV_MODE_1_inc()
     mfd1MODE = ipc.readLvar("L:A32NX_EFIS_L_ND_MODE")
     if mfd1MODE >= 5 then mfd1MODE = 5 else mfd1MODE = mfd1MODE + 1 end
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", mfd1MODE)
end

function A32nx_MFD_NAV_MODE_1_dec()
     mfd1MODE = ipc.readLvar("L:A32NX_EFIS_L_ND_MODE")
     if mfd1MODE <= 0 then mfd1MODE = 0 else mfd1MODE = mfd1MODE - 1 end
     ipc.writeLvar("L:A32NX_EFIS_L_ND_MODE", mfd1MODE)
end

-- $$ MFD Range --------------------------------------
function A32nx_MFD_RANGE_1_10()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 0)
     mfd1Range = ipc.readLvar("A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_20()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 1)
     mfd1Range = ipc.readLvar("A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_40()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 2)
     mfd1Range = ipc.readLvar("A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_80()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 3)
     mfd1Range = ipc.readLvar("L:A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_160()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 4)
     mfd1Range = ipc.readLvar("A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_320()
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", 5)
     mfd1Range = ipc.readLvar("L:A32NX_EFIS_L_ND_RANGE")
end

function A32nx_MFD_RANGE_1_inc()
     mfd1Range = ipc.readLvar("L:A32NX_EFIS_L_ND_RANGE")
     if mfd1Range >= 5 then mfd1Range = 5 else mfd1Range = mfd1Range + 1 end
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", mfd1Range)
end

function A32nx_MFD_RANGE_1_dec()
     mfd1Range = ipc.readLvar("L:A32NX_EFIS_L_ND_RANGE")
     if mfd1Range <= 0 then mfd1Range = 0 else mfd1Range = mfd1Range - 1 end
     ipc.writeLvar("L:A32NX_EFIS_L_ND_RANGE", mfd1Range)
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

function A32nx_EICAS_2_ECAM_PAGE_next()
    ipc.writeLvar("L:A32NX_ECAM_ALL_Push_IsDown", 1)
    ipc.sleep(250)
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

-- ## PEDESTAL

-- $$ ENGINES #####################################

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
    ipc.control(67198, 1)
    ipc.control(66300, 0)
    -- DspShow ("Gen1", ipc.readUW(0x02C0) )
end

function A32nx_ENGINE_1_off()
    ipc.control(67197, 1)
    ipc.control(66300, 0)
    -- DspShow ("Gen1", ipc.readUW(0x02C0) )
end

function A32nx_ENGINE_2_on()
    ipc.control(67198, 2)
    ipc.control(66301, 0)
end

function A32nx_ENGINE_2_off()
    ipc.control(67197, 2)
    ipc.control(66302, 0)
end

function A32nx_ENGINES_MASTER_on()
    ipc.control(66224, 0)
end
function A32nx_ENGINES_MASTER_off()
    ipc.control(66531, 0)
end

-- $$ TCAS #####################################

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

-- $ Park Brake

function A32nx_PARK_BRAKE_on()
    ipc.writeLvar("L:A32NX_PARK_BRAKE_LEVER_POS", 1)
    DspShow('PARK','on')
end

function A32nx_PARK_BRAKE_off()
    ipc.writeLvar("L:A32NX_PARK_BRAKE_LEVER_POS", 0)
    DspShow('PARK','off')
end

function A32nx_PARK_BRAKE_toggle()
    if ipc.readLvar("L:A32NX_PARK_BRAKE_LEVER_POS") > 0 then
        A32nx_PARK_BRAKE_off()
    else
        A32nx_PARK_BRAKE_on()
    end
end

-- ## System functions   ##

-- Initial info on MCP display

function InitDsp ()
    if _MCP1() or _MCP2() then
        DspSPD(ipc.readLvar("A32NX_AUTOPILOT_SPEED_SELECTED"))
        DspHDG(ipc.readLvar("A32NX_AUTOPILOT_HEADING_SELECTED"))
        DspALT(getALTValue() / 100)
        DspVVS(ipc.readLvar("A32NX_AUTOPILOT_VS_SELECTED"))
    else -- MCP2a
        A32NX_DspSPDtxt()
        A32NX_DspHDGtxt()
        A32NX_DspALTtxt()
        A32NX_DspSPD()
        A32NX_DspHDG()
        A32NX_DspALT()
        A32NX_DspVVS()
    end
end


----------------------------------------------------------

-- display AP mode information
function A32NX_AP_INFO ()
    if _MCP2() then
        -- FD
        if ipc.readLvar('A32NX_MPL_FD') == 0 then
            DspFD(0)
        else
            DspFD(1)
        end
        -- ATHR
        if ipc.readLvar('A32NX_AUTOTHRUST_STATUS') == 0 then
            DspAT(0)
        else
            DspAT(1)
        end
        -- LNAV
        if ipc.readLvar('A32NX_AP_HDGmode_setDisp') == 1 then
            DspLNAV_on ()
        else
            DspLNAV_off ()
            A32NX_DspHDGmode(A32NX_HDGmode_Dot())
        end
        -- VNAV
        if ipc.readLvar('AP_AP_ALT_Mode') == 1 then
            DspVNAV_on ()
            A32NX_DspALTmode(true)
        else
            DspVNAV_off ()
            A32NX_DspALTmode(false)
        end
        local Var, str1, str2
        -- A/THR
        Var = ipc.readLvar('A32NX_AP_ATHR')
        DspAT(Var)
        -- AP1
        Var = ipc.readLvar('A32NX_AUTOPILOT_1_ACTIVE')
        if Var == 1 then
            str1 = ' 1AP'
        else
            str1 = ' -AP'
        end
        -- AP2
        Var = ipc.readLvar('A32NX_AUTOPILOT_2_ACTIVE')
        if Var == 1 then
            str1 = str1 .. '2 '
        else
            str1 = str1 .. '- '
        end
        -- ILS
        Var = ipc.readLvar('BTN_LS_1_FILTER_ACTIVE')
        if Var == 1 then
            str2 = ' ILS '
        else
            str2 = '     '
        end
        -- LOC or APPR
        if (ipc.readLvar('A32NX_FCU_LOC_MODE_ACTIVE') == 1) then
            str2 = str2 .. 'LOC'
        elseif (ipc.readLvar('A32NX_FCU_APPR_MODE_ACTIVE') == 1) then
            str2 = str2 .. 'APR'
        end
        FLIGHT_INFO1 = str1
        FLIGHT_INFO2 = str2
    elseif _MCP2a() then -- Airbus FCU
        local Var
        -- ILS
        Var = ipc.readLvar('BTN_LS_1_FILTER_ACTIVE')
        DspILS(Var)
        -- APs 1 & 2
        DspAPs(ipc.readLvar('A32NX_AUTOPILOT_1_ACTIVE'),
            ipc.readLvar('A32NX_AUTOPILOT_2_ACTIVE'))
        -- A/THR
        Var = ipc.readLvar('A32NX_AUTOTHRUST_STATUS')
        DspAT(Var)
        -- LOC
        Var = ipc.readLvar('A32NX_FCU_LOC_MODE_ACTIVE')
        DspLOC(Var)
        -- APPR
        Var = ipc.readLvar('A32NX_FCU_APPR_MODE_ACTIVE')
        if not A32NX_MODE then
            DspAPPR(Var)
        end
        -- reset flight information for Airbus MCP2a display
        FLIGHT_INFO1 = ""
        FLIGHT_INFO2 = ""
    end
    -- SPD/MACH labels
    A32NX_DspSPDtxt(ipc.readLvar('AUTOPILOT_MANAGED_SPEED_IN_MACH'))
    -- HDG/TRK labels
    A32NX_DspHDGtxt(ipc.readLvar("A32NX_TRK_FPA_MODE_ACTIVE"))
    -- ALT labels
    A32NX_DspALTtxt()
    -- ALT/VVS DspE to avoid cursor flicker
    A32NX_DspE()
    -- AP VALUES --
    A32NX_DspSPD ()
    A32NX_DspHDG ()
    A32NX_DspALT ()
    A32NX_DspVVS ()
end

-----------------------------------------------------------

-- Display Flight Information
function A32NX_FLIGHT_INFO ()
        FLIGHT_INFO1 = ""
        FLIGHT_INFO2 = ""
   -- end
end

-----------------------------------------------------------

-- $$ Display Functions

function A32NX_DspSPD()
    A32NX_spd = ipc.readLvar("A32NX_AUTOPILOT_SPEED_SELECTED")
    A32NX_spd_dashes = ipc.readLvar("A32NX_FCU_SPD_MANAGED_DASHES")
    A32NX_spd_dot = ipc.readLvar('A32NX_FCU_SPD_MANAGED_DOT')
    A32NX_mach = ipc.readUD(0x07E4)

    if A32NX_spd == nil then return end

    local strVal = A32NX_spd

    if A32NX_spd ~= -1 then
        if (tonumber(strVal) < 100) then
            A32NX_mach = 1
        else
            A32NX_mach = 0
        end
    end

    if A32NX_spd_dashes == 1 then
        strVal = '---'
    end

    if A32NX_spd_dot == 1 then
        if _MCP2a() then
            strVal = strVal .. string.char(7)
        else
            strVal = strVal .. '*'
        end
    end

    if not _MCP1() then
        DspSPDs(strVal, true)
        A32NX_DspSPDtxt(A32NX_mach)
    end
end

-----------------------------------------------------------

function A32NX_DspHDG ()
    A32NX_hdg = ipc.readLvar("A32NX_AUTOPILOT_HEADING_SELECTED")
    A32NX_hdg_dashes = ipc.readLvar("A32NX_FCU_HDG_MANAGED_DASHES")
    A32NX_hdg_dot = ipc.readLvar('A32NX_FCU_HDG_MANAGED_DOT')

    if A32NX_hdg == nil then return end

    --_loggg('h=' .. A32NX_hdg)

    local strVal = string.format("%03d", A32NX_hdg)

    --_loggg('hdg=' .. strVal)

    if A32NX_hdg_dashes == 1 then
        strVal = '---'
    end

    if A32NX_hdg_dot == 1 then
        if _MCP2a() then
            strVal = strVal .. string.char(7)
        else
            strVal = strVal .. '*'
        end
    end

    if not _MCP1() then
        DspHDGs(strVal, true)
    end
end

-----------------------------------------------------------

function A32NX_DspALT ()
    A32NX_alt = getALTValue()
    _logggg('alt=' .. tostring(A32NX_alt))
    if A32NX_alt == nil then return end
    if _MCP1() then return end
    DspALT(A32NX_alt/100)
    A32NX_DspALTmode()
end

-----------------------------------------------------------

function A32NX_DspVVS (force)
    if force == nil then
        force = 0
    end

	local VS_alt = 0
    local VS_val = ipc.readLvar("A32NX_AUTOPILOT_VS_SELECTED")
    local VS_mode = ipc.readLvar("A32NX_FCU_VS_MANAGED")
    local FPA_val = ipc.readLvar("A32NX_AUTOPILOT_FPA_SELECTED")
    local FPA_mode = ipc.readLvar("A32NX_TRK_FPA_MODE_ACTIVE")

    A32NX_DspHDGtxt(FPA_mode, force)

	-- ensure valid values to cope with initial start conditions
	if VS_val == nil then
		VS_val = 0
	end
	if VS_mode == nil then
		VS_mode = 0
	end
	if FPA_val == nil then
		FPA_val = 0
	end
	if FPA_mode == nil then
		FPA_mode == 0
	end
	
    if VS_mode == 1 then
        if _MCP2a() then
            DspVVSs("----")
            A32NX_VVS_Sign = '-'
        else
            DspVVS_AP_on()
            DspVVSs("----", true)
        end
    else
        DspVVS_AP_off()
        if FPA_mode == 0 then
            VS_alt = VS_val / 100
            DspVVS((VS_alt) * 1.0, 1)
            if VS_alt >= 0 then
                A32NX_VVS_Sign = '+'
            else
                A32NX_VVS_Sign = '-'
            end
        else  -- display FPA
            VS_alt = FPA_val
            _loggg('FPA=' .. VS_alt)
            DspFPA((VS_alt) * 1.0, 1)
            A32NX_VVS_Sign = ' '
        end
    end
end

-----------------------------------------------------------

-- function to stop DspE field flashing
function A32NX_DspE(val)
    if _MCP1() or _MCP2() then return end
    if val == nil then
        val = "0" .. A32NX_ALT_Dot .. "\\" .. A32NX_VVS_Sign
    end
    DspE(val, false)
end

-- AP mode dots
function A32NX_SPDmode_Dot ()
    SPD_mode_set = ipc.readLvar('A32nx_FCU_SPD_MANAGED_DOT')
    if SPD_mode_set == 1 then
        return true
    else
        return false
    end
end

function A32NX_HDGmode_Dot ()
    HDG_mode_set = ipc.readLvar('A32nx_FCU_HDG_MANAGED_DOT')
    if HDG_mode_set == 1 then
        return true
    else
        return false
    end
end

function A32NX_ALTmode_Dot ()
    ALT_mode = ipc.readLvar('L:AP_AP_ALT_Mode')
    if ALT_mode == 1 then
        return true
    else
        return false
    end
end

function A32NX_DspAP1_on()
    DspAP1(true)
end

function A32NX_DspAP1_off()
    DspAP1(false)
end

function A32NX_DspAP2_on()
    DspAP2(true)
end

function A32NX_DspAP2_off()
    DspAP2(false)
end

function A32NX_DspILS_on()
    DspILS(true)
end

function A32NX_DspILS_off()
    DspILS(false)
end

function A32NX_DspSPDtxt(i)
    if _MCP1() then return end
    -- SPD/MACH
    if _MCP2a() then
        if i == 1  then
            Dsp0('MACH')
        else
            Dsp0('SPD ')
        end
    else  -- MCP2
        if i == 1  then
            Dsp0('\\\\\\M')
            Dsp1('ACH\\')
        else
            Dsp0('\\\\\\S')
            Dsp1('PD \\')
        end
    end
end

function A32NX_DspHDGtxt(i)
    if _MCP1() or _MCP2() then return end
    if i == nil then
        i = ipc.readLvar("A32NX_TRK_FPA_MODE_ACTIVE")
    end
    -- HDG/TRK
    if i == 1 then
        Dsp2('TRK ')
        DspB(' TRK')
        DspC('FPA ')
        Dsp7(' FPA')
    else
        Dsp2('HDG ')
        DspB(' HDG')
        DspC('V/S ')
        Dsp7(' V/S')
    end
end

function A32NX_DspALTtxt()
    if _MCP1() or _MCP2() then return end
    -- ALT mode
    Dsp5('ALT ')
    DspD('\\\\\\0')
    --DspE('0\\\\\\')
end

function A32NX_DspInfoClear()
    if _MCP1() or _MCP2() then return end
    DspILS(false)
    DspLOC(false)
    DspAT(false)
    DspAPPR(false)
    Dsp1('    ', true) -- blank ILS
    Dsp9('    ', true) -- blank LOC
    Dsp3('    ', true) -- blank APs
    Dsp4('    ', true) -- blank AT
    DspB('    ', true) -- blank HDG
    DspC('    ', true) -- blank V/S
    Dsp6('    ', true) -- blank APPR
end

function A32NX_DspSPDmode (i)
	if dev == 0 then return end
    if _MCP1() then return end
    local val
    if _MCP2a() then
        if i == true then
   	        val = "\\\\\\" .. string.char(7)
        else
            val = "\\\\\\ "
        end
        Dsp8(val)
    else
        if i then
            A32NX_DspSPD_AP_on()
        else
            A32NX_DspSPD_AP_off()
        end
    end
end

function A32NX_DspMACHmode (i)
	if dev == 0 then return end
    if not _MCP2a() then return end
    local val
    if i == true then
   	    val = string.char(7) .. "\\\\\\"
    else
        val = " \\\\\\"
    end
    Dsp9(val)
end

function A32NX_DspHDGmode (i)
	if dev == 0 then return end
    if _MCP1() then return end
    local val
    if _MCP2a() then
        if i then
            val = "\\\\\\" .. string.char(7)
        else
   	        val = "\\\\\\ "
        end
        DspA(val)
    else -- MCP2
        if i then
            val = "\\\\\\*"
        else
            val = "\\\\\\ "
        end
        DspC(val)
    end
end

function A32NX_DspALTmode ()
	if dev == 0 then return end
    if _MCP1() then return end
    local Dot
    local val
    Dot = ipc.readLvar('A32NX_FCU_ALT_MANAGED')
    if Dot == 1 then
        if _MCP2a() then
            A32NX_ALT_Dot = A32NX_Dot
            A32NX_DspE()
        else
            val = "\\*\\\\"
            Dsp6(val)
        end
    else
        if _MCP2a() then
            A32NX_ALT_Dot = ' '
            A32NX_DspE()
        else
            val = "\\ \\\\"
            Dsp6(val)
        end
    end
end

function A32NX_DspSPD_AP_on ()
	if dev == 0 then return end
    if not _MCP2() then return end
    if ipc.readLvar("A32NX_AP_MACH_Select") == 0 then
   	    _sleep(20)
        com.write(dev, "DSP1\\\\*\\", 8)
    end
 end

function A32NX_DspSPD_AP_off ()
	if dev == 0 then return end
    if not _MCP2() then return end
    if ipc.readLvar("A32NX_AP_MACH_Select") == 0 then
   	    _sleep(20)
        com.write(dev, "DSP1\\\\ \\", 8)
    end
end

function A32NX_DspMode_Toggle()
    if ipc.get("DSPmode") == 1 then
        A32NX_DspInfoClear()
        A32NX_APPR = false
    end
    DSP_MODE_toggle()
end

-----------------------------------------------------------
-- Initial variables
function InitVars ()
    -- further work required with new GUI
    EvtFile = "A32NX.EVT"
    EvtIdx = 0 -- defined in [EVENTS] block in FSUIPC7.INI
    EvtPtr = 32768 + EvtIdx -- start address for A32NX.EVT custom events

    Airbus = true -- set flag for Airbus MCP2a panels
    P3D = 1 -- flag for imperial altitude conversion

    BaroRef = 1
    BaroMode = 1

    A32nx_BARO_Mode_HPa()
    A32nx_BARO_qnh()

    mfd1MODE = 0
    mfd1Range = 0
    eicasEcam2Page = 1
    bat1Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_1_PB_IS_AUTO")
    bat2Status = ipc.readLvar("L:A32NX_OVHD_ELEC_BAT_2_PB_IS_AUTO")
    eicasEcam2Functions = {"A32nx_EICAS_2_ECAM_PAGE_ENG","A32nx_EICAS_2_ECAM_PAGE_BLEED","A32nx_EICAS_2_ECAM_PAGE_PRESS","A32nx_EICAS_2_ECAM_PAGE_ELEC","A32nx_EICAS_2_ECAM_PAGE_HYD","A32nx_EICAS_2_ECAM_PAGE_FUEL","A32nx_EICAS_2_ECAM_PAGE_APU","A32nx_EICAS_2_ECAM_PAGE_COND","A32nx_EICAS_2_ECAM_PAGE_DOOR","A32nx_EICAS_2_ECAM_PAGE_WHEEL","A32nx_EICAS_2_ECAM_PAGE_FTCL","A32nx_EICAS_2_ECAM_PAGE_STS","A32nx_EICAS_2_ECAM_PAGE_cycle"}
    autoBrakeLevel = ipc.readLvar("L:XMLVAR_Autobrakes_Level")
    tcasSwitchPos = ipc.readLvar("L:A32NX_SWITCH_TCAS_Position")
    chronoLState = 0

    _loggg('[A3nx] A320nx Variables initialised')

	nd_mode = 1 -- default ND mode
	baro_mode = 1  -- default BARO mode is hPa
	auto_brk = 0
    AutoDisplay = false -- override automatic display updates (SPD/HDG/ALT/VVS_
    DSP_MODE_one ()
    EcamTxt = 1
    OnVar = 16 -- change this for initial brightness of displays. 0 to 20
    --TestCnt = 0
    TestVar = ""
    TestLast = ""
    -- variables to prevent constant LCD display updating
    A32NX_MODE = false
    -- MCDU keyboard timeout
    A32NX_PED_MCDU_Key_Timer = 60000
    A32NX_PED_MCDU_Key_Flag = false
    ipc.set("MCDU", 0)
    -- ALT/VVS DspE Flash Protection
    A32NX_ALT_Dot = ' '
    A32NX_VVS_Sign = '-'
    A32NX_ALT_Zero = '0'
    A32NX_Dot = string.char(7)
    A32NX_NoDot = ' '
end

function Timer ()
    -- check AP2 status
    if ipc.readLvar('A32NX_AP_LOC2') == 0 and
        ipc.readLvar('A32NX_AP_AP2') == 1 and
        ipc.readLvar('A32NX_AP_AP1') == 1 then
        ipc.writeLvar(A32NX_AP_AP2, 0)
    end
    -- set display information
    if _MCP2() then
        if ipc.get("DSPmode") == 1 then
            -- show autopilot info
            A32NX_AP_INFO ()
        else
            -- show flaps/gears info
            A32NX_FLIGHT_INFO ()
        end
    elseif _MCP2a() then
        if ipc.get("DSPmode") == 1 then
            -- keep flag until all MODEs reset
            local info = Modes()
            if info ~= "M111" then
                A32NX_MODE = true
            else
                A32NX_MODE = false
            end
            -- show autopilot info
            A32NX_AP_INFO ()
        else
            -- show flaps/gears info
            A32NX_FLIGHT_INFO ()
        end
    else  -- Display for MCP1 Users
        -- Display Autopilot
        A32NX_DispA32NX_AP_MCP1 ()
        -- Display Gearstatus
        A32NX_DispGear_MCP1 ()
        -- Display Flapstatus
        A32NX_DispFlaps_MCP1 ()
    end

    -- set timer for MCDU Key Input Reversion
    if ipc.readLvar("MCDU_KBD") == 1 and A32NX_PED_MCDU_Key_Flag == false then
        A32NX_PED_MCDU_KEYB_on()
        Sounds("modechange")
    else
        A32NX_PED_MCDU_Key_Flag = false
    end

    -- handle timer for MCDU Key Input Reversion
    if ipc.elapsedtime() - ipc.get("MCDU") > A32NX_PED_MCDU_Key_Timer
        and A32NX_PED_MCDU_Key_Flag then
        A32NX_PED_MCDU_KEYB_off()
        Sounds("modechange")
    end
end
-----------------------------------------------------------

-- ## Test stuff ################
-- $$ Test
function dispRefresh ()
    val = ipc.readLvar("L:A32NX_AUTOPILOT_VS_SELECTED")
    val = ipc.readLvar("L:A32NX_AUTOPILOT_HEADING_SELECTED")
    DspHDG (val)
end
