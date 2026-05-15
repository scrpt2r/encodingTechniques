-- encodingTechniques.__main__
-- 2026-05-15

local encodingTechniques = {}
encodingTechniques.__index = encodingTechniques

function encodingTechniques.new()
    local self = setmetatable({}, encodingTechniques)

    return self
end

function encodingTechniques:destroy()

end

return encodingTechniques
