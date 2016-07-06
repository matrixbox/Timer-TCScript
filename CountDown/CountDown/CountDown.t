
功能 CountDown_初始化()
    //这里添加你要执行的代码
    
    
    //防多开
    变量 event = 事件打开("防多开")
    如果(event)
        对话框("已经有相同的Timer实例在运行!","Matrix Box Timer",0,真)
        退出()
    否则
        事件创建(假,真,"防多开")
    结束
    
    //读配置
    设置托盘("Matrix Box Timer",假)
    设置托盘气泡("欢迎使用Matrix Box Timer 0.2 Beta 2,这是仍处在测试中的软件","Matrix Box Timer")
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置位置(mainwindow,300,1000)
    
    窗口置顶(mainwindow,真)
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key","E:\\IFCountDownTool\\config.ini")
    控件是否有效("按钮3",假)
    文件夹创建("D:\\IFCountDownTool\\")
    文件创建("D:\\IFCountDownTool\\config.ini","rw")
    变量 fileexists = 文件是否存在("D:\\IFCountDownTool\\config.ini")
    如果(fileexists = 假)
        
        文件创建("D:\\IFCountDownTool\\config.ini","rw")
        文件写配置("subtitle","text", "请输入你的倒计时提示","D:\\IFCountDownTool\\config.ini")
        文件写配置("time","key", "2016/1/1","E:\\IFCountDownTool\\config.ini")
        
        变量 title = 文件读配置("subtitle","text", "E:\\IFCountDownTool\\config.ini")
        标签设置文本("标签3",title)
        变量 subtitle = 文件读配置("subtitle","subclocktext", "E:\\IFCountDownTool\\config.ini")
        标签设置文本("标签9",subtitle)
        标签设置文本("标签13",subtitle)
        标签设置文本("标签14",subtitle)
    否则
        变量 title = 文件读配置("subtitle","text", "E:\\IFCountDownTool\\config.ini")
        标签设置文本("标签3",title)
        变量 subtitle = 文件读配置("subtitle","subclocktext", "E:\\IFCountDownTool\\config.ini")
        标签设置文本("标签9",subtitle)
        标签设置文本("标签13",subtitle)
        标签设置文本("标签14",subtitle)
    结束
    
    
    定时器注册("定时器0",1000)
    
    
结束
功能 执行()
    //从这里开始你的代码
    
    
    
结束




功能 按钮0_点击()
    //这里添加你要执行的代码
    控件打开子窗口("设置") 
    
结束


功能 定时器0_时钟()
    //这里添加你要执行的代码
    
    //主时钟倒计时
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key","E:\\IFCountDownTool\\config.ini")
    
    
    变量 title = 文件读配置("subtitle","text", "E:\\IFCountDownTool\\config.ini")
    标签设置文本("标签3",title)
    
    
    变量 subtitle = 文件读配置("subtitle","subclocktext", "E:\\IFCountDownTool\\config.ini")
    标签设置文本("标签9",subtitle)
    标签设置文本("标签13",subtitle)
    标签设置文本("标签14",subtitle)
    
    
    变量 displayday = 时间间隔("d",nowtime,date)
    标签设置文本("标签2",displayday )
    
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
        设置托盘气泡("您所设定的时间已经到达,计时器将停止,请重新设置计时器后重启程序","Matrix Box Timer")
        
    结束
    
    如果(  displayhour <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本("标签4","0", "CountDown")
        设置托盘气泡("您所设定的时间已经到达,计时器将停止,请重新设置计时器后重启程序","Matrix Box Timer")
        
    结束
    
    如果(displaymin <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本 ("标签5","0","CountDown")
        设置托盘气泡("您所设定的时间已经到达,计时器将停止,请重新设置计时器后重启程序","Matrix Box Timer")
    结束
    
    如果(displaysecond <= 0)
        定时器销毁("定时器0","CountDown")
        标签设置文本 ("标签12","0","CountDown")
        设置托盘气泡("您所设定的时间已经到达,计时器将停止,请重新设置计时器后重启程序","Matrix Box Timer")
    结束
结束





功能 定时器1_时钟()
    //这里添加你要执行的代码
    //当前时间
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key","E:\\IFCountDownTool\\config.ini")
    
    //增加当前时间
    
    变量 nowhour = 时间时(nowtime)
    标签设置文本("标签16",nowhour,"CountDown")
    变量 nowminute = 时间分(nowtime)
    标签设置文本("标签19",nowminute,"CountDown")
    变量 nowsecond = 时间秒(nowtime)
    标签设置文本("标签20",nowsecond,"CountDown")
结束


功能 按钮3_点击()
    //这里添加你要执行的代码
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置大小(mainwindow,552,574)
    控件是否有效("按钮3",假,"CountDown")
    控件是否有效("按钮1",真,"CountDown")
    控件是否有效("选项卡0",真,"CountDown")
    标签设置文本("标签8","子时钟","CountDown")
    
结束


功能 按钮1_点击()
    //这里添加你要执行的代码
    变量 mainwindow = 窗口查找("CountDown")
    窗口设置大小(mainwindow,552,411)
    控件是否有效("按钮3",真,"CountDown")
    控件是否有效("按钮1",假,"CountDown")
    控件是否有效("选项卡0",假,"CountDown")
    标签设置文本("标签8","已锁定子时钟","CountDown")
    
结束


功能 按钮4_点击()
    //这里添加你要执行的代码
    控件打开子窗口("关于") 
结束


功能 定时器2_时钟()
    //这里添加你要执行的代码
    //闹钟
    
结束




