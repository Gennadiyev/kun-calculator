require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mods.Pretend"
activity.setTitle('鲲')
activity.setTheme(android.R.style.Theme_Material_Light)
activity.setContentView(loadlayout("layout"))

WHAT_KUN_WANTS = 960
ACHIEVEMENT_SUM = 10

found = 0
mode = 0
achievementCounter = 0

notChanging = 0
hittingModes = 0
fortyTwo = 0
cancelling = 0
kunIsBack = 0
calcAndCalc = 0
knowingWhatKunWants = 0
errorsCaught = 0
theEnd = 0

function printMsgAdvanced(textToPrint, changeColor, changeSize)
	-- the text are put before everything else.
	printer.text = textToPrint.."\n\n"..printer.text
    pcall(loadstring("printer.setTextColor(0xff"..string.sub(changeColor,2,7)..")"))
	printer.setTextSize(tonumber(changeSize))
end

function printMsgNormal(textToPrint)
	printer.text = textToPrint.."\n\n"..printer.text
    printer.setTextColor(0x4a4a8900)
	printer.setTextSize(16)
end

function printMsgAchievement(textToPrint)
	printer.text = textToPrint.."\n\n"..printer.text
	printer.setTextColor(0xd89a4b00)
	printer.setTextSize(16)
end

function printMsgError(textToPrint)
	printer.text = textToPrint.."\n\n"..printer.text
	printer.setTextColor(0xf3b5a400)
	printer.setTextSize(16)
