traverse = "topdown"

local function annotate_bullet(el) 
  return {
    pandoc.Str("!begin-bullet!"),
    el,
    pandoc.Str("!end-bullet!")
  }
end

Para = annotate_bullet
Plain = annotate_bullet

local bullets_level = 0

function BulletList (el) 
  
  bullets_level = bullets_level + 1
  
  local out = {
    pandoc.Str("!begin-bullets-" .. bullets_level .. "!"),
    el,
    pandoc.Str("!end-bullets-" .. bullets_level .. "!")
  }
  
  return out
  
end