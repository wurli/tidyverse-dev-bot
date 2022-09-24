traverse = "topdown"

BulletList = function (el)
  
  -- Annotate individual bullets
  for i, item in ipairs(el.content) do
  
    local new = {}
    
    table.insert(new, pandoc.Str("!bullet-begin!"))
    for x, y in pairs(item) do table.insert(new, y) end
    table.insert(new, pandoc.Str("!bullet-end!"))
    
    el.content[i] = new
  
  end
  
  return el
  
end