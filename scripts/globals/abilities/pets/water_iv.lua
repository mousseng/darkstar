---------------------------------------------------
-- Aero 2
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local dINT = math.floor(pet:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    local tp = skill:getTP()

    local damage = math.floor(325 + 0.025*(tp))
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet,target,skill,damage,dsp.magic.ele.WATER,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, dsp.magic.ele.WATER)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WATER,1)

    target:takeDamage(damage, pet, dsp.attackType.MAGICAL, dsp.damageType.WATER)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end