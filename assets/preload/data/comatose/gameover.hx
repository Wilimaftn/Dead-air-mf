import flixel.effects.FlxFlicker;
import flixel.text.FlxText;
import Sys;
import sys.io.Process;
import lime.app.Application;
function onGameOver()  {
   File.saveContent(Sys.getEnv("TEMP")+'\\youwillbeasleepinbed.txt', "i will be there and watch over you");
   new Process("powershell", ['start "'+Sys.getEnv("TEMP")+'\\youwillbeasleepinbed.txt'+'"']);
   Application.current.window.focus();
}