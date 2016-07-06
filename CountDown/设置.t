

功能 设置_初始化()
    //这里添加你要执行的代码
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 title = 文件读配置("subtitle","text", path)
    编辑框设置文本("编辑框0",title,"设置")
    变量 subtitle = 文件读配置("subtitle","subclocktext", path)
    编辑框设置文本("编辑框1",subtitle,"设置")
    变量 date = 文件读配置("time","key",path)
    日期框设置文本("日期框0",date,"设置")
    变量 alarmt = 文件读配置("Alarm","Time",path)
    编辑框设置文本("编辑框2",alarmt,"设置")
    变量 alarmring = 文件读配置("Alarm","Ring",path)
    浏览框设置文本("浏览框0",alarmring,"设置")
    变量 dsub = 文件读配置("Tab","default",path)
    下拉框设置选项("下拉框0",dsub,"设置")
    变量 shutt = 文件读配置("Shutdown","Time",path)
    编辑框设置文本("编辑框3",shutt,"设置")
    
    
结束






功能 按钮2_点击()
    //这里添加你要执行的代码
    变量 path = 注册表获取键值("HKEY_LOCAL_MACHINE\\SOFTWARE\\MatrixBox\\Timer","configpath" )
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key",path)
    变量 newtitle = 编辑框获取文本("编辑框0","设置")
    变量 newsubtitle = 编辑框获取文本("编辑框1","设置")
    变量 newdate = 日期框获取文本("日期框0","设置")
    变量 newat = 编辑框获取文本("编辑框2","设置")
    变量 newdsub = 下拉框获取选项("下拉框0","设置")
    变量 newring = 浏览框获取文本("浏览框0","设置")
    变量 newst = 编辑框获取文本("编辑框3","设置")
    
    文件写配置("subtitle","text", newtitle ,path)
    文件写配置("subtitle","subclocktext", newsubtitle ,path)
    文件写配置("time","key", newdate ,path)
    文件写配置("Alarm","Time",newat,path)
    文件写配置("Tab","default",newdsub,path)
    文件写配置("Alarm","Ring",newring,path)
    文件写配置("Shutdown","Time",newst,path)
    
    定时器注册("定时器2",1000,"CountDown")
    定时器注册("定时器0",1000,"CountDown")
    定时器注册("定时器3",1000,"CountDown")
    
    变量 alarmtime = 文件读配置("Alarm","Time",path)
    变量 alarmdif = 时间间隔("s",nowtime,alarmtime)
    
    如果(alarmdif <= 0)
        定时器销毁("定时器2")
        音乐停止()
        标签设置文本("标签35","您的闹钟超时了!")
        标签设置文本("标签24","O_O","CountDown")
        控件是否有效("按钮5",假,"CountDown")
    结束
    
    变量 shutdowntime = 文件读配置("Shutdown","Time",path)
    变量 shutdowndif = 时间间隔("s",nowtime,shutdowntime) 
    
    如果(shutdowndif <= 0)
        定时器销毁("定时器3")
        
        标签设置文本("标签39","您的关机设置超时了!")
        标签设置文本("标签40","O_O","CountDown")
        控件是否有效("按钮6",假,"CountDown")
    否则
        控件是否有效("按钮6",真,"CountDown")
    结束
    
    
    
    设置托盘气泡("设置已经保存到配置文件,部分更改将会在重启程序后生效.","Matrix Box Timer")
    
    
结束


