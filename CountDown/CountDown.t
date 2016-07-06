



功能 CountDown_初始化()
    //这里添加你要执行的代码
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    //防多开
    变量 event = 事件打开("防多开")
    如果(event)
        定时器销毁("定时器2")
        定时器销毁("定时器3")
        //阻止讲述人
        命令("taskkill /f /im narrator.exe",假)
        
        音乐停止()
        对话框("已经有相同的Timer实例在运行!","Matrix Box Timer",0,真)
        退出()
    否则
        事件创建(假,真,"防多开")
    结束
    定时器销毁("定时器2")
    定时器销毁("定时器3")
    
    命令("taskkill /f /im narrator.exe",假)
    
    //读配置
    
    设置托盘("Matrix Box Timer",假)
    设置托盘气泡("欢迎使用Matrix Box Timer RP,这是仍处在测试中的软件","Matrix Box Timer")
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置位置(mainwindow,300,1000)
    
    窗口置顶(mainwindow,真)
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key",path)
    控件是否有效("按钮3",假)
    
    
    变量 fileexists = 文件是否存在(path)
    如果(fileexists = 假)
        
        文件创建(path,"rw")
        文件写配置("subtitle","text", "请输入你的倒计时提示",path)
        文件写配置("time","key", "2016/1/1",path)
        
        变量 title = 文件读配置("subtitle","text", path)
        标签设置文本("标签3",title)
        变量 subtitle = 文件读配置("subtitle","subclocktext", path)
        标签设置文本("标签9",subtitle)
        标签设置文本("标签13",subtitle)
        标签设置文本("标签14",subtitle)
        
    否则
        变量 title = 文件读配置("subtitle","text", path)
        标签设置文本("标签3",title)
        变量 subtitle = 文件读配置("subtitle","subclocktext", path)
        标签设置文本("标签9",subtitle)
        标签设置文本("标签13",subtitle)
        标签设置文本("标签14",subtitle)
    结束
    
    //默认标签页读取,不需要判断配置文件条件
    变量 dsub = 文件读配置("Tab","default",path)
    选项卡激活("选项卡0",dsub,"CountDown")
    
    //自动注册倒计时和时间定时器
    定时器注册("定时器0",1000)
    定时器注册("定时器1",1000)
    
    //判断闹钟和关机,如果过期则销毁
    变量 alarmtime = 文件读配置("Alarm","Time",path)
    变量 alarmdif = 时间间隔("s",nowtime,alarmtime)
    变量 shutdowntime = 文件读配置("Shutdown","Time",path)
    变量 shutdowndif = 时间间隔("s",nowtime,shutdowntime)
    
    如果(alarmdif <= 0)
        定时器销毁("定时器2")
        音乐停止()
        标签设置文本("标签35","您没有设置闹钟!")
        标签设置文本("标签24",">_<","CountDown")
        控件是否有效("按钮5",假,"CountDown")
    结束
    
    如果(shutdowndif <= 0)
        定时器销毁("定时器3")
        标签设置文本("标签39","您没有设置定时关机!")
        标签设置文本("标签40",">_<","CountDown")
        控件是否有效("按钮6",假,"CountDown")
    否则
        定时器销毁("定时器3")
        标签设置文本("标签39","您没有设置定时关机!")
        标签设置文本("标签40",">_<","CountDown")
        控件是否有效("按钮6",假,"CountDown")
    结束
    
    
    
    
    
结束



功能 按钮0_点击()
    //这里添加你要执行的代码
    控件打开子窗口("设置") 
    
结束


