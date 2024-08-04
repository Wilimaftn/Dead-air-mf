function onCreate()
	makeLuaSprite('Jim', 'Jim', -116, 0);
	setScrollFactor('Jim', 1, 1);
	addLuaSprite('Jim', false);

	makeLuaSprite('blackSpr', nil)
	makeGraphic('blackSpr', screenWidth * 4, screenHeight * 4, '000000')
	setScrollFactor('blackSpr', 0, 0)
	setObjectCamera('blackSpr', 'game')
	updateHitbox('blackSpr')
	screenCenter('blackSpr')
	addLuaSprite('blackSpr', true)
	setProperty('blackSpr.alpha', 0)

	makeLuaSprite('card', 'titlecards/shelter/title', 460, 300) --455
	setObjectCamera('card', 'camHUD')
	updateHitbox('card')
	addLuaSprite('card', true)
	setProperty('card.alpha', 0)

	makeLuaSprite('card2', 'titlecards/shelter/by', 460, 310) --455
	setObjectCamera('card2', 'camHUD')
	updateHitbox('card2')
	addLuaSprite('card2', true)
	setProperty('card2.alpha', 0)

	makeLuaSprite('fullscreen', '',-1200,-900)
    setScrollFactor('fullscreen', 0, 0)
    makeGraphic('fullscreen', 3840, 2160, 'FF0000')
    addLuaSprite('fullscreen',true)
    setObjectCamera('fullscreen','camOther')
    setProperty('fullscreen.alpha', 0)
end
function onCreatePost()
	setProperty('camZoomingMult', 0)
end

function onStepHit()
	if curStep == 872 then
	setProperty('fullscreen.alpha',1)
	doTweenAlpha('bluebluebyebye','fullscreen',0,3)
	setProperty('card.alpha', 1)
	setProperty('uiGroup.visible', false)
	noteTweenY('w', 4, -150, 0.01, 'quadinout')
	noteTweenY('ww', 5, -150, 0.01, 'quadinout')
	noteTweenY('www', 6, -150, 0.01, 'quadinout')
	noteTweenY('wwww', 7, -150, 0.01, 'quadinout')
	elseif curStep == 888 then    
		doTweenAlpha('cardd', 'card2', 1, 0.7, 'linear')
	elseif curStep == 902 then    
		setProperty('card.alpha', 0)
		setProperty('card2.alpha', 0)
end
end