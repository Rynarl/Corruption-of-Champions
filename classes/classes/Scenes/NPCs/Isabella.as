package classes.Scenes.NPCs
{
	import classes.CoC;
	import classes.Monster;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Isabella extends Monster
	{

		//IZZY AI:

		//Isabella Combat texttttttsss
		public function isabellaAttack():void {
			//[Standard attack]
			outputText("Isabella snorts and lowers a shield a moment before she begins to charge towards you. Her hooves tear huge divots out of the ground as she closes the distance with surprising speed!  ", false);

			//Blind dodge change
			if(hasStatusAffect("Blind") >= 0 && rand(3) < 2) {
				outputText("Isabella blindly tries to charge at you, but misses completely.\n", false);
			}
			//Determine if dodged!
			else if(player.spe - spe > 0 && int(Math.random()*(((player.spe-spe)/4)+80)) > 80) {
				outputText("You duck aside at the last moment, relying entirely on your speed.\n", false);
			}
			//Determine if evaded
			else if(player.hasPerk("Evade") >= 0 && rand(100) < 10) {
				outputText("You easily evade her incredibly linear attack.\n", false);
			}
			//("Misdirection"
			else if(player.hasPerk("Misdirection") >= 0 && rand(100) < 10 && player.armorName == "red, high-society bodysuit") {
				outputText("You easily misdirect her and step aside at the last moment.\n", false);
			}
			//Determine if cat'ed
			else if(player.hasPerk("Flexibility") >= 0 && rand(100) < 6) {
				outputText("You throw yourself out of the way with cat-like agility at the last moment, avoiding her attack.\n", false);
			}
			else {
				var damage:Number = 0;
				damage = Math.round((weaponAttack + str + 20) - rand(player.tou+player.armorDef));
				if(damage < 0) {
					outputText("You brace yourself and catch her shield in both hands, dragging through the dirt as you slow her charge to a stop.  She gapes down, completely awestruck by the show of power.", false);
					damage = 0;
				}
				else {
					damage = player.takeDamage(damage);
					outputText("She's coming too fast to dodge, and you're forced to try to stop her.  It doesn't work.  Isabella's shield hits you hard enough to ring your ears and knock you onto your back with bruising force. (" + damage + ")\n", false);
				}
			}
			combatRoundOver();
		}

		public function isabellaStun():void {
			//[Stunning Impact]
			outputText("Isabella spins her shield back at you in a potent, steel-assisted backhand.  ", false);

			//Blind dodge change
			if(hasStatusAffect("Blind") >= 0 && rand(3) < 2) {
				outputText("Isabella blindly tries to charge at you, but misses completely.\n", false);
			}
			//Determine if dodged!
			else if(player.spe - spe > 0 && int(Math.random()*(((player.spe-spe)/4)+80)) > 80) {
				outputText("You duck aside at the last moment, relying entirely on your speed.\n", false);
			}
			//Determine if evaded
			else if(player.hasPerk("Evade") >= 0 && rand(100) < 10) {
				outputText("You easily evade her incredibly linear attack.\n", false);
			}
			//("Misdirection"
			else if(player.hasPerk("Misdirection") >= 0 && rand(100) < 10 && player.armorName == "red, high-society bodysuit") {
				outputText("You easily misdirect her and step aside at the last moment.\n", false);
			}
			//Determine if cat'ed
			else if(player.hasPerk("Flexibility") >= 0 && rand(100) < 6) {
				outputText("You bend backward with cat-like agility to avoid her attack.\n", false);
			}
			else {
				var damage:Number = 0;
				damage = Math.round((weaponAttack + str) - rand(player.tou+player.armorDef));
				if(damage < 0) {
					outputText("You deflect her blow away, taking no damage.\n", false);
					damage = 0;
				}
				else if(player.hasPerk("Resolute") >= 0 && player.tou >= 75) {
					outputText("You resolutely ignore the blow thanks to your immense toughness.\n");
					damage = 0;
				}
				else {
					damage = player.takeDamage(damage);
					outputText("You try to avoid it, but her steely attack connects, rocking you back.  You stagger about while trying to get your bearings, but it's all you can do to stay on your feet.  <b>Isabella has stunned you!</b> (" + damage + ")\n", false);
					player.createStatusAffect("Isabella Stunned",0,0,0,0);
				}
			}
			combatRoundOver();
		}

		public function isabellaThroatPunch():void {
			outputText("Isabella punches out from behind her shield in a punch aimed right at your throat!  ", false);

			//Blind dodge change
			if(hasStatusAffect("Blind") >= 0 && rand(3) < 2) {
				outputText("Isabella blindly tries to charge at you, but misses completely.\n", false);
			}
			//Determine if dodged!
			else if(player.spe - spe > 0 && int(Math.random()*(((player.spe-spe)/4)+80)) > 80) {
				outputText("You duck aside at the last moment, relying entirely on your speed.\n", false);
			}
			//Determine if evaded
			else if(player.hasPerk("Evade") >= 0 && rand(100) < 10) {
				outputText("You easily evade her incredibly linear attack.\n", false);
			}
			//("Misdirection"
			else if(player.hasPerk("Misdirection") >= 0 && rand(100) < 10 && player.armorName == "red, high-society bodysuit") {
				outputText("You easily misdirect her and step aside at the last moment.\n", false);
			}
			//Determine if cat'ed
			else if(player.hasPerk("Flexibility") >= 0 && rand(100) < 6) {
				outputText("You bend backward with cat-like agility to avoid her attack.\n", false);
			}
			else {
				var damage:Number = 0;
				damage = Math.round(str - rand(player.tou+player.armorDef));
				if(damage <= 0) {
					outputText("You manage to block her with your own fists.\n", false);
					damage = 0;
				}
				else if(player.hasPerk("Resolute") >= 0 && player.tou >= 75) {
					outputText("You resolutely ignore the blow thanks to your immense toughness.\n");
					damage = 0;
				}
				else {
					damage = player.takeDamage(damage);
					outputText("You try your best to stop the onrushing fist, but it hits you square in the throat, nearly collapsing your windpipe entirely.  Gasping and sputtering, you try to breathe, and while it's difficult, you manage enough to prevent suffocation. <b>It will be impossible to focus to cast a spell in this state!</b> (" + damage + ")\n", false);
					player.createStatusAffect("Throat Punch",2,0,0,0);
				}
			}
			combatRoundOver();
		}

		//[Milk Self-Heal]
		public function drankMalkYaCunt():void {
			outputText("Isabella pulls one of her breasts out of her low-cut shirt and begins to suckle at one of the many-tipped nipples. Her cheeks fill and hollow a few times while you watch with spellbound intensity.  She finishes and tucks the weighty orb away, blushing furiously.  The quick drink seems to have reinvigorated her, and watching it has definitely aroused you.", false);
			HP += 100;
			lust += 5;
			game.dynStats("lus", (10+player.lib/20));
			combatRoundOver();
		}

		override protected function performCombatAction():void
		{
			//-If below 70% HP, 50% chance of milk drinking
			if (HPRatio() < .7 && rand(3) == 0) drankMalkYaCunt();
			//if PC has spells and isn't silenced, 1/3 chance of silence.
			else if (player.hasSpells() && player.hasStatusAffect("Throat Punch") < 0 && rand(3) == 0) {
				isabellaThroatPunch();
			}
			//if PC isn't stunned, 1/4 chance of stun
			else if (player.hasStatusAffect("Isabella Stunned") < 0 && rand(4) == 0) {
				isabellaStun();
			}
			else isabellaAttack();
		}

		override public function defeated(hpVictory:Boolean):void
		{
			game.isabellaScene.defeatIsabella();
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if(pcCameWorms){
				outputText("\n\n\"<i>Ick,</i>\" Isabella tuts as she turns to leave...");
				game.cleanupAfterCombat();
			} else {
				game.isabellaScene.isabellaDefeats();
			}
		}

		public function Isabella()
		{
			init01Names("", "Isabella", "isabella", "Isabella is a seven foot tall, red-headed tower of angry cow-girl.  She's snarling at you from behind her massive shield, stamping her hooves in irritation as she prepares to lay into you.  Her skin is dusky, nearly chocolate except for a few white spots spattered over her body.  She wears a tight silk shirt and a corset that barely supports her bountiful breasts, but it's hard to get a good look at them behind her giant shield.");
			init02Female(VAGINA_WETNESS_DROOLING,VAGINA_LOOSENESS_GAPING,45);
			init03BreastRows("EE+");
			init04Ass(ANAL_LOOSENESS_VIRGIN,ANAL_WETNESS_DRY,38);
			init05Body("7'6",HIP_RATING_CURVY+2,BUTT_RATING_LARGE+1);
			init06Skin("dusky");
			init07Hair("red",13);
			init08Face();
			init09PrimaryStats(70,98,75,65,65,25,40);
			init10Weapon("giant shield","smash",15);
			init11Armor("giant shield",8,"",70);
			init12Combat(700,30,.35,Monster.TEMPERMENT_RANDOM_GRAPPLES);
			init13Level(15,rand(5) + 20);
			initX_Tail(TAIL_TYPE_COW,0,0);
			initX_Specials();

		}
		
	}

}