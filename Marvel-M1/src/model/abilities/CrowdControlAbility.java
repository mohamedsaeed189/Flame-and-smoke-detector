package model.abilities;

import java.util.ArrayList;

import model.effects.Effect;
import model.world.Champion;
import model.world.Damageable;

public class CrowdControlAbility extends Ability {
	private Effect effect;

	public CrowdControlAbility(String name, int cost, int baseCoolDown, int castRadius, AreaOfEffect area, int required,
			Effect effect) {
		super(name, cost, baseCoolDown, castRadius, area, required);
		this.effect = effect;

	}

	public Effect getEffect() {
		return effect;
	}

	public void execute(ArrayList<Damageable> targets) throws CloneNotSupportedException {
		for(Damageable d :targets) 
			if(d instanceof Champion) {
				Champion c = (Champion) d;
				effect.apply(c);
				c.getAppliedEffects().add((Effect)effect.clone());
			}
	}

}
