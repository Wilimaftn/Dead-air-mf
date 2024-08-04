local function pause(sec, func)
    local unpause = os.clock() + sec
    while os.clock() < unpause do end
end
function onCreate()
	makeLuaSprite('card', 'titlecards/comatose/title', 0, 0) --455
	setObjectCamera('card', 'camOther')
	updateHitbox('card')
	addLuaSprite('card', true)
	setProperty('card.alpha', 1)

	makeLuaSprite('card2', 'titlecards/comatose/by', 0, 0) --455
	setObjectCamera('card2', 'camOther')
	updateHitbox('card2')
	addLuaSprite('card2', true)
	setProperty('card2.alpha', 0)

	makeLuaSprite('card3', 'titlecards/comatose/based', 0, 0) --455
	setObjectCamera('card3', 'camOther')
	updateHitbox('card3')
	addLuaSprite('card3', true)
	setProperty('card3.alpha', 0)

    setProperty('boyfriendGroup.visible', false)

end
function onCreatePost()
	setProperty('camZoomingMult', 0)
end

function onStepHit()
	if curStep == 16 then    
		doTweenAlpha('by', 'card2', 1, 0.4, 'linear')
	elseif curStep == 36 then    
		doTweenAlpha('based', 'card3', 1, 0.4, 'linear')
	elseif curStep == 48 then    
		setProperty('card.alpha', 0)
		setProperty('card2.alpha', 0)
		setProperty('card3.alpha', 0)
    elseif curStep == 64 then
		setProperty('boyfriendGroup.visible', true)
	elseif curStep == 462 then    
		runTimer('pause', 0.0000010)
		makeLuaSprite('glitch', nil)
		makeGraphic('glitch', screenWidth * 4, screenHeight * 4, 'ff0003')
		setObjectCamera('glitch', 'other')
		setBlendMode('glitch', 'multiply')
		addLuaSprite('glitch', true)
	elseif curStep == 463 then    
		removeLuaSprite("glitch", true);
	end
end


function onTimerCompleted(tag)
	if tag == 'pause' then
		pause(crochet / 1000)
	end
end
