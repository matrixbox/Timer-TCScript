

功能 设置_初始化()
    //这里添加你要执行的代码
    变量 title = 文件读配置("subtitle","text", "E:\\IFCountDownTool\\config.ini")
    编辑框设置文本("编辑框0",title,"设置")
    变量 subtitle = 文件读配置("subtitle","subclocktext", "E:\\IFCountDownTool\\config.ini")
    编辑框设置文本("编辑框1",subtitle,"设置")
    变量 date = 文件读配置("time","key","E:\\IFCountDownTool\\config.ini")
    日期框设置文本("日期框0",date,"设置")
    变量 subclock = 文件读配置("SubClock","status","E:\\IFCountDownTool\\config.ini")
    如果(subclock = true)
        变量 evenb = 事件创建(假,真,"按钮3_点击")
        事件打开(evenb)
    否则
        变量 evenh = 事件创建(假,真,"按钮1_点击")
        事件打开(evenh)
    结束
    
结束






功能 按钮2_点击()
    //这里添加你要执行的代码
    变量 nowtime = 当前时间()
    变量 date = 文件读配置("time","key","E:\\IFCountDownTool\\config.ini")
    变量 newtitle = 编辑框获取文本("编辑框0","设置")
    变量 newsubtitle = 编辑框获取文本("编辑框1","设置")
    变量 newdate = 日期框获取文本("日期框0","设置")
    //增加阈值判断机制
    文件写配置("subtitle","text", newtitle ,"E:\\IFCountDownTool\\config.ini")
    文件写配置("subtitle","subclocktext", newsubtitle ,"E:\\IFCountDownTool\\config.ini")
    文件写配置("time","key", newdate ,"E:\\IFCountDownTool\\config.ini")
    
    
    设置托盘气泡("设置已经保存到配置文件,部分更改将会在重启程序后生效.","Matrix Box CountDowner")
    
结束


