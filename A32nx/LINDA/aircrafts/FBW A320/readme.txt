------------------------------------------------------------------------
 LINDA Module
------------------------------------------------------------------------
 Aircraft: FlyByWireSim A32nx
<<<<<<< HEAD
  Version: 1.0.4
     Date: 2022-09-24
=======
  Version: 1.0.3
     Date: 2022-04-07
>>>>>>> 62cb0eef4d2099210c1dc14749fcc3c91977cd5e
   Author: Joe Herwig / Andrew Gransden
           Falk Scherber (0.8.2)
           Neil Clements (0.4.4 / 0.6.1)

------------------------------------------------------------------------
<<<<<<< HEAD
1.0.4
° Fixed the FCU rotaries by switching to execCalcCode to work in Experimental Version.
known-issues: 
😔 HDG Display and SPD Display not yet working. Didn't get the right LVAR from experimental version

=======
>>>>>>> 62cb0eef4d2099210c1dc14749fcc3c91977cd5e
1.0.3
+ Rework Transponder/TCAS Switches
+ Fixed InitCustomEvents() operation
+ Added Overhead Crew Only Supply Button
+ Fixed Landing Lights not illuminating
+ Improved VRi FCU Altitude INC/DEC
+ Added Radar PWS Switch
+ Fixed error in VRi FCU Altitude DEC
+ Added missing VRI FCU DspShow calls

1.0.2
+ Improved landing light animation

1.0.1
° Fixed some FCU Display functions.
° added dimmer functions for buttons/encoders (10%, 50%, 90%, inc, dec, reset)
° reordered the function blocks

1.0.0
° Renamed nearly all the functions based on the FBW naming conventions. See https://github.com/joeherwig/A32nx-LINDA-aircraft-module/wiki/Contribute#naming-conventions
  As this causes breaking changes and might require re-assignments / renamings of your configuration i decided to give it a new major version.
  The community feedback was excellent
° Merged plenty PRs
+ Added example for Dimmer assignments (display and flood / integ. light brightness.) See Wiki.
+ Added Boeing MCP support. Requires further testing. Feedback via github issues / donations :-) welcome.

-----

0.10.2
° fixed EFIS options (CSTR, WPT, VORD, NDB, ARPT, NONE)
+ added T.O.Config
+ added back FD + LS Buttons (toggle only)

0.10.1
° renamed folder from "A320" to "FBW A320" to indicate that this module is only intended for the FlyByWire A320. Fixes #25

0.10.0
+ Updated to ways better display mode (by Andrew)
° Fixed the FCU functions. (by Andrew)
  CAUTION: They require currently the A320nx.evt in the FSUIPC7 root folder and added with index 0 to the [Events] section in FSUIPC7.ini!
° Updated the assignments in the MCP2a assignments example to the new FCU functions.

0.9.0
° Fixed multiple issues for instance with the APU not working due to obsolete blank (Andrew Gransden)
+ Barometer reference settings (by Andrew Gransden)
+ Landing gear lever (by Andrew Gransden)
+ Fuel Pumps (on, off, toggle) (by Andrew Gransden)
+ Overhead lights updated to ExecuteCalculatorCode

0.8.3
+ External Power (toggle)
- External Power (on, off) as not available in current DEV version anymore

0.8.2
° added / renamed A32nx_VS_MODE_level_off instead of A32nx_VS_MODE_level_managed
- no more working AP Chrono Timer in PFD (was L:PUSH_AUTOPILOT_CHRONO_L)
+ Standby chrono elapsed timer (ET) Thanks to Falk Scherber!
+ A32nx_EICAS_2_ECAM_PAGE_next for those which want to use the ECAM ALL function with VRInsight panels

0.8.1
+ A32nx_EmerExit (off, arm, on)
 Master Warning (push) renamed!
° Master Caution (push) renamed!
Known_issues:
- A32nx_Seatbelt_x not working currently with Experimental build

0.8.0
+ Engine Master Switch 1 (off, on)
+ Engine Master Switch 2 (off, on)
° Overhead Electrics: GEN 1 (off, on, toggle)
° Overhead Electrics: GEN 2 (off, on, toggle)

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
° ADIRS
° Autobreak

0.5.0
+ Batt1, Batt2
+ APU Master, APU Starter, APU Bleed
+ ENG1 Bleed, ENG2 Bleed

0.4.3
° Fixed FCU to avoid the neccesity of the A32nx event file. Now it runs on HVars directly. Easier to install

0.4.2
° Fixed FCU rotaries. Known issue: incfast/decfast not yet working. As well the synchronization of the displayed values betwenn VC and VRi MCP is pending.

0.4.1
+ OVHD: Added Battery 1 (SET, ON, OFF, TOGGLE)
+ OVHD: Added Battery 2 (SET, ON, OFF, TOGGLE)
° fixed version information

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
° Updated PFD 1 FD
° Updated PFD 1 LS
° Renamed MFD buttons for CSTR, WPT, VORD, DNB and ARP to match standard naming

0.1.1
- Debugging Messages

0.0.1
+ MFD 1 Modes
+ MFD 1 Ranges
+ EICAS 2 ECAM Pages
+ ADIRS 1-3 Knobs
