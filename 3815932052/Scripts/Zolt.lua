-- Behavior for "Zolt" (mod ID 3815932052).
-- The metatable name "Zolt" must match LuaMetatableName on ART_Zolt.
-- Override hooks declared on RivalsLuaArticleEntity to customize behavior;
-- defaults come from C++. Call self:Super_<Name>(...) to inherit base behavior.

---@class Zolt : RivalsLuaArticleEntity
Zolt = Class(RivalsLuaArticleEntity)

-- Runs when the article hits another entity. Default: do nothing.
-- function Zolt:OnHitObject(HitObjectEntityIndex)
--     local target = self:GetEntity(HitObjectEntityIndex)
--     local character = Cast_RivalsCharacterEntity(target)
--     if character then
--         -- e.g. character:PickUpItem(self, true)
--     end
-- end

-- Runs when the holder throws this item. Direction is ERivalsItemThrowDirection.
-- function Zolt:OnItemThrown(Direction) end
