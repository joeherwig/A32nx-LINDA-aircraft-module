------------------------------------------------------------------------
 LINDA Module
------------------------------------------------------------------------
 Aircraft: FlyByWireSim A32nx
  Version: 0.8.3
     Date: 2022-01-07
   Author: Joe Herwig
           Neil Clements (0.4.4 / 0.6.1)
           Falk Scherber (0.8.2)
------------------------------------------------------------------------
0.8.3
+ External Power (toggle)
- External Power (on, off) as not available in current DEV version anymore

0.8.2
• added / renamed A32nx_VS_MODE_level_off instead of A32nx_VS_MODE_level_managed
- no more working AP Chrono Timer in PFD (was L:PUSH_AUTOPILOT_CHRONO_L)
+ Standby chrono elapsed timer (ET) Thanks to Falk Scherber!
+ A32nx_EICAS_2_ECAM_PAGE_next for those which want to use the ECAM ALL function with VRInsight panels

0.8.1
+ A32nx_EmerExit (off, arm, on)
 Master Warning (push) renamed!
• Master Caution (push) renamed!
Known_issues:
- A32nx_Seatbelt_x not working currently with Experimental build

0.8.0
+ Engine Master Switch 1 (off, on)
+ Engine Master Switch 2 (off, on)
• Overhead Electrics: GEN 1 (off, on, toggle)
• Overhead Electrics: GEN 2 (off, on, toggle)

0.7.0
+ Landing Lights L (retract, off, on, pos)
+ Landing Lights R (retract, off, on, pos)
+ Smoking Signs (off, auto, on, pos)

0.6.0
+ Wing de-ice (toggle)
+ ENG1 de-ice (toggle)
+ ENG2 de-ice (toggle)
+ Pitot+Window heat (on, off, toggle)

0.5.1
• ADIRS
• Autobreak

0.5.0
+ Batt1, Batt2
+ APU Master, APU Starter, APU Bleed
+ ENG1 Bleed, ENG2 Bleed

0.4.3
• Fixed FCU to avoid the neccesity of the A32nx event file. Now it runs on HVars directly. Easier to install

0.4.2
• Fixed FCU rotaries. Known issue: incfast/decfast not yet working. As well the synchronization of the displayed values betwenn VC and VRi MCP is pending.

0.4.1
+ OVHD: Added Battery 1 (SET, ON, OFF, TOGGLE)
+ OVHD: Added Battery 2 (SET, ON, OFF, TOGGLE)
• fixed version information

0.4.0
+ TCAS: Mode pos (STBY, TA, TA/RA, INC, DEC, CYCLE)
+ Glareshield: Chrono (SET, START, STOP, RESET, CYCLE)
+ OVHD: Calls (ALL)

0.3.1
+ autobreak_x_toggle functions to reflect the original three button behaviours.

0.3.0
+ left CDU buttons - right (FO) CDU not yet independent
+ FCU APPR mode toggle

0.2.0
+ Glareshield: AutoBreak (off, low, mid, high, SET, INC, DEC, CYCLE)
+ Glareshield: TerrainOnND toggle left.
• Updated PFD 1 FD
• Updated PFD 1 LS
• Renamed MFD buttons for CSTR, WPT, VORD, DNB and ARP to match standard naming

0.1.1
- Debugging Messages

0.0.1
+ MFD 1 Modes
+ MFD 1 Ranges
+ EICAS 2 ECAM Pages
+ ADIRS 1-3 Knobs
