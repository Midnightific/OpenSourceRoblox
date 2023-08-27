--// Initialization

local Module = {}
Module.__index = Module

--// Functions

function Module.GetDate()
    --/ Gets the current date.
    local Date = os.date("*t")

    return Date.month .. "/" .. Date.day .. "/" .. Date.year
end

function Module.GetTime()
    --/ Gets the current time.
    local Time = os.date("*t")

    return Time.hour .. ":" .. Time.min .. ":" .. Time.sec
end

function Module.FormatTime(Seconds)
    --/ Formats a time.
    local Time = {}

    Time.Days = math.floor(Seconds / 86400)
    Time.Hours = math.floor(Seconds / 3600) % 24
    Time.Minutes = math.floor(Seconds / 60) % 60
    Time.Seconds = math.floor(Seconds) % 60

    return Time
end

function Module.FormatTimeText(Seconds, self)
    --/ Formats a time into text.
    local Time = self:FormatTime(Seconds)

    local Text = ""

    if Time.Days > 0 then
        Text = Text .. Time.Days .. "d "
    end

    if Time.Hours > 0 then
        Text = Text .. Time.Hours .. "h "
    end

    if Time.Minutes > 0 then
        Text = Text .. Time.Minutes .. "m "
    end

    if Time.Seconds > 0 then
        Text = Text .. Time.Seconds .. "s"
    end

    return Text
end

function Module.FormatTimeTextShort(Seconds, self)
    --/ Formats a time into short text.
    local Time = self:FormatTime(Seconds)

    local Text = ""

    if Time.Days > 0 then
        Text = Text .. Time.Days .. "d "
    end

    if Time.Hours > 0 then
        Text = Text .. Time.Hours .. "h "
    end

    if Time.Minutes > 0 then
        Text = Text .. Time.Minutes .. "m "
    end

    if Time.Seconds > 0 then
        Text = Text .. Time.Seconds .. "s"
    end

    return Text
end
