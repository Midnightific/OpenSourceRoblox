--@class Class
--@author Midnightific

--[[
    Documentation:

    Class:NewId(Id [Number], t [Table])
        Returns a new unique id for a class.

    Class:Extend(t [Table])
        Returns a new class that inherits from the current class.

    Class:IsChild(t [Table])
        Returns true if the class is a child of another class.
]]--

local Class = {}

function Class:NewId(Id, t)
    Id = Id or 0

    if t[Id] then
        Id = Id + 1
    end

    return Id
end

function Class:Extend(t)
    t = t or {}

    setmetatable(t, self)
    t.__index = t

    return t
end

function Class:IsChild(t)
    local super = self

    while super do
        if super == t then
            return true
        end

        super = getmetatable(super)
    end

    return false
end

return Class
