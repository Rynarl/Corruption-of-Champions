﻿package classes.Scenes.Areas.Lake
{
	import classes.Cock;
	import classes.Monster;
	
	/**
	 * ...
	 * @author Fake-Name
	 */


	public class FetishZealot extends Monster
	{

	//Special1: Tease
	//See Costumes section for text
	private function zealotSpecial1():void {
		//Costumes
		//This foe periodically switches between outfits; this determines what text is displayed when they use tease.
		
		//Perverted religious costume;
		if(armorName == "religious clothes") {
			//The zealot is clad in a bizarre set of religious robes.  They are similar to what you've seen on other religious leaders from home, but none that included the large slit at the front that lets his above average sized human dick stick out the front.
			outputText("The zealot cries out \"<i>Child, are you ready to present your offering to the holy rod?</i>\" while indicating his cock sliding between his robes.  The whole scene leaves you distracted for a few moments and significantly aroused.", false);
		}	
		//A pirate costume; 
		if(armorName == "pirate clothes") {
			//You are faced with one of the strangest things you have ever seen in your life.  A stereotypical pirate, who has not replaced his hand with a hook, but rather a collection of sex toys.  You can see at least two dildos, a fleshlight, and numerous other toys that you're incapable of recognizing.
			outputText("The zealot turns to the side holding his prosthetic towards you and doing something that sends the devices spinning and clicking.  <i>So that's how that would work...<i> you find yourself thinking for a few moments before realizing that he had both distracted and aroused you.", false);
		}
		//Military attire;
		if(armorName == "military clothes") {
			//In front of you is someone wearing a green military uniform.  They obviously aren't in any military you've ever heard of, as on his shoulder he has emblazoned <i>FF Army Sex Instructor</i>.  It seems you are his latest Recruit...
			outputText("He suddenly barks, \"<i>Let's see those genitals, soldier!</i>\" ", false);
			//[player is corrupt] 
			if(player.cor > 50) outputText("You eagerly cry out \"<i>Yes, sir!</i>\" and show yourself off to the best of your ability.  The whole act is extremely arousing.", false);
			//[player is not corrupt] 
			else outputText("You have no idea why, but you promptly display yourself in the most provocative way possible.  After a moment you realize what you're doing and quickly stop, flushed with embarrassment and arousal.", false);
		}
		//Gimp gear;
		if(armorName == "leather clothes") {
			//The Zealot has taken on an appearance that seems more suitable for the level of perversion he exudes.  He is wearing a full-body suit of leather, with a cock case over his crotch; you can clearly see a large zipper on it.  The zipper handle is far bigger than you think is absolutely necessary.
			outputText("The Zealot turns around and gives you a full view of his tight leather clad body, he smacks his ass and says \"<i>You like what you see, don't you " + player.mf("stud","slut") + "?</i>\"  You can't help but be incredibly aroused by the scene.", false);
		}
		//Well dressed and well groomed student in uniform;
		if(armorName == "student's clothes") {
			//The Zealot seems to have taken on the appearance of a young adult wearing a student uniform of sorts; of course, this isn't any less perverted than any of the other costumes this man wears.  This one includes a number of loose straps that you're certain would cause large sections of his clothes to fall off if somebody pulled on them.
			outputText("The Zealot student looks at you a little shyly and sticks a pencil in his mouth while pushing a hand in front of his groin, trying to hide a rather obvious bulge.  The whole scene is rather cute, and you feel incredibly aroused afterwards.", false);
		}
		game.dynStats("lus", (7+rand(player.lib/20+player.cor/20)));
		combatRoundOver();
	}
	//Special2: Lust transfer spell, it becomes more and 
	//more likely that he will use this power as his lust gets 
	//higher, but he can use it at any time (like the cultist).
	private function zealotSpecial2():void {
		outputText("The zealot suddenly cries out and extends his arms towards you; your mind is suddenly overwhelmed with a massive wave of arousal as images of every kind of fetish you can imagine wash over you, all blended together.  After a moment you are able to recover, but you notice that the Zealot doesn't seem to be as aroused as before.", false);
		game.dynStats("lus", lust/2);
		lust /= 2;
		combatRoundOver();
	}

		override protected function postAttack(damage:int):void
		{
			if (damage > 0){
				outputText("\nYou notice that some kind of unnatural heat is flowing into your body from the wound", false);
				if (player.inte > 50) outputText(", was there some kind of aphrodisiac on the knife?", false);
				else outputText(".", false);
				game.dynStats("lus", (player.lib / 20 + 5));
			}
			super.postAttack(damage);
		}

		override public function defeated(hpVictory:Boolean):void
		{
			game.lake.fetishZealotScene.zealotDefeated();
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (pcCameWorms){
				outputText("\n\nThe fetish cultist ignores the perverse display and continues on as if nothing had happened...", false);
				game.dynStats("lus=", 0);
				doNext(game.lake.fetishZealotScene.zealotLossRape);
			} else {
				game.lake.fetishZealotScene.zealotLossRape();
			}
		}

		public function FetishZealot()
		{
			trace("FetishZealot Constructor!");
		
			init01Names("the ", "fetish zealot", "fetishzealot", "The zealot is clad in a bizarre set of religious robes.  They are similar to what you've seen on other religious leaders from home, but none that included the large slit at the front that lets his above average sized human dick stick out the front.");
			init02Male(new Cock(7,1.5));
			init03BreastRows(0);
			init04Ass(ANAL_LOOSENESS_LOOSE,ANAL_WETNESS_DRY,40);
			init05Body("6'",HIP_RATING_BOYISH+1,BUTT_RATING_TIGHT);
			init06Skin("tan");
			init07Hair("black",4);
			init08Face();
			init09PrimaryStats(35,35,30,1,75,80,90);
			init10Weapon("wavy dagger","stab",3);
			init11Armor("religious clothes",5);
			init12Combat(0,25,0.75,Monster.TEMPERMENT_RANDOM_GRAPPLES);
			init13Level(5,5+rand(10));
			initX_Specials(zealotSpecial1,zealotSpecial2);
		}

	}

}