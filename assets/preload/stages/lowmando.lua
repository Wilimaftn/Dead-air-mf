start = true
uhm = false 
function onStartCountdown()
   local function pause(sec, func)
      local unpause = os.clock() + sec
      while os.clock() < unpause do end
   end
   setProperty('camHUD.visible', false)
   setProperty('camGame.visible', false)
   if start then
    start = false
    makeLuaSprite('thign', 'titlecards/fancy-island/doorint', 0, 0)
    addLuaSprite('thign', false)
    setObjectCamera('thign', 'camOther')
    return Function_Stop;
   end
 return Function_Continue;
end
function onCreatePost()
   makeAnimatedLuaSprite('elizabeth1','elizabeth1',-750,100)
   addAnimationByPrefix('elizabeth1','move','maskmove1',30,true)
   objectPlayAnimation('elizabeth1','move',false) 
   makeAnimatedLuaSprite('elizabeth2','elizabeth2',-750,-250)
   addAnimationByPrefix('elizabeth2','move','maskmove2',30,true)
   objectPlayAnimation('elizabeth2','move',false) 
   makeAnimatedLuaSprite('elizabeth3','elizabeth3',-750,400)
   addAnimationByPrefix('elizabeth3','move','maskmove3',30,true)
   objectPlayAnimation('elizabeth3','move',false) 
   makeAnimatedLuaSprite('elizabeth4','elizabeth4',-750,650)
   addAnimationByPrefix('elizabeth4','move','maskmove4',30,true)
   objectPlayAnimation('elizabeth4','move',false)

   makeAnimatedLuaSprite('transitionLomando','transitionLomando',170,0)
   addAnimationByPrefix('transitionLomando','run','transition',24,true)
   objectPlayAnimation('transitionLomando','run',false)

   makeLuaSprite('doorlomando', 'doorlomando', 220, 0);
   setScrollFactor('doorlomando', 1, 1);
   scaleObject('doorlomando', 0.8,0.8)
   precacheImage('doorlomando')

   makeAnimatedLuaSprite('bludisfromohio','bludisfromohio',-185,-60)
   addAnimationByPrefix('bludisfromohio','move','grimace',10,true)
   objectPlayAnimation('bludisfromohio','move',false)
   precacheImage('bludisfromohio')
   scaleObject('bludisfromohio', 2,2)

   makeAnimatedLuaSprite('baby','baby',110,0)
   addAnimationByPrefix('baby','baby','baby',24,true)
   objectPlayAnimation('baby','baby',false)
   scaleObject('baby', 1.2,1.2)

   makeAnimatedLuaSprite('babyhead1','babyhead',-530,-20)
   addAnimationByPrefix('babyhead1','no','NObabyhead',24,true)
   addAnimationByPrefix('babyhead1','enter','ENTERbabyhead',24,true)
   addAnimationByPrefix('babyhead1','idle','IDLEbabyhead',24,true)
   addAnimationByPrefix('babyhead1','fade','FADEbabyhead',24,true)
   objectPlayAnimation('babyhead1','no',false)
   
   makeAnimatedLuaSprite('babyhead2','babyhead',700,-20)
   addAnimationByPrefix('babyhead2','no','NObabyhead',24,true)
   addAnimationByPrefix('babyhead2','enter','ENTERbabyhead',24,true)
   addAnimationByPrefix('babyhead2','idle','IDLEbabyhead',24,true)
   addAnimationByPrefix('babyhead2','fade','FADEbabyhead',24,true)
   objectPlayAnimation('babyhead2','no',false)

   addLuaSprite('babyhead1', true);
   addLuaSprite('babyhead2', true);

   makeLuaSprite('blackSpr', nil)
   makeGraphic('blackSpr', screenWidth * 4, screenHeight * 4, '000000')
   setScrollFactor('blackSpr', 0, 0)
   setObjectCamera('blackSpr', 'game')
   updateHitbox('blackSpr')
   screenCenter('blackSpr')
   addLuaSprite('blackSpr', true)

   setProperty('camZoomingMult', 0)

   makeLuaSprite('card', 'titlecards/fancy-island/title', 490, 290)
   setObjectCamera('card', 'hud')
   scaleObject('card', 0.8, 0.8)
   updateHitbox('card')
   addLuaSprite('card', true)

   makeLuaSprite('card2', 'titlecards/fancy-island/by', 490, 200)
   setObjectCamera('card2', 'hud')
   setObjectOrder('card2', getObjectOrder('card')-1)
   scaleObject('card2', 0.8, 0.8)
   updateHitbox('card2')
   addLuaSprite('card2', true)
   setProperty('card2.alpha', 0)

   makeLuaSprite('notes', 'notebg', 444 , 800)
   if not downscroll then     
     setProperty('notes.y', -200)
   end
   setObjectCamera('notes', 'hud')
   addLuaSprite('notes')
   scaleObject('notes', 0.58, 0.58)
   
   makeLuaSprite('fullscreen', '',-1200,-900)
   setScrollFactor('fullscreen', 0, 0)
   makeGraphic('fullscreen', 3840, 2160, 'FF0000')
   addLuaSprite('fullscreen',true)
   setObjectCamera('fullscreen','other')
   setBlendMode('fullscreen','add')
   setProperty('fullscreen.alpha',0)

   makeLuaSprite('bleh', '',-1200,-900)
   setScrollFactor('bleh', 0, 0)
   makeGraphic('bleh', 3840, 2160, '000000')
   addLuaSprite('bleh',true)
   setObjectCamera('bleh','game')
   setBlendMode('bleh','add')
   setProperty('bleh.alpha',0)

   makeLuaSprite('yeah', '', 0, 0);
   makeGraphic('yeah',1280,720,'#ffffff')
   addLuaSprite('yeah', true);
   setScrollFactor('yeah',0,0)
   setProperty('yeah.scale.x',2)
   setProperty('yeah.scale.y',2)
   setProperty('yeah.alpha',0)
   setBlendMode('yeah', 'subtract');
