# A32nx LINDA aircraft module

## For FSUIPC based A32nx homecockpits
In case you want to assign functionality from the FlyByWireSim A32nx which is usually only available via the virtual cockpit to your home cockpit buttons, switches and encoders i provide here a aircraft module making functionality of L:Vars available for assignments onto your hardware devices.


## Install

To install that aircraft module, just [download the A32nx_LINDA_aircraft_module.zip from the releases](https://github.com/joeherwig/A32nx-LINDA-aircraft-module/releases/) and unzip its content into a folder of your choice. In the example below i just unziped it to the download-folder.

![Import screenshot 1](https://raw.githubusercontent.com/wiki/joeherwig/A32nx-LINDA-aircraft-module/img/Import_Module_1.png)

![Import screenshot 2](https://raw.githubusercontent.com/wiki/joeherwig/A32nx-LINDA-aircraft-module/img/Import_Module_2.png)

![Import screenshot 3](https://raw.githubusercontent.com/wiki/joeherwig/A32nx-LINDA-aircraft-module/img/Import_Module_3.png)

![Import screenshot 4](https://raw.githubusercontent.com/wiki/joeherwig/A32nx-LINDA-aircraft-module/img/Import_Module_4.png)

- Copy the *.evt files from the unziped folder to your FSUIPC7 installation root folder
- add the A32nx.evt to the [Events] section in FSUIPC7.ini with index 0.
eg:
```
[EventFiles]
0=A32nx
1=A32X-FBW1
2=A32X-FBW2
```

### Important:
Note that you must have the MobiFlight WASM module installed and active to use these events.
To install it, head over to [MobiFlight Connector](https://www.mobiflight.com/de/download.html)
See "FSUIPC7 for Advanced Users.pdf" within the documentation which is provided with FSUIPC.

LINDA (4.0.8 or later) has been modified to automate handling and reference to these custom event files.

## Assign the functions
To work with the included libraries and event-files, just follow the instructions in the [Wiki](https://github.com/joeherwig/A32nx-LINDA-aircraft-module/wiki).

- [Assign in Linda](https://github.com/joeherwig/A32nx-LINDA-aircraft-module/wiki/Assign-in-LINDA)
- [Assign events in FSUIPC](https://github.com/joeherwig/A32nx-LINDA-aircraft-module/wiki/Assign-events-in-FSUIPC)

If you own a VRInsight MCP2a (FCU Airbus style), you can also take a look at my examples within the [config-mcp2a.lua.downloaded](https://github.com/joeherwig/A32nx-LINDA-aircraft-module/blob/main/A32nx/LINDA-CFG/aircrafts/A320/config-mcp2a.lua.downloaded) file.


## Interested to contribute?
I'm happy about your contributions. So feel free to fork and send me a pull-request.

