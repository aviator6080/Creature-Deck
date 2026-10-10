-- Behavior for "Creature Deck" (mod ID 3815932052).
-- The metatable name "CreatureDeck" must match LuaMetatableName on ART_Item_CreatureDeck.
-- Override hooks declared on RivalsLuaArticleEntity to customize behavior;
-- defaults come from C++. Call self:Super_<Name>(...) to inherit base behavior.

---@class CreatureDeck : RivalsLuaArticleEntity
CreatureDeck = Class(RivalsLuaArticleEntity)

math.randomseed(os.time())

function CreatureDeck:RegisterNetProps()
    HasBeenGrabbed = self:AddNetPropInt32(0, 1)
    self:SetNetPropInt32(HasBeenGrabbed, 0)
end

function CreatureDeck:ArticleUpdate()
    self:Super_ArticleUpdate()
    local CurrentWindow = self:GetWindow()
    local RNG = math.random(2)
    if(CurrentWindow == 1 and self:GetNetPropInt32(HasBeenGrabbed) == 0) then
        self:SetNetPropInt32(HasBeenGrabbed, 1)
    end
    if(CurrentWindow == 5) then
        self:SetNetPropInt32(HasBeenGrabbed, 0)
    end
    if(self:IsGrounded() and self:GetNetPropInt32(HasBeenGrabbed) == 1 and CurrentWindow == 0) then
        self:SetWindowByName("Explode", 0)
    end
    if(CurrentWindow == 6) then
        if(RNG == 1) then
            self:SetWindowByName("c1", 0)
        elseif(RNG == 2) then
            self:SetWindowByName("c2",0)
        end
    end
end



-- Runs when the article hits another entity. Default: do nothing.
-- function CreatureDeck:OnHitObject(HitObjectEntityIndex)
--     local target = self:GetEntity(HitObjectEntityIndex)
--     local character = Cast_RivalsCharacterEntity(target)
--     if character then
--         -- e.g. character:PickUpItem(self, true)
--     end
-- end

-- Runs when the holder throws this item. Direction is ERivalsItemThrowDirection.
-- function CreatureDeck:OnItemThrown(Direction) end
