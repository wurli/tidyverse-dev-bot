
local function is_in(val, tab)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
  
local function describe(el)
  
  print("------------------------------------")    
  
  for key, value in pairs(el) do
    if is_in(key, {"tag", "text"}) then
      print(key .. " = " .. value)
    else
      print(key)
    end
  end
  
  return el
  
end

function Inlines (inlines)
  
  for i = 1, #inlines do
    describe(inlines[i])
  end
  
  return inlines
  
end

function Blocks (block)
  
  for i = 1, #block do
    print("-- BLOCK -------------------------------------------------")
    describe(block[i])
  end
  
  return block
  
end



--[[
local function classify_el = function(el)
  
  
  
end

  
  
function Inlines (inlines)
  
  for i = 1, #inlines do
    
    el  = inlines[i]
    
  end
  
  return out
  
end
--]]