function onCreatePost()
	makeAnimatedLuaSprite('bglogo','bglogo',-140,-150)addAnimationByPrefix('bglogo','dance','bglogo',24,true)
    objectPlayAnimation('bglogo','dance',true)
    setScrollFactor('bglogo', 1, 1);
    makeAnimatedLuaSprite('eyes','eyes',-515,-250)
    addLuaSprite('bglogo', false)
    setProperty('camHUD.alpha', 0)

    makeLuaSprite('card', 'titlecards/under-the-tree', 460, 300)
	setObjectCamera('card', 'camOther')
	updateHitbox('card')
	addLuaSprite('card', true)
	setProperty('card.alpha', 0)
end

function onBeatHit()
    if curBeat == 8 then    
        doTweenAlpha('waitawesome', 'card', 1, 2.4, 'linear')
    elseif curBeat == 16 then    
        doTweenAlpha('hud', 'camHUD', 1, 2.4, 'linear')
        doTweenAlpha('okaybye', 'card', 0, 3, 'linear')
    elseif curBeat == 156 then
        removeLuaSprite('bglogo', false);
        addLuaSprite('eyes', false);
        addAnimationByPrefix('eyes','appear','eyes',24,true)
        objectPlayAnimation('eyes','appear',false) 
    end
    if curBeat == 164 then
        addAnimationByPrefix('eyes','idle','idleeyes',24,true)
        objectPlayAnimation('eyes','idle',false)
    end
    if curBeat == 200 then
        addAnimationByPrefix('eyes','loop','loopeyes',24,true)
        objectPlayAnimation('eyes','loop',true)
    end
end