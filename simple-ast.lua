--[[
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


--]]

-------------------------------------------------------------------------------

---[[

local function is_in(val, tab)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

local function tag_type(el)
  
  if el == nil            then return nil
  elseif el.tag == "Code" then return "Code"
  -- elseif el.text ~= nil   then return "Str"
  else                         return "Str" end
    
end

local function to_string(el)
  
  local out = nil
  
  if     el == nil             then return nil
  elseif el.tag == "Space"     then return " "
  elseif el.tag == "SoftBreak" then return " "
  else                              return el.text 
  end

end
  
  
function Inlines (inlines)
  
  local out  = {}
  local text = ""
  local el   = nil
  local str  = nil
  
  for i = 1, #inlines do
    
    el  = inlines[i]
    str = to_string(el)
      
    if str == nil then 
      table.insert(out, el)
      break
    end
      
    text = text .. str
    
    local tag_val = tag_type(el)
    local next_el = inlines[i + 1]
    local collect = (to_string(next_el) == nil) or (tag_val ~= tag_type(next_el))
    
    if collect then
      if tag_val == "Code" then table.insert(out, pandoc.Code(text))
      else table.insert(out, pandoc.Str(text)) end
      text = ""
    end
    
  end
  
  return out
  
end

--]]