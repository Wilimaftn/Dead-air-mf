function onCreate()
    initLuaShader('bnw')
    makeLuaSprite('card', 'titlecards/remembered', -500, 300) --455
    setObjectCamera('card', 'hud')
    updateHitbox('card')
    addLuaSprite('card', true)
  
    makeLuaSprite('blackSpr', nil)
    makeGraphic('blackSpr', screenWidth * 4, screenHeight * 4, '000000')
    setScrollFactor('blackSpr', 0, 0)
    setObjectCamera('blackSpr', 'game')
    updateHitbox('blackSpr')
    screenCenter('blackSpr')
    addLuaSprite('blackSpr', true)
    setProperty('blackSpr.alpha', 0)
end
  
  
function onCreatePost()
    setProperty('camZoomingMult', 0)
    for i = 4,7 do
      setPropertyFromGroup('strumLineNotes', i, "y", -150) --700, 30
    end
  
    if downscroll == true then    
      for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, "y", 750 ) -- 560
      end
    end
    makeLuaSprite("temporaryShader")
    setSpriteShader("temporaryShader", "bnw")
end
  
function onStepHit()
    if curStep == 192 then
      doTweenAlpha('black', 'blackSpr', 0.6, 0.5, 'linear')
      runTimer('no', 5)
      doTweenX('ohwow', 'card', 455, 1.2, 'circOut')
      runTimer('trans', 3.6)
    end    
    if curStep == 228 then
      if not downscroll then
       noteTweenY('w', 4, 30, 0.7, 'quadinout')
       noteTweenY('ww', 5, 40, 0.8, 'quadinout')
       noteTweenY('www', 6, 10, 0.9, 'quadinout')
       noteTweenY('wwww', 7, 30, 1, 'quadinout')
      elseif downscroll then
       noteTweenY('wwwww', 4, 560, 0.7, 'quadinout')
       noteTweenY('wwwwww', 5, 580, 0.8, 'quadinout')
       noteTweenY('wwwwwww', 6, 550, 0.9, 'quadinout')
       noteTweenY('wwwwwwww', 7, 560, 1, 'quadinout')
      end
    end
    if curStep == 252 then     
      setProperty('camGame.visible', false)
    elseif curStep == 256 then     
      setProperty('camGame.visible', true)   
    elseif curStep == 640 then    
      makeLuaSprite('flash', '', 0, 0);
      makeGraphic('flash',1280,720,'#000000')
      addLuaSprite('flash', true);
      setScrollFactor('flash',0,0)
      setProperty('flash.scale.x',2)
      setProperty('flash.scale.y',2)
      setObjectCamera('flash', 'game')
      setProperty('flash.alpha',0)
      setProperty('flash.alpha',1)
      doTweenAlpha('oop', 'flash', 0, 5.25, 'linear')
      setProperty('uiGroup.visible', false)
      setProperty('camHUD.alpha', 0)
      doTweenZoom('wait', 'camGame', 0.3, 30, 'circOut')
      runTimer('hudtime', 15)
    elseif curStep == 908 then    
      setProperty('camHUD.alpha', 0)
    end
end
  
  
function onTimerCompleted(t)
    if t == 'no' then   
     doTweenAlpha('blackk', 'blackSpr', 0, 0.5, 'linear')
    elseif t == 'trans' then    
      if downscroll then    
        doTweenY('soawesome', 'card', -800, 1.2, 'circOut')
      else
        doTweenY('pl', 'card', 800, 1.2, 'circOut')
      end
    elseif t == 'hudtime' then    
      doTweenAlpha('ok', 'camHUD', 1, 3, 'linear')
    end
end
