-- This filter adds some annotations before and after bullet lists
-- and also before and after individual bullets. It's a bit of a hack
-- job because my skills aren't really there yet, but it works.
-- 
-- Some areas for improvement:
-- *  Annotations before/after individual bullets are actually before/after
--    Para and Plain blocks, because I couldn't work out how to iterate over
--    bullets in a list. This means some things are incorrectly annotated
--    as being bullets, which is only okay because only things annotated as
--    being in bullet lists are kept in R. But it's not nice.
--
-- *  Annotations before/after bullet lists don't indicate the level of
--    indentation because the BulletList element doesn't include this 
--    information, and I couldn't work out how to infer it here. This 
--    information is currently inferred from the data structure in R. 
--
-- *  Annotate code blocks so linebreaks aren't removed in R

-- Not necessary but makes the output data more intuitive to read
traverse = "topdown"

local function annotate_bullet(el, name) 
  return {
    pandoc.Str("!begin-" .. name .. "!"),
    el,
    pandoc.Str("!end-" .. name .. "!")
  }
end

function Para(el)      return annotate_bullet(el, "bullet")    end
function Plain(el)     return annotate_bullet(el, "bullet")    end
function CodeBlock(el) return annotate_bullet(el, "codeblock") end

local bullets_level = 0

function BulletList(el) 
  
  bullets_level = bullets_level + 1
  
  local out = {
    pandoc.Str("!begin-bullets-" .. bullets_level .. "!"),
    el,
    pandoc.Str("!end-bullets-" .. bullets_level .. "!")
  }
  
  return out
  
end

