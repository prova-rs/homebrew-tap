local context = Context.new()

-- ATL evaluates `{{ }}` as Lua and has no case filters, so derive the formula
-- class names here (the templates only interpolate plain variables).
local function to_pascal(s)
  local out = ""
  for word in tostring(s):gmatch("[%a%d]+") do
    out = out .. word:sub(1, 1):upper() .. word:sub(2)
  end
  return out
end

context:set("class_name", to_pascal(context:get("binary")))                 -- e.g. Prova

-- Homebrew does not accept any valid Ruby identifier here: it derives the class it
-- expects from the FILE NAME and refuses the formula if the file declares a different
-- one. That derivation is `Formulary.class_s` — each `[-_.\s]` is REMOVED and the
-- character after it upcased, and `+` becomes `x`:
--
--   prova@0.26.1      -> ProvaAT0261
--   prova@0.1.0-rc.1  -> ProvaAT010Rc1
--   prova@0.26.0+dev  -> ProvaAT0260xdev
--
-- Replacing separators with `_` produced `ProvaAT0_26_1`, which is a perfectly valid
-- identifier and the wrong one, so every pinned formula this archetype had ever
-- rendered was unloadable: `brew install prova@0.26.1` failed with "Expected to find
-- class ProvaAT0261", and `brew readall` failed for the whole tap. The main and
-- major-line formulae (`prova`, `prova@0`) were unaffected — no separators to mangle —
-- which is why four releases shipped before anyone noticed.
local function class_version(version)
  local s = (tostring(version):gsub("[-_.%s](%w)", function(c) return c:upper() end))
  return (s:gsub("%+", "x"))
end
context:set("class_version", class_version(context:get("version")))         -- e.g. 0261

-- Render the exact pinned formula (prova@X.Y.Z) for every release, including
-- prereleases, so `brew install prova@0.1.0-rc.1` is possible.
directory.render("contents", context, { if_exists = Existing.Overwrite })

-- Dispatch-payload booleans arrive as JSON booleans or as the strings
-- "true"/"false"; accept both. A missing key is treated as false.
local function is_true(value)
  return value == true or value == "true"
end

-- The major-line alias (prova@N) tracks the latest *stable* patch of its major.
-- Skip it for prereleases so `brew install prova@N` never resolves to a release
-- candidate.
if not is_true(context:get("prerelease")) then
  directory.render("major", context, { if_exists = Existing.Overwrite })
end

-- The main `prova` formula updates only for the latest stable of the top major
-- line (update_main=true). Maintenance releases on older majors and all
-- prereleases leave `brew install prova` untouched.
if is_true(context:get("update_main")) then
  directory.render("main", context, { if_exists = Existing.Overwrite })
end
