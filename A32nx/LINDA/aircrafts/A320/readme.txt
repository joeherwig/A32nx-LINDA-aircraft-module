------------------------------------------------------------------------
 LINDA Module
------------------------------------------------------------------------
 Aircraft: FlyByWireSim A32nx
  Version: 0.5.1
     Date: 2021-08-11
   Author: Joe Herwig
           Neil Clements (0.4.4 / 0.6.1)
------------------------------------------------------------------------
0.6.0
+ Wing de-ice (toggle)
+ ENG1 de-ice (toggle)
+ ENG2 de-ice (toggle)
+ Pitot+Window heat (on, off, toggle)

0.5.1
• ADIRS for Dev d30667b
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
• 2021 GitHub, Inc.