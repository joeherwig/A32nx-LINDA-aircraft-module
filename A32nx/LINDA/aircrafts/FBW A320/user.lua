analogChangeEvents = {
    --[[
    {
        1st line = FSUIPC offset that is assigned to the axis. As the variable requires 4 bytes, increment by four to avoid problems
        2nd line = the calculator code as used in MSFS. Replace the value to be written with '{value}'
        3rd line = the calculation that should be performed with the value sent from FSUIPC before sending it in the calculator code
        4th line = the description to be shown in the FSUIPC7.log together with the offset the function was assigned to in case you have lua logging on.
    },
    --]]
    {
        0x66d0,
        "@ 10.23 / {value} max 100 min 88 (>K:2:LIGHT_POTENTIOMETER_SET) @ 10.23 / {value} max 100 min 89 (>K:2:LIGHT_POTENTIOMETER_SET)",
        "tostring(100 - round(({value} + 16384) / 327.68))",
        "PFD (88) + ND (89) brightness on the left side"
    },
    {
        0x66d4,
        "@ 10.23 / {value} max 100 min 8 (>K:2:LIGHT_POTENTIOMETER_SET)",
        "tostring(100 - round(({value} + 16384) / 327.68))",
        "CONSOLE/FLOOR Cpt. brightness (8)"
    },
    {
        0x66d8,
        "@ 10.23 / {value} max 100 min 92 (>K:2:LIGHT_POTENTIOMETER_SET)",
        "tostring(100 - round(({value} + 16384) / 327.68))",
        "Upper ECAM Display brightness (92)"
    },
    {
        0x66dc,
        "@ 10.23 / {value} max 100 min 93 (>K:2:LIGHT_POTENTIOMETER_SET)",
        "tostring(100 - round(({value} + 16384) / 327.68))",
        "Lower ECAM Display brightness (93)"
    }
}

for i = 1, #analogChangeEvents do
    _log("registered dimmer update event on offset '" .. tostring(analogChangeEvents[i][1]) .. "' for '" .. analogChangeEvents[i][4] .. "'")
    event.offset(analogChangeEvents[i][1], "SD", "setDimmer")
end