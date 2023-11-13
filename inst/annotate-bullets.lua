---- Annotate Bullet Lists -----------------------------------------------------
--
-- This filter adds some annotations before and after bullet lists
-- and also before and after individual bullets. It's a bit of a hack
-- job because my skills aren't really there yet, but it works.
-- 
-- Some areas for improvement:
--
-- *  Annotations before/after bullet lists don't indicate the level of
--    indentation because the BulletList element doesn't include this 
--    information, and I couldn't work out how to infer it here. This 
--    information is currently inferred from the data structure in R. 
--------------------------------------------------------------------------------


-- Not necessary but makes the output data more intuitive to read
traverse = "topdown"


-- Annotate BulletLists
local bullets_id = 0

function BulletList(el) 
  
  -- Annotate individual bullets
  for i, item in ipairs(el.content) do
  
    -- This table will contain the new bullet data
    local new = {}
    
    -- 1. Insert "!begin-bullet!" annotation
    -- 2. Insert item(s) from the original bullet
    -- 3. Insert "!end-bullet!" annotation
    table.insert(new, pandoc.Str("!begin-bullet!"))
    for x, y in pairs(item) do table.insert(new, y) end
    table.insert(new, pandoc.Str("!end-bullet!"))
    
    -- Overwrite the original bullet data
    el.content[i] = new
  
  end
  
  -- Annotate bullet lists
  bullets_id = bullets_id + 1
  
  local out = {
    pandoc.Str("!begin-bullets-" .. bullets_id .. "!"),
    el,
    pandoc.Str("!end-bullets-" .. bullets_id .. "!")
  }
  
  return out
  
end


-- Annotate CodeBlocks
function CodeBlock(el) 
  return {
    pandoc.Str("!begin-codeblock!"),
    el,
    pandoc.Str("!end-codeblock!")
  }
end

-- Strip URLs from hyperlinks, turning them into regular text
function Link(link)
  return link.content
end