功能 定时器0_时钟()
    //这里添加你要执行的代码
    
    //主时钟倒计时
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key",path)
    
    
    变量 title = 文件读配置("subtitle","text", path)
    标签设置文本("标签3",title)
    
    
    变量 subtitle = 文件读配置("subtitle","subclocktext", path)
    标签设置文本("标签9",subtitle)
    标签设置文本("标签13",subtitle)
    标签设置文本("标签14",subtitle)
    
    
    变量 displayday = 时间间隔("d",nowtime,date)
    标签设置文本("标签2",displayday )
    标签设置文本("标签10","天" ,"CountDown")
    
    变量 displayhour = 时间间隔("h",nowtime,date)
    标签设置文本("标签4",displayhour,"CountDown" )
    标签设置文本("标签7","小时" ,"CountDown")
    
    变量 displaymin = 时间间隔("n",nowtime,date)
    标签设置文本 ("标签5",displaymin,"CountDown")
    标签设置文本("标签6","分钟","CountDown" )
    
    变量 displaysecond = 时间间隔("s",nowtime,date)
    标签设置文本 ("标签12",displaysecond,"CountDown")
    标签设置文本("标签11","秒","CountDown" )
    
    
    
    //增加定时阈值条件
    
    如果(displayday <= 0   )
        定时器销毁("定时器0","CountDown")
        标签设置文本("标签2","0","CountDown" )
        设置托盘气泡("计时器已经停止！您的定时器可能已经到期，如果不是 , 请检查您的日期设定是否为今天或者过大。请进入设置面板重新设定日期，计时器方可重新生效","Matrix Box Timer")
        
    结束
    
    如果(  displayhour <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本("标签4","0", "CountDown")
        设置托盘气泡("计时器已经停止！您的定时器可能已经到期，如果不是 , 请检查您的日期设定是否为今天或者过大。请进入设置面板重新设定日期，计时器方可重新生效","Matrix Box Timer")
        
    结束
    
    如果(displaymin <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本 ("标签5","0","CountDown")
        设置托盘气泡("计时器已经停止！您的定时器可能已经到期，如果不是 , 请检查您的日期设定是否为今天或者过大。请进入设置面板重新设定日期，计时器方可重新生效","Matrix Box Timer")
    结束
    
    如果(displaysecond <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本 ("标签12","0","CountDown")
        设置托盘气泡("计时器已经停止！您的定时器可能已经到期，如果不是 , 请检查您的日期设定是否为今天或者过大。请进入设置面板重新设定日期，计时器方可重新生效","Matrix Box Timer")
    结束
结束





功能 定时器1_时钟()
    //这里添加你要执行的代码
    
    //当前时间
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key",path)
    
    //增加当前时间
    
    变量 nowhour = 时间时(nowtime)
    标签设置文本("标签16",nowhour,"CountDown")
    变量 nowminute = 时间分(nowtime)
    选择(nowminute) //加入选择语句,修复分钟与秒钟<10时仅显示一位数的问题
        条件 0
        标签设置文本("标签19","00","CountDown")
        条件 1
        标签设置文本("标签19","01","CountDown")
        条件 2
        标签设置文本("标签19","02","CountDown")
        条件 3
        标签设置文本("标签19","03","CountDown")
        条件 4
        标签设置文本("标签19","04","CountDown")
        条件 5
        标签设置文本("标签19","05","CountDown")
        条件 6
        标签设置文本("标签19","06","CountDown")
        条件 7
        标签设置文本("标签19","07","CountDown")
        条件 8
        标签设置文本("标签19","08","CountDown")
        条件 9
        标签设置文本("标签19","09","CountDown")
        条件 10
        标签设置文本("标签19","10","CountDown")
        条件 11
        标签设置文本("标签19","11","CountDown")
        条件 12
        标签设置文本("标签19","12","CountDown")
        条件 13
        标签设置文本("标签19","13","CountDown")
        条件 14
        标签设置文本("标签19","14","CountDown")
        条件 15
        标签设置文本("标签19","15","CountDown")
        条件 16
        标签设置文本("标签19","16","CountDown")
        条件 17
        标签设置文本("标签19","17","CountDown")
        条件 18
        标签设置文本("标签19","18","CountDown")
        条件 19
        标签设置文本("标签19","19","CountDown")
        条件 20
        标签设置文本("标签19","20","CountDown")
        条件 21
        标签设置文本("标签19","21","CountDown")
        条件 22
        标签设置文本("标签19","22","CountDown")
        条件 23
        标签设置文本("标签19","23","CountDown")
        条件 24
        标签设置文本("标签19","24","CountDown")
        条件 25
        标签设置文本("标签19","25","CountDown")
        条件 26
        标签设置文本("标签19","26","CountDown")
        条件 27
        标签设置文本("标签19","27","CountDown")
        条件 28
        标签设置文本("标签19","28","CountDown")
        条件 29
        标签设置文本("标签19","29","CountDown")
        条件 30
        标签设置文本("标签19","30","CountDown")
        条件 31
        标签设置文本("标签19","31","CountDown")
        条件 32
        标签设置文本("标签19","32","CountDown")
        条件 33
        标签设置文本("标签19","33","CountDown")
        条件 34
        标签设置文本("标签19","34","CountDown")
        条件 35
        标签设置文本("标签19","35","CountDown")
        条件 36
        标签设置文本("标签19","36","CountDown")
        条件 37
        标签设置文本("标签19","37","CountDown")
        条件 38
        标签设置文本("标签19","38","CountDown")
        条件 39
        标签设置文本("标签19","39","CountDown")
        条件 40
        标签设置文本("标签19","40","CountDown")
        条件 41
        标签设置文本("标签19","41","CountDown")
        条件 42
        标签设置文本("标签19","42","CountDown")
        条件 43
        标签设置文本("标签19","43","CountDown")
        条件 44
        标签设置文本("标签19","44","CountDown")
        条件 45
        标签设置文本("标签19","45","CountDown")
        条件 46
        标签设置文本("标签19","46","CountDown")
        条件 47
        标签设置文本("标签19","47","CountDown")
        条件 48
        标签设置文本("标签19","48","CountDown")
        条件 49
        标签设置文本("标签19","49","CountDown")
        条件 50
        标签设置文本("标签19","50","CountDown")
        条件 51
        标签设置文本("标签19","51","CountDown")
        条件 52
        标签设置文本("标签19","52","CountDown")
        条件 53
        标签设置文本("标签19","53","CountDown")
        条件 54
        标签设置文本("标签19","54","CountDown")
        条件 55
        标签设置文本("标签19","55","CountDown")
        条件 56
        标签设置文本("标签19","56","CountDown")
        条件 57
        标签设置文本("标签19","57","CountDown")
        条件 58
        标签设置文本("标签19","58","CountDown")
        条件 59
        标签设置文本("标签19","59","CountDown")
    结束
    
    变量 nowsecond = 时间秒(nowtime)
    选择(nowsecond) //加入选择语句,修复分钟与秒钟<10时仅显示一位数的问题
        条件 0
        标签设置文本("标签20","00","CountDown")
        条件 1
        标签设置文本("标签20","01","CountDown")
        条件 2
        标签设置文本("标签20","02","CountDown")
        条件 3
        标签设置文本("标签20","03","CountDown")
        条件 4
        标签设置文本("标签20","04","CountDown")
        条件 5
        标签设置文本("标签20","05","CountDown")
        条件 6
        标签设置文本("标签20","06","CountDown")
        条件 7
        标签设置文本("标签20","07","CountDown")
        条件 8
        标签设置文本("标签20","08","CountDown")
        条件 9
        标签设置文本("标签20","09","CountDown")
        条件 10
        标签设置文本("标签20","10","CountDown")
        条件 11
        标签设置文本("标签20","11","CountDown")
        条件 12
        标签设置文本("标签20","12","CountDown")
        条件 13
        标签设置文本("标签20","13","CountDown")
        条件 14
        标签设置文本("标签20","14","CountDown")
        条件 15
        标签设置文本("标签20","15","CountDown")
        条件 16
        标签设置文本("标签20","16","CountDown")
        条件 17
        标签设置文本("标签20","17","CountDown")
        条件 18
        标签设置文本("标签20","18","CountDown")
        条件 19
        标签设置文本("标签20","19","CountDown")
        条件 20
        标签设置文本("标签20","20","CountDown")
        条件 21
        标签设置文本("标签20","21","CountDown")
        条件 22
        标签设置文本("标签20","22","CountDown")
        条件 23
        标签设置文本("标签20","23","CountDown")
        条件 24
        标签设置文本("标签20","24","CountDown")
        条件 25
        标签设置文本("标签20","25","CountDown")
        条件 26
        标签设置文本("标签20","26","CountDown")
        条件 27
        标签设置文本("标签20","27","CountDown")
        条件 28
        标签设置文本("标签20","28","CountDown")
        条件 29
        标签设置文本("标签20","29","CountDown")
        条件 30
        标签设置文本("标签20","30","CountDown")
        条件 31
        标签设置文本("标签20","31","CountDown")
        条件 32
        标签设置文本("标签20","32","CountDown")
        条件 33
        标签设置文本("标签20","33","CountDown")
        条件 34
        标签设置文本("标签20","34","CountDown")
        条件 35
        标签设置文本("标签20","35","CountDown")
        条件 36
        标签设置文本("标签20","36","CountDown")
        条件 37
        标签设置文本("标签20","37","CountDown")
        条件 38
        标签设置文本("标签20","38","CountDown")
        条件 39
        标签设置文本("标签20","39","CountDown")
        条件 40
        标签设置文本("标签20","40","CountDown")
        条件 41
        标签设置文本("标签20","41","CountDown")
        条件 42
        标签设置文本("标签20","42","CountDown")
        条件 43
        标签设置文本("标签20","43","CountDown")
        条件 44
        标签设置文本("标签20","44","CountDown")
        条件 45
        标签设置文本("标签20","45","CountDown")
        条件 46
        标签设置文本("标签20","46","CountDown")
        条件 47
        标签设置文本("标签20","47","CountDown")
        条件 48
        标签设置文本("标签20","48","CountDown")
        条件 49
        标签设置文本("标签20","49","CountDown")
        条件 50
        标签设置文本("标签20","50","CountDown")
        条件 51
        标签设置文本("标签20","51","CountDown")
        条件 52
        标签设置文本("标签20","52","CountDown")
        条件 53
        标签设置文本("标签20","53","CountDown")
        条件 54
        标签设置文本("标签20","54","CountDown")
        条件 55
        标签设置文本("标签20","55","CountDown")
        条件 56
        标签设置文本("标签20","56","CountDown")
        条件 57
        标签设置文本("标签20","57","CountDown")
        条件 58
        标签设置文本("标签20","58","CountDown")
        条件 59
        标签设置文本("标签20","59","CountDown")
    结束
    变量 nowyear = 时间年(nowtime)
    标签设置文本("标签27",nowyear,"CountDown")
    变量 nowmonth = 时间月(nowtime)
    标签设置文本("标签28",nowmonth,"CountDown")
    变量 nowday = 时间日(nowtime)
    标签设置文本("标签29",nowday,"CountDown")
    变量 nowweek = 时间星期(nowtime)
    选择(nowweek)
        条件 0
        标签设置文本("标签34","日","CountDown")
        条件 1
        标签设置文本("标签34","一","CountDown")
        条件 2
        标签设置文本("标签34","二","CountDown")
        条件 3
        标签设置文本("标签34","三","CountDown")
        条件 4
        标签设置文本("标签34","四","CountDown")
        条件 5
        标签设置文本("标签34","五","CountDown")
        条件 6
        标签设置文本("标签34","六","CountDown")
        默认
        
    结束
    
    
    
    
    
结束

功能 按钮3_点击()
    //这里添加你要执行的代码
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置大小(mainwindow,552,574)
    控件是否有效("按钮3",假,"CountDown")
    控件是否有效("按钮1",真,"CountDown")
    控件是否有效("选项卡0",真,"CountDown")
    设置托盘气泡("子时钟切换标签已解锁!","Matrix Box Timer")
    标签设置文本("标签38","提示：若需停止闹钟并取消置顶，请点击此按钮！","CountDown")
    标签设置文本("标签42","提示：若需在指令开始后取消关机，请点击此按钮！","CountDown")
结束


功能 按钮1_点击()
    //这里添加你要执行的代码
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置大小(mainwindow,552,411)
    控件是否有效("按钮3",真,"CountDown")
    控件是否有效("按钮1",假,"CountDown")
    控件是否有效("选项卡0",假,"CountDown")
    设置托盘气泡("子时钟切换标签已锁定,如欲解锁请回到主界面!","Matrix Box Timer")
    标签设置文本("标签38","子时钟已经锁定,您将无法关闭闹钟,请在下方解锁!")
    标签设置文本("标签42","子时钟已经锁定,您将无法取消关机,请在下方解锁!")
结束


功能 按钮4_点击()
    //这里添加你要执行的代码
    控件打开子窗口("关于") 
结束


功能 定时器2_时钟()
    //这里添加你要执行的代码
    //闹钟
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 nowtime = 当前时间()
    变量 alarmtime = 文件读配置("Alarm","Time",path)
    变量 alarmdif = 时间间隔("s",nowtime,alarmtime)
    标签设置文本("标签35","您的闹钟被设定在")
    标签设置文本("标签24",alarmdif,"CountDown")
    标签设置文本("标签37","秒后","CountDown")
    
    
    如果(alarmdif <= 0)
        变量 alarmring = 文件读配置("Alarm","Ring",path)
        变量 mainwindow = 窗口获取自我句柄()
        窗口置顶(mainwindow,真)
        选项卡激活("选项卡0",4,"CountDown")
        音乐播放(alarmring)
        定时器销毁("定时器2","CountDown")
        设置托盘气泡("闹钟已经启动!","Matrix Box Timer")   
        标签设置文本("标签35","闹铃时间已到")
        标签设置文本("标签24","^.^","CountDown")
        标签设置文本("标签37"," ","CountDown")
        
        控件是否有效("按钮5",真,"CountDown")
    结束 
结束


功能 按钮5_点击()
    //这里添加你要执行的代码
    音乐停止()
    变量 mainwindow = 窗口获取自我句柄()
    窗口置顶(mainwindow,假)
    控件是否有效("按钮5",假,"CountDown")
    标签设置文本("标签35","您已关闭闹钟!")
    标签设置文本("标签24",">.<","CountDown")
    标签设置文本("标签37"," ","CountDown")
结束




功能 定时器3_时钟()
    //这里添加你要执行的代码
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 sdmethodver = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","OSVer" )
    变量 nowtime = 当前时间()
    变量 shutdowntime = 文件读配置("Shutdown","Time",path)
    变量 shutdowndif = 时间间隔("s",nowtime,shutdowntime)
    标签设置文本("标签39","您的系统将在")
    标签设置文本("标签40",shutdowndif,"CountDown")
    标签设置文本("标签41","秒后关机","CountDown")
    
    
    
    
    如果(shutdowndif <= 0)
        如果(sdmethodver >= 9600)
            定时器销毁("定时器3")
            设置托盘气泡("您的系统将关机!","Matrix Box Timer")   
            命令( "shutdown -s -hybrid -t 0",假)
            
        否则
            定时器销毁("定时器3")
            设置托盘气泡("您的系统将关机!","Matrix Box Timer")   
            命令("shutdown -s  -t 0",假) 
            
        结束
        
    结束
    
结束


功能 按钮6_点击()
    //这里添加你要执行的代码
    
    定时器销毁("定时器3")  
    标签设置文本("标签39","您已取消关机!")
    标签设置文本("标签40",">.<","CountDown")
    标签设置文本("标签41"," ","CountDown")
    控件是否有效("按钮6",假,"CountDown")
结束
