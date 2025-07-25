type FlagValue = boolean|number|any
type Flag = {
    Value: FlagValue,
    Label: string,
    Category: string
}
type Flags = {
    [string]: Flag
}
type table = {
    [any]: any
}

local Module = {
    Flags = {
        -- PreventRenaming = {
        --     Value = false,
        --     Label = "No renaming",
        -- },
        -- PreventParenting = {
        --     Value = false,
        --     Label = "No parenting",
        -- },
        NoComments = {
            Value = false,
            Label = "No comments",
        },
        SelectNewest = {
            Value = false,
            Label = "Auto select newest",
        },
        DecompilePopout = { -- Lovre SHUSH
            Value = false,
            Label = "Pop-out decompiles",
        },
        IgnoreNil = {
            Value = true,
            Label = "Ignore nil parents",
        },
        LogExploit = {
            Value = true,
            Label = "Log exploit calls",
        },
        LogRecives = {
            Value = true,
            Label = "Log receives",
        },
        Paused = {
            Value = false,
            Label = "Paused",
            Keybind = Enum.KeyCode.Q
        },
        KeybindsEnabled = {
            Value = true,
            Label = "Keybinds Enabled"
        },
        FindStringForName = {
            Value = true,
            Label = "Find arg for name"
        },
        UiVisible = {
            Value = true,
            Label = "UI Visible",
            Keybind = Enum.KeyCode.P
        },
        NoTreeNodes = {
            Value = false,
            Label = "No grouping"
        },
        TableArgs = {
            Value = false,
            Label = "Table args"
        },
        NoVariables = {
            Value = false,
            Label = "No compression"
        }
    }
}

function Module:GetFlagValue(Name: string): FlagValue
    local Flag = self:GetFlag(Name)
    return Flag.Value
end

function Module:SetFlagValue(Name: string, Value: FlagValue)
    local Flag = self:GetFlag(Name)
    Flag.Value = Value
end

function Module:SetFlagCallback(Name: string, Callback: (...any) -> ...any)
    local Flag = self:GetFlag(Name)
    Flag.Callback = Callback
end

function Module:SetFlagCallbacks(Dict: {})
    for Name, Callback: (...any) -> ...any in next, Dict do 
        self:SetFlagCallback(Name, Callback)
    end
end

function Module:GetFlag(Name: string): Flag
    local AllFlags = self:GetFlags()
    local Flag = AllFlags[Name]
    assert(Flag, "Flag does not exist!")
    return Flag
end

function Module:AddFlag(Name: string, Flag: Flag)
    local AllFlags = self:GetFlags()
    AllFlags[Name] = Flag
end

function Module:GetFlags(): Flags
    return self.Flags
end

return Module