package model.effects;

import model.abilities.AreaOfEffect;
import model.abilities.DamagingAbility;
import model.world.Champion;

public class Shock extends Effect {

	public Shock(int duration) {
		super("Shock", duration, EffectType.DEBUFF);
		
	}
	
	public void apply(Champion c) {
		c.setSpeed((int)(c.getSpeed()-c.getSpeed()*0.1));
		c.setAttackDamage((int)(c.getAttackDamage()-c.getAttackDamage()*0.1));
		c.setCurrentActionPoints(c.getCurrentActionPoints()-1);
		c.setMaxActionPointsPerTurn(c.getMaxActionPointsPerTurn()-1);
	}
	
	public void remove(Champion c) {
		c.setSpeed((int)(c.getSpeed()/0.9));
		c.setAttackDamage((int)(c.getAttackDamage()/0.9));
		c.setCurrentActionPoints(c.getCurrentActionPoints()+1);
		c.setMaxActionPointsPerTurn(c.getMaxActionPointsPerTurn()+1);
	}

}
