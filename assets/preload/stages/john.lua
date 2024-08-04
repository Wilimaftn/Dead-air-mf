function onStartCountdown()
    if shadersEnabled then    
        setProperty('camGame.filtersEnabled', true)
        setProperty('camHUD.filtersEnabled', true)
    else 
        setProperty('camGame.filtersEnabled', false)
        setProperty('camHUD.filtersEnabled', false)
    end 
end

function onCreate()
    setProperty('camHUD.alpha', 0)
	makeLuaSprite('johnbg', 'johnbg', 315, 190);
	setScrollFactor('johnbg', 1, 1);
	addLuaSprite('johnbg', false);
	setProperty('johnbg.alpha', 0)

    makeLuaSprite('white', nil)
	makeGraphic('white', screenWidth * 4, screenHeight * 4, 'ffffff')
	setScrollFactor('white', 0, 0)
	setObjectCamera('white', 'game')
	updateHitbox('white')
	screenCenter('white')
	addLuaSprite('white', true)
    setObjectOrder('white', getObjectOrder('camShader')-1)
    setBlendMode('white', 'subtract')
    setProperty('white.alpha', 0) 
    initLuaShader('rain')
    makeLuaSprite('camShader', nil)
    makeGraphic('camShader', screenWidth, screenHeight)
    scaleObject("camShader", 20.0, 20.0)
    setSpriteShader('camShader', 'rain')

    initLuaShader("haha");
    makeLuaSprite("evil");
    makeGraphic("evil", screenWidth, screenHeight);

    setSpriteShader("evil", "haha");

    initLuaShader("compression");
    makeLuaSprite("shader");
    makeGraphic("shader", screenWidth, screenHeight);

    setSpriteShader("shader", "compression");

    addHaxeLibrary("ShaderFilter", "openfl.filters");
    addHaxeLibrary('ColorSwap', 'gameObjects.shader');
        
    function onUpdate(elapsed)
        setShaderFloat('camShader', 'iTime', os.clock())
        setShaderFloat('camShader', 'iIntensity', 0.10)
        setShaderFloat('camShader', 'iTimescale', 0.6)
        setShaderFloat('evil','pix','0.00001')
        setShaderFloat('shader','glitchAmount','0.1')
    end

    makeLuaSprite('white', nil)
	makeGraphic('white', screenWidth * 4, screenHeight * 4, 'ffffff')
	setScrollFactor('white', 0, 0)
	setObjectCamera('white', 'game')
	updateHitbox('white')
	screenCenter('white')
	addLuaSprite('white', true)
    setObjectOrder('white', getObjectOrder('boyfriendGroup')-1)
    setProperty('white.alpha', 0)
end


function onCreatePost()
    setProperty('boyfriendGroup.alpha', 0)
    runHaxeCode([[
		for (strum in game.playerStrums)
		{
			strum.scale.x = 0.65;
            strum.scale.y = 0.65;
		}
		for (note in game.unspawnNotes) 
		{
			if (note.mustPress) {
				note.scale.x = 0.62;
				note.scale.y = 0.62;
			if (note.isSustainNote) {
				note.scale.y = 1.9;
			} 
		}
		};
	]])
end

function onStepHit()
    if curStep == 50 then    
        doTweenAlpha('wawdawddwa', 'camHUD', 1, 1.12, 'linear')
	elseif curStep == 61 then    
		doTweenAlpha('bf', 'boyfriendGroup', 1, 1.12, 'linear')
    elseif curStep == 128 then   
        setProperty('white.alpha', 0.8)
        doTweenAlpha('white', 'white', 0, 0.5, 'linear') 
        setProperty('johnbg.alpha', 1)
    elseif curStep == 384 then    
        setProperty('camGame.alpha', 1)
        makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'#000000')
	    addLuaSprite('flash', true);
		setScrollFactor('flash',0,0)
		setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
        setObjectCamera('flash', 'hud')
		setProperty('flash.alpha',0)
	    setProperty('flash.alpha',0.9)
		doTweenAlpha('oop', 'flash', 0, 1.2, 'linear')
    elseif curStep == 640 then
        setProperty('white.alpha', 0.8)
        doTweenAlpha('white', 'white', 0, 1, 'linear')
        setProperty('camHUD.alpha', 0)
        setProperty('boyfriendGroup.alpha', 0)
        setProperty('johnbg.alpha', 0)
	end
end


function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end
