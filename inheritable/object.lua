-- This project follows MIT License check github repository https://github.com/KennySq/ObjectLua --
-- made and tested via 5.3.6, x86. --
-- no guarantee working on ARM, the reliablity of the code entirely depends on lua it self, use it on you own risk. --

function Inherit(baseClass)
    local newClass = {}
    local metatable = {__index = newClass}

    function newClass:Make()
        local inst = {}
        setmetatable(inst, metatable)
        return inst
    end

    if baseClass ~= nil then
        setmetatable(newClass, {__index == baseClass})
    end

    function newClass:Super()
        return baseClass
    end

    return newClass
end

inheritedObject = Inherit(object)

print(inheritedObject)

-- ### Could be used like this ### --
-- ### a class which is inherited from superior class, this is much like C++ class definition, but in the much more abstracted level. ###
-- inherted = inherit(object)
-- inhertedAgain = inherit(inherted)

-- ### allocation method (this will work much like constructor rather than the allocation) ###
-- function inherited:new(name, parent)
--     self.mName = name
--     self.mParent = parent
-- end

-- ### abstract object instance (since there's no super class or implicit casting, you can create abstract object instance) ###
-- parent = object:new(...)
