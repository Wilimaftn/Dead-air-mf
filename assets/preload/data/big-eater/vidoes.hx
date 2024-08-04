import objects.PsychVideoSprite;
var introVid:PsychVideoSprite;
var runVid:PsychVideoSprite;

function onDestroy() {
    if (introVid != null) introVid.destroy();
    if (runVid != null) runVid.destroy();  
}

function onCreatePost(){
    introVid = new PsychVideoSprite();
    introVid.addCallback('onFormat',()->{
        introVid.cameras = [game.camGame];
        introVid.scale.set(4, 4);
        introVid.updateHitbox();
        //introVid.screenCenter();
        introVid.x = -760;
        introVid.y = -300;
    });

    introVid.addCallback('onEnd',()->{
        FlxTween.tween(game.camHUD, {alpha: 1}, 0.5, {ease: FlxEase.quadOut});
    });
    introVid.load(Paths.video('john_intro'), [PsychVideoSprite.muted]);
    introVid.antialiasing = true;
    add(introVid);

    runVid = new PsychVideoSprite();
    runVid.addCallback('onFormat',()->{
        runVid.cameras = [game.camGame];
        runVid.scale.set(4.5, 4.5);
        runVid.updateHitbox();
        //runVid.screenCenter();
        runVid.x = -490;
        runVid.y = -260;
    });
    runVid.load(Paths.video('john_run'), [PsychVideoSprite.muted]);
    runVid.antialiasing = true;
    add(runVid);
    game.camHUD.alpha = 0; 

}

function onSongStart(){
    introVid.play();
}

function onEvent(eventName, value1, value2){
    if(eventName == "oka"){
        switch(value1){
            case 'vid':
            runVid.play();
            runVid.addCallback('onEnd',()->
            {
                game.camGame.alpha = 0; 
            });
        }
    }
}