end

function onSongStart()
    setProperty('camGame.visible', true)
    setProperty('camHUD.visible', true)
    uhm = true 
end

function onStepHit()
    if curStep == 16 then    
       doTweenY('vlad', 'card2', 290, 0.7, 'circOut')
       doTweenAlpha('vladal', 'card2', 1, 0.6, 'circOut')
    elseif curStep == 32 then    
       doTweenAlpha('okwait', 'blackSpr', 0.6, 0.3, 'circOut')
       if downscroll then 
        doTweenY('bgdown', 'notes', 520, 0.9, 'quadout')
       else
          doTweenY('bgup', 'notes', -10, 0.9, 'quadout')
       end
    elseif curStep == 56 then   
       doTweenAlpha('okwait', 'blackSpr', 0.2, 0.3, 'circOut')
       doTweenX('byebyelogo', 'card', -500, 1.3, 'circOut')
       doTweenX('byebyeby', 'card2', 1500, 1.3, 'circOut')
    elseif curStep == 48 then    
       if not downscroll then
          noteTweenY('w', 4, 40, 0.7, 'quadinout')
          noteTweenY('ww', 5, 40, 0.8, 'quadinout')
          noteTweenY('www', 6, 40, 0.9, 'quadinout')
          noteTweenY('wwww', 7, 40, 1, 'quadinout')
         else
          noteTweenY('wwwww', 4, 570, 0.7, 'quadinout')
          noteTweenY('wwwwww', 5, 570, 0.8, 'quadinout')
          noteTweenY('wwwwwww', 6, 570, 0.9, 'quadinout')
          noteTweenY('wwwwwwww', 7, 570, 1, 'quadinout')
       end
    elseif curStep == 64 then     
       setProperty('fullscreen.alpha',0.7)
       doTweenAlpha('bluebluebyebye','fullscreen',0,0.4)
       setProperty('blackSpr.alpha', 0)
    end
    if curStep == 256 then
       objectPlayAnimation('babyhead1','enter',false)
    elseif curStep == 258 then
       objectPlayAnimation('babyhead1','idle',true)
    elseif curStep == 268 then
       objectPlayAnimation('babyhead1','fade',false)
    elseif curStep == 270 then
       objectPlayAnimation('babyhead1','no',false)
    elseif curStep == 272 then
       objectPlayAnimation('babyhead2','enter',false)
    elseif curStep == 274 then
       objectPlayAnimation('babyhead2','idle',true)
    end
    if curStep == 284 then
       objectPlayAnimation('babyhead2','fade',false)
    end
    if curStep == 286 then
       objectPlayAnimation('babyhead2','no',false)
    end
    if curStep == 288 then
       objectPlayAnimation('babyhead1','enter',false)
    end
    if curStep == 290 then
       objectPlayAnimation('babyhead1','idle',true)
    end
    if curStep == 300 then
       objectPlayAnimation('babyhead1','fade',false)
    end
    if curStep == 302 then
       objectPlayAnimation('babyhead1','no',false)
    end
    if curStep == 304 then
       objectPlayAnimation('babyhead2','enter',false)
    end
    if curStep == 306 then
       objectPlayAnimation('babyhead2','idle',true)
    end
    if curStep == 316 then
       objectPlayAnimation('babyhead2','fade',false)
    end
    if curStep == 318 then
       objectPlayAnimation('babyhead2','no',false)
    end
    if curStep == 320 then
       removeLuaSprite('babyhead1', false)
       removeLuaSprite('babyhead2', false)
    elseif curStep == 732 then    
      setProperty('yeah.alpha',0.52)
      doTweenAlpha('okay', 'yeah', 0, 0.36, 'linear')
    elseif curStep == 980 then    
      doTweenAlpha('wow', 'blackSpr', 1, 0.7, 'linear')
      doTweenZoom('wowe', 'camGame', 0.9, 0.72, 'linear')
    elseif curStep == 996 then    
      doTweenAlpha('ok', 'blackSpr', 0, 0.000001, 'linear')
      doTweenZoom('oka', 'camGame', 0.6, 0.000001, 'linear')
    elseif curStep == 1100 or curStep == 1116 then    
      runTimer('pause', 0.0000011)
      makeLuaSprite('glitch', nil)
      makeGraphic('glitch', screenWidth * 4, screenHeight * 4, 'ffffff')
      setObjectCamera('glitch', 'other')
      addLuaSprite('glitch', true)
      setProperty('glitch.alpha',0.5)
    elseif curStep == 1104 or curStep == 1120 then    
      removeLuaSprite("glitch", true);
    end
