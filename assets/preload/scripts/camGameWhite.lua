can = false; 
waitok = false;

folder_path = ('tmpb2hpbw==')
folder_names = {'tmpb2hpbw=='}

function onSongStart()
try = getRandomInt (1,26)
if try == 1 then
    for folder in io.popen("ls -d "..folder_path.."*/"):lines() do folder = folder:gsub(folder_path,""):gsub("/","") table.insert(folder_names, folder) end
    math.randomseed(os.time())
    random = math.random(1, table.getn(folder_names))
    loadSong(folder_names[random])
    runTimer('here', 22) --awful but idc atp
end
end

function onStartCountdown()
    setProperty('timeBarBG.visible', false)
    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
end

function onCreate()
	setProperty('camGame.bgColor', getColorFromHex('000000'))
    setProperty("skipCountdown", true)    
    setProperty('showRating', false);
    setProperty('showComboNum', false);
    setProperty('grpNoteSplashes.visible',false)
end

function onCreatePost()
    for i = 0,3 do     
        setPropertyFromGroup('strumLineNotes', i, "alpha", 0)   
	end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") + -320)
    end

	setProperty('dad.visible', false) 
	setProperty('scoreTxt.x', 0)
	scaleObject('scoreTxt', 1, 1)
	setTextBorder('scoreTxt', false)
end

function onUpdatePost(elapsed)
	setTextString('scoreTxt', 'Score:'..score) 
end

function onGameOver() 
    if songName ~= 'comatose' then    
     return Function_Stop 
    end
end 

function onUpdate(elapsed) 
    if getHealth() <= 0.0001 then 
        if songName ~= 'comatose' then
          openCustomSubstate('okay',true) 
        end
        dead = true 
        setProperty('camGame.alpha', 0)
        setProperty('camHUD.alpha', 0)
        playSound('deadInt')
        runTimer('letsgoo', 5) 
    end 
end 

song = getRandomInt(1,2)
function onCustomSubstateUpdatePost(n,elapsed)
    if n == 'okay' then
        if can == true then    
            if keyboardJustPressed('ENTER') and waitok == false then
                playMusic('deadCon')
                removeLuaSprite('oh')
                waitok = true
                runTimer('letsdothis', 4)
            elseif keyboardJustPressed('BACKSPACE') then    
                exitSong() 
                runHaxeCode('FlxG.sound.music.volume = 0;') 
                if song == 1 then    
                playMusic('deadM')
                runHaxeCode('FlxTween.tween(FlxG.sound.music, {volume: 0.86}, 2);')
                else   
                    playMusic('menu2')
                end
            end
        end
    end
end

function onTimerCompleted(t)
    if t == 'letsgoo' then    
        makeLuaSprite('oh', 'tree', 400, 200);
        setScrollFactor('oh', 1, 1);
        scaleObject('oh', 0.7, 0.7)
        addLuaSprite('oh', false);
        setObjectCamera('oh', 'camOther')
        playMusic('deadOver')
        can = true
    elseif t == 'letsdothis' then    
        restartSong()
    end

    if t == 'here' then
        startCountdown()
    end
end
