require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "mods.Pretend"
activity.setTitle('鲲')
activity.setTheme(android.R.style.Theme_Material_Light)
activity.setContentView(loadlayout("layout"))

kun_is_back=0
knowing = 0
count2 = 0
found_it3 = 0
mode = 0
found = 0
modechange = 0
count = 0
time=0
ultimate=0

calc.onClick=function(calculate)
	time=time+1
	if time==50 then
		print("这是您第50次计算。那么，象征性给您成就半个！")
		found=found+0.5
		print("隐藏成就达成："..tostring(found).."/7")
	end
	if ultimate==1 and adder2.text=="42" then
		found = found + 1
		print("隐藏成就达成："..tostring(found).."/7")
		adder1.text="YESH!"
		运算符.text="It's 42!"
		ultimate=0
    else
		if modechange < 20 then modechange = 0 end
		if mode==0 then
			result.text=tostring(tonumber(adder1.text)+tonumber(adder2.text))
			if adder1.text == "20" and adder2.text == "10" and time==1 then
				print("您就不能换一个数据嘛！我生气了！我要把答案搞成错误的！")
				result.text="340"
				found = found + 1
			print("隐藏成就达成："..tostring(found).."/7")
			end
		end
		if mode==1 then
		result.text=tostring(tonumber(adder1.text)-tonumber(adder2.text))
		end
		if mode==2 then
			result.text=tostring(tonumber(adder1.text)*tonumber(adder2.text))
			if result.text=="340" then
				if knowing == 0 then
					print("说，您调戏这个计算器多久了？那么熟练？")
				end
				count = count + 1
				if count==10 then
					found=found+1
					print("好的，好的。你赢了。不就是成就嘛。给你加一个。")
					print("隐藏成就达成："..tostring(found).."/7")
				else
					if count > 10 then
					print("再按也没有了。")
					else
					print("不给不给不给"..string.rep("！",count))
					end
				end
			end
		end
		if mode==3 then
			if adder2.text~="0" then
				result.text=tostring(tonumber(adder1.text)/tonumber(adder2.text))
			else
				if error_catch.checked then
					print("ERROR: DIVIDED BY 0")
					print("隐藏成就计数器："..tostring(found).."/7。")
				end
			end
		end
	end
end


config.onClick=function(changeMode)
	mode = (mode + 1) % 4
	modechange = modechange+1
	运算符.text = string.sub("+-*/",mode+1,mode+1)
	print("现在运算符变成了 "..string.sub("+-*/",mode+1,mode+1))
	if modechange==20 then
		found=found+1
		print("你是真的很无聊诶。")
		adder1.text="The ultimate Answer"
		运算符.text="="
		ultimate=1
		print("隐藏成就达成："..tostring(found).."/7")
	end
end

test.onClick=function(test)
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
		activity.setTitle(appname.text)
		if appname.text=="鲲" and kun_is_back == 0 then
			print("哇！我们回来了！给你半个成就吧！")
			found = found + 0.5
			kun_is_back = 1
			print("隐藏成就达成："..tostring(found).."/7")
		end
		if appname.text=="鲲的英文名" or appname.text == "鲲的英语名" then print("喔，你以为这样就能蒙混过关？好的。不给过！哼。") end
		if string.sub(appname.text,1,3)=="Kun" and appname.text~="Kunologist" then
        print("Uh oh, wrnog speling! Try agian?") end
		if string.sub(appname.text,1,3)=="kum" or string.sub(appname.text,1,3)=="kun" or string.sub(appname.text,1,3) == "Kum" then print("请首字母大写并检查拼写") end
		if appname.text=="Kunologist" and found_it3 == 0 then
			found_it3 = 1
			activity.setContentView(loadlayout("hiddenlayout"))
			back.onClick=function(u)
				activity.setContentView(loadlayout("layout"))
				if found == 7 then
					activity.setContentView(loadlayout("winner"))
				end
			end
			knowing=1
			found = found + 1
			print("隐藏成就达成："..tostring(found).."/7")
		end
	end})

	.setNegativeButton("取消",{onClick=function(u)
		count2 = count2 + 1
		if count2 == 5 then
			found = found + 1
			print("隐藏成就达成："..tostring(found).."/7")
		else
			if count2 < 12 then
			print("哇！居然点了取消！真没想到啊！那我就陪你玩玩好了！把程序名字设定为鲲的英语名试试？")
			end
		end
	end})
	.show()
end
