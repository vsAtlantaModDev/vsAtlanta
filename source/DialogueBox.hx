package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var portraitExtra:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'seabass':
				FlxG.sound.playMusic(Paths.music('DialogueMusic'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'sofishticated':
				FlxG.sound.playMusic(Paths.music('DialogueMusic'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'finished':
				FlxG.sound.playMusic(Paths.music('DialogueMusic'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}


		bgFade = new FlxSprite(-400, -200).makeGraphic(Std.int(FlxG.width * 1.6), Std.int(FlxG.height * 1.6), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'seabass':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
			case 'sofishticated':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
			case 'finished':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByIndices('normal', 'speech bubble normal', [4], "", 24);
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		if(PlayState.SONG.song.toLowerCase() == 'seabass' || PlayState.SONG.song.toLowerCase() == 'sofishticated') {
			portraitLeft = new FlxSprite(84, 170).loadGraphic(Paths.image('atlanta_talk'));
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.15));
			portraitLeft.updateHitbox();
			//portraitLeft.flipX = true;
			portraitLeft.scrollFactor.set();
			//portraitLeft.x = 2000;
			//portraitLeft.y += 200;
			add(portraitLeft);
			portraitLeft.visible = false;
			
			portraitRight = new FlxSprite(796, 90).loadGraphic(Paths.image('bftalksprite'));
			portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.15));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
			portraitRight.width = 450;
			portraitRight.height = 450;
			//portraitRight.y += 300;

			portraitExtra = new FlxSprite(84, 170).loadGraphic(Paths.image('atlanta_talk_pout'));
			portraitExtra.setGraphicSize(Std.int(portraitExtra.width * PlayState.daPixelZoom * 0.15));
			portraitExtra.updateHitbox();
			//portraitLeft.flipX = true;
			portraitExtra.scrollFactor.set();
			//portraitLeft.x = 2000;
			//portraitLeft.y += 200;
			add(portraitExtra);
			portraitExtra.visible = false;

			
			
			box.animation.play('normalOpen');
			box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.15));
			box.updateHitbox();
			box.y += 362;
			box.x += 140;
			
			add(box);
		}
		else if(PlayState.SONG.song.toLowerCase() == 'finished') {
			portraitLeft = new FlxSprite(84, 170).loadGraphic(Paths.image('atlanta_talk'));
			portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.15));
			portraitLeft.updateHitbox();
			//portraitLeft.flipX = true;
			portraitLeft.scrollFactor.set();
			//portraitLeft.x = 2000;
			//portraitLeft.y += 200;
			add(portraitLeft);
			portraitLeft.visible = false;
			
			portraitRight = new FlxSprite(816, 100).loadGraphic(Paths.image('gftalksprite'));
			portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.15));
			portraitRight.updateHitbox();
			portraitRight.scrollFactor.set();
			add(portraitRight);
			portraitRight.visible = false;
			portraitRight.width = 450;
			portraitRight.height = 450;
			//portraitRight.y += 300;

			portraitExtra = new FlxSprite(84, 170).loadGraphic(Paths.image('atlanta_talk_pout'));
			portraitExtra.setGraphicSize(Std.int(portraitExtra.width * PlayState.daPixelZoom * 0.15));
			portraitExtra.updateHitbox();
			//portraitLeft.flipX = true;
			portraitExtra.scrollFactor.set();
			//portraitLeft.x = 2000;
			//portraitLeft.y += 200;
			add(portraitExtra);
			portraitExtra.visible = false;
			
			box.animation.play('normalOpen');
			box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.15));
			box.updateHitbox();
			box.y += 362;
			box.x += 140;
			
			add(box);
		}

		//box.screenCenter(X);


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(330, 516, Std.int(FlxG.width * 0.5), "", 50);
		dropText.font = 'arial 50 bold';
		dropText.color = 0xFFA9561F;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 1.0), "", 50);
		swagDialogue.font = 'arial 50 bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		swagDialogue.y +=1800;
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						portraitExtra.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (curCharacter)
		{
			case 'dad':
				box.flipX = true;
				portraitRight.visible = false;
				portraitExtra.visible = false;
				if (!portraitLeft.visible)
				{
					portraitLeft.visible = true;
					//portraitLeft.animation.play('enter');
				}
			case 'bf':
				box.flipX = false;
				portraitLeft.visible = false;
				portraitExtra.visible = false;
				if (!portraitRight.visible)
				{
					portraitRight.visible = true;
					//portraitRight.animation.play('enter');
				}
			case 'fishpout':
				box.flipX = true;
				portraitRight.visible = false;
				portraitLeft.visible = false;
				if (!portraitExtra.visible)
				{
					portraitExtra.visible = true;
					//portraitExtra.animation.play('enter');
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}
}