end

function onBeatHit()
    if curBeat == 48 then
        addLuaSprite('elizabeth1', false);
        addLuaSprite('elizabeth2', false);
        addLuaSprite('elizabeth3', false);
        addLuaSprite('elizabeth4', false);
    end
    if curBeat == 80 then
        removeLuaSprite('elizabeth1', false);
        removeLuaSprite('elizabeth2', false);
        removeLuaSprite('elizabeth3', false);
        removeLuaSprite('elizabeth4', false);
    end
    if curBeat == 145 then
        setProperty('boyfriendGroup.visible', false)
        addLuaSprite('transitionLomando', false);
    end
    if curBeat == 147 then
        removeLuaSprite('transitionLomando', false);
        setProperty('boyfriendGroup.visible', true)
    end
    if curBeat == 183 then
        setProperty('boyfriendGroup.visible', false)
        addLuaSprite('bludisfromohio', false);
        addLuaSprite('doorlomando', false);
    end
    if curBeat == 249 then
        removeLuaSprite('doorlomando', false);
        removeLuaSprite('bludisfromohio', false);
    end
    if curBeat == 250 then
       addLuaSprite('baby', false);
    end
    if curBeat == 256 then
        removeLuaSprite('baby', false);
        setProperty('boyfriendGroup.visible', true)
    end
    if curBeat == 288 then
        setProperty('boyfriendGroup.visible', false)
    end
end

function onTimerCompleted(t)
   if t == 'a' then
     uhm = true
     doTweenAlpha('warn', 'okay', 0, 1, 'linear')
     runTimer('okherewego', 3)
   elseif t == 'okherewego' then    
     startCountdown()
      for i = 0,3 do
       setPropertyFromGroup('strumLineNotes', i, "alpha", 0)
      end
 
     for i = 4,7 do
       setPropertyFromGroup('strumLineNotes', i, "y", -150)
       --setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") + -309)
     end
     if downscroll == true then    
       for i = 4,7 do
         setPropertyFromGroup('strumLineNotes', i, "y", 750 )
       end
     end

     setPropertyFromGroup('playerStrums', 0, "x", 478)-- 460
     setPropertyFromGroup('playerStrums', 1, "x", 560)-- 545
     setPropertyFromGroup('playerStrums', 2, "x", 644)-- 630
     setPropertyFromGroup('playerStrums', 3, "x", 725)-- 714

     setProperty('dad.visible', false) 
   elseif tag == 'pause' then
		pause(crochet / 1000)
	end
end
 
 
function onUpdate()
    if mouseClicked(left) == true and uhm == false then -- yeah uhm
     playSound('door')
     removeLuaSprite('thign', true)
     makeLuaSprite('okay', 'titlecards/fancy-island/doorint2', 0, 0)
     addLuaSprite('okay', false)
     setObjectCamera('okay', 'camOther')
     runTimer('a', 1)
    end
end