end
calc.onClick=function(calculate)
	--the main part,because this is really a calculator
	if mode==0 then
		result.text=tostring(tonumber(adder1.text)+tonumber(adder2.text))
	end
	if mode==1 then
		result.text=tostring(tonumber(adder1.text)-tonumber(adder2.text))
	end
	if mode==2 then
		result.text=tostring(tonumber(adder1.text)*tonumber(adder2.text))
	end
	if mode==3 then
		result.text=tostring(tonumber(adder1.text)/tonumber(adder2.text))
	end


	--Ifs

	--0
	if mode == 3 and adder2.text == "0" and error_catch.checked then
		achievementCounter = achievementCounter + 1
		if errorsCaught > -1 then errorsCaught = errorsCaught + 1 end
	end
	--1
	if notChanging > -1 and mode == 0 and adder1.text == "20" and adder2.text == "10" then
		notChanging = notChanging + 1
	end
	--2
	if hittingModes > 0 then
		hittingModes = 0
	end
	--3
	if fortyTwo > 0 and mode == 0 and tonumber(adder1.text)+tonumber(adder2.text) == 42 then
		fortyTwo = fortyTwo + 1
	end
	if fortyTwo > 0 and mode == 1 and tonumber(adder1.text)-tonumber(adder2.text) == 42 then
		fortyTwo = fortyTwo + 1
	end
	if fortyTwo > 0 and mode == 2 and tonumber(adder1.text)*tonumber(adder2.text) == 42 then
		fortyTwo = fortyTwo + 1
	end
	if fortyTwo > 0 and mode == 3 and tonumber(adder1.text)/tonumber(adder2.text) == 42 then
		fortyTwo = fortyTwo + 1
	end
	--4
	if cancelling > 0 then
		cancelling = 0
	end
	--6
	if calcAndCalc > -1 and calcAndCalc < 50 then 
		calcAndCalc = calcAndCalc + 1
	end
	--7
	if knowingWhatKunWants > -1 and mode == 0 and tonumber(adder1.text)+tonumber(adder2.text) == WHAT_KUN_WANTS then
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	if knowingWhatKunWants > -1 and mode == 1 and tonumber(adder1.text)-tonumber(adder2.text) == WHAT_KUN_WANTS then
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	if knowingWhatKunWants > -1 and mode == 2 and tonumber(adder1.text)*tonumber(adder2.text) == WHAT_KUN_WANTS then
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	if knowingWhatKunWants > -1 and mode == 3 and tonumber(adder1.text)/tonumber(adder2.text) == WHAT_KUN_WANTS then
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	

	--Thens

	
	if result.text == "340.0" then
		printMsgNormal("有效数字很重要喔！但是没想到吧，这里也有成就！恭喜！")
		found = found + 1
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
	end
	--0
	if achievementCounter > 0 then
		printMsgNormal("ERROR: DIVIDED BY 0")
		printMsgNormal("隐藏成就计数器："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		achievementCounter = 0
	end
	if errorsCaught == 8 then
		printMsgNormal("ERROR: DIVIDED BY 0 PLUS YOU'VE EARNED AN ACHIEVEMENT.")
		found = found + 1
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		errorsCaught = -1
	end
	--1
	if notChanging == 1 then
		printMsgNormal("您就不能换一个数据嘛！我生气了！我要把答案搞成错误的！")
		result.text=tostring(WHAT_KUN_WANTS)
		found = found + 1
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		notChanging = -1
	end
	--3
	if fortyTwo == 2 then
		found = found + 1
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		adder1.text="SIX"
		运算符.text="MULTIPLIED BY"
		adder2.text="NINE"
		fortyTwo = -1
	end
	--6
	if calcAndCalc == 40 then
		printMsgNormal("这是您的第40次计算。那么，作为奖励——")
		found=found+1
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		calcAndCalc = -1 
	end
	--7
	if knowingWhatKunWants > 0 and knowingWhatKunWants < 11 then
		printMsgNormal("说，您调戏这个计算器多久了？那么熟练？")
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	if knowingWhatKunWants > 10 and knowingWhatKunWants < 20 then
		printMsgNormal("不给不给不给"..string.rep("！",knowingWhatKunWants-10))
		knowingWhatKunWants = knowingWhatKunWants + 1
	end
	if knowingWhatKunWants == 20 then
		found = found + 1
		printMsgNormal("好的，好的。你赢了。不就是成就嘛。给你加一个。")
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		knowingWhatKunWants = -1
	end

	--coming soon!


	--end
		--nothing to do


	--easter eggs

end

config.onClick=function(changeMode)
	--the main part,because this is really a calculator

	mode = (mode + 1) % 4
	运算符.text = string.sub("+-*/",mode+1,mode+1)
	printMsgNormal("现在运算符变成了 "..string.sub("+-*/",mode+1,mode+1))


	--Ifs

	--2
	if hittingModes > -1 and hittingModes < 20 then
		hittingModes = hittingModes + 1
	end

	--coming soon!


	--end
		--nothing to do


	--Thens

	--2
	if hittingModes == 20 then
		found = found + 1
		printMsgNormal("你是真的很无聊诶。")
		printMsgNormal("……不过不无聊的人怎么会玩计算器呢")
		printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
		hittingModes = -1
		fortyTwo = fortyTwo + 1
		result.text = "Answer to the Ultimate Question\nof Life\nthe Universe\nand Everything."
	end

	--coming soon!


	--end
		--nothing to do
	

	--easter eggs

end

test.onClick=function(test)
	--Ifs

	--2
	if hittingModes > 0 then
		hittingModes = 0
	end

	--coming soon!

	--end


	--Thens

	--coming soon!

	--end


	--easter eggs

	--输入对话框
	InputLayout={
		LinearLayout;
		orientation="vertical";
		Focusable=true,
		FocusableInTouchMode=true,
		{
			EditText;
			hint="输入自定义程序名";
			layout_marginTop="7dp";
			layout_width="77%w";
			layout_gravity="center",
			id="appname";
		};
	};

	AlertDialog.Builder(this)
	.setTitle("自定义程序标题")
	.setView(loadlayout(InputLayout))
	.setPositiveButton("确定",{onClick=function(v)
		--the main part,because we DO want to make the title modifiable
		activity.setTitle(appname.text)


		--Ifs

		--5
		if appname.text=="鲲" and kunIsBack == 0 then
			kunIsBack = kunIsBack + 1
		end
		--coming soon!

		--end
		if appname.text=="Kunologist" and found > ACHIEVEMENT_SUM - 1.5 then
			theEnd = 1
		end
		if appname.text=="Kunologist" and found < ACHIEVEMENT_SUM - 1 then
			theEnd = -1
		end

		--Thens

		--5
		if kunIsBack == 1 then
			found = found + 1
			printMsgNormal("鲲又回来了！")
			printMsgNormal("不过这个提示也太明显了吧……算了，勉强给您一个。")
			printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
			kunIsBack = -1
		end
		--coming soon!

		--end
		if theEnd == 1 then
			activity.setContentView(loadlayout("hiddenlayout"))
			back.onClick=function(u)
				activity.setContentView(loadlayout("winner"))
			end
		end
		if theEnd == -1 then
			activity.setContentView(loadlayout("hiddenlayout"))
			back.onClick=function(u)
				activity.setContentView(loadlayout("layout"))
			end
		end

		--easter eggs
		if appname.text=="鲲的英文名" or appname.text == "鲲的英语名" or appname.text == "鲲的英语名试试？" or appname.text == "鲲的英语名试试" then printMsgNormal("喔，你以为这样就能蒙混过关？好的。不给过！哼。") end
		if string.sub(appname.text,1,3)=="Kun" and appname.text~="Kunologist" then
			printMsgError("Uh oh, wrnog speling! Try agian?") 
		end --My ideas! From Richardn
		if string.sub(appname.text,1,3)=="kum" or string.sub(appname.text,1,3)=="kun" or string.sub(appname.text,1,3) == "Kum" then 
			printMsgError("请首字母大写并检查拼写") 
		end
		
	end})

	.setNegativeButton("取消",{onClick=function(u)
		--the main part,because... wait,what?


		--Ifs

		--4
		if  cancelling > -1 and cancelling < 5 then
			cancelling = cancelling + 1
		end

		--coming soon!

		--end


		--Thens
		--4
		if cancelling > -1 and cancelling < 5 then
			printMsgAdvanced("哇！居然点了取消！真没想到啊！那……把程序名字设定为鲲的英语名试试"..string.rep("? ",cancelling),"#db5b6a","16")
		end
		if cancelling == 5 then
			found = found + 1
			printMsgAchievement("隐藏成就达成："..tostring(found).."/"..tostring(ACHIEVEMENT_SUM).."。")
			cancelling = -1
		end

		--coming soon!

		--end

		--easter eggs
	end})
	.show()
end
