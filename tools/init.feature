# language: zh-CN

  # 音乐步骤
  当< 打开我的音乐库
  当< 播放本地指定音乐
  |music_name|
  |小城故事   |
  那么< 验证音乐名称不一致
  |chk_music_name|
  |小城故事        |
  那么< 验证音乐名称一致
  |chk_music_name|
  |o_ret         |
  那么< 验证歌手名字一致
  |chk_artist|
  |刘德华        |
  那么< 验证音乐是否播放
  |is_playing|
  |true     |
  当< 打开音乐搜索
  当< 根据关键字搜索网络音乐
  |key_word|
  |刘德华     |
  当< 根据歌手播放搜索结果
  |artist|
  |张杰    |
  当< 根据音乐播放搜索结果
  |music_name|
  |一起走过的日子   |
  当< 切换上一首音乐
  当< 切换下一首音乐
  那么< 验证音乐搜索框内容
  |chk_key_word|
  |搜索        |
  当< 取消音乐搜索
  那么< 验证当前为音乐主界面
  当< 清空音乐搜索框
  当< 打开音乐列表
  那么< 验证U盘音乐数量
  |chk_usb_cnt|
  |3          |
  当< 播放U盘音乐
  那么< 验证当前为U盘音乐
  当< 获取当前音乐名称
  |o_result|
  |o_name|
  当< 获取当前音乐歌手
  |o_result|
  |o_name|
  当< 播放或暂停音乐
  当< 播放蓝牙音乐
  当< 等待音乐播放即将结束
  那么< 验证U盘已拔出
  当< 点击音乐收藏或取消收藏
  那么< 验证我的收藏记录
  |name|is_faved|
  |o_name|true  |
  # 收音机
  当< 打开FM_AM选择界面
  当< 播放指定FM节目
  |fm_no|
  |97.5 |
  那么< 验证播放的FM编号一致
  |chk_fm_no|
  |89.7     |
  那么< 验证播放的FM编号不一致
  |chk_fm_no|
  |o_fm_no    |
  当< 切换上一台
  当< 切换下一台
  当< 预览电台并随机收听
  |o_result|
  |o_fm_no |
  当< 收藏或取消收藏电台
  那么< 验证FM是否被收藏
  |chk_fm_no|chk_is_faved|
  |97.5     |true        |
  当< 播放已经收藏的电台
  那么< 验证电台是否播放
  |chk_is_playing|
  |false         |
  当< 打开搜索界面
  当< 输入电台搜索关键字
  |key_word|
  |南京      |
  那么< 验证当前为收音机主界面
  当< 清空电台搜索框
  那么< 验证电台搜索框内容
  |chk_key_word|
  |搜索        |
  当< 取消电台搜索
  当< 随机播放搜索电台
  |o_result|
  |o_fm_no |
  当< 打开蜻蜓FM
  当< 随机播放蜻蜓FM栏目
  |o_result|
  |o_title |
  当< 随机播放蜻蜓FM节目
  |o_result|
  |o_name |
  那么< 验证播放蜻蜓FM标题一致
  |chk_qt_title|
  |o_title     |
  那么< 验证播放FM节目一致
  |chk_name|
  |o_name    |
  那么< 验证播放FM节目不一致
  |chk_name|
  |o_name    |
  那么< 验证最近收听含有节目
  |chk_qt_name|
  |o_name     |
  当< 收藏或取消蜻蜓FM电台
  那么< 验证蜻蜓FM是否被收藏
  |chk_qt_title|chk_is_faved|
  |o_title     |false        |
  当< 播放收藏的蜻蜓FM
  当< 播放或暂停FM电台
  当< 随机播放FM节目
  |o_result|
  |o_fm_no|
  当< 调整收音机微调
  当< 点击听歌识曲
  那么< 验证听歌识曲正确
  当< 点击听歌识曲并播放
  |o_result|
  |o_name|
  当< 打开电台节目列表
  当< 随机播放网络回听节目
  |o_result|
  |o_name  |
  # 公用
  当< 延时
  |sleep_time|
  |5         |
  那么< 验证放音通道一致
  |chk_tinymix|
  |ASP MEDIA Route|
  当< 回到系统主界面
  当< 播放音频文件
  |voice_file|
  |你好语音助理.m4a|
  当< ivoka唤醒应用
  |voice_name|
  |我要听时间都去哪儿了.m4a|
  当< 获取MEDIA音量
  |o_result|
  |o_volume|
  那么< 验证MEDIA音量一致
  |chk_volume|
  |0         |
  那么< 验证当前应用
  |chk_app_name|
  |电台|
  当< 拔出U盘
  当< 插上U盘
  那么< 验证两个对象值
  |param1|option|param2|
  |o_address|==|o_dest_address|
  那么< 验证当前界面包含文本
  |contains_txt|
  |电台扫描中       |
  当< 重启设备
  #  车辆
  当< 开始倒车
  当< 结束倒车
  # 语音
  那么< 验证天气信息
  那么< 验证航班信息
  那么< 验证证券信息
  # 主界面
  当< 打开音乐应用
  当< 打开收音机应用
  当< 打开九宫格界面
  当< 打开其他菜单
  当< 打开Qplay
  当< 打开导航
  当< 打开视频应用
  那么< 验证主界面元素
  # 导航
  那么< 验证当前为导航主界面
  那么< 验证导航启动界面元素
  当< 打开导航搜索
  当< 选择导航搜索城市
  |city_name|
  |南京市      |
  当< 选择搜索的导航地址
  |address|o_result|
  |草场门  |o_address|
  当< 获取将要导航目的地地址
  |o_result|
  |o_dest_address|
  那么< 验证导航界面的元素
  当< 导航到目的地
  当< 收藏或取消收藏导航地址
  当< 打开导航收藏
  那么< 验证地址是否被收藏
  |address|is_faved|
  |o_address|false  |
  当< 删除指定地址
  |address|
  |o_address|
  当< 选择收藏的导航地址
  |address|
  |o_address  |
  那么< 验证附近查询结果
  |nearby_title|
  |加油站         |
  # QPLAY
  那么< 验证Qplay连接成功
  当< 选择Qplay歌曲
  |o_result|
  |o_name  |
  那么< 验证Qplay手机歌曲是否一致
  |chk_name|
  |o_name  |
  那么< 验证Qplay歌曲是否一致
  |chk_name|
  |o_name  |
  当< 手机退出车机模式
  那么< 验证当前为Qplay初始界面
  # MOBILE PHONE
  当< 手机拨打号码
  |phone_no|
  |10086   |
  当< 手机挂断电话
  当< 手机播放QQ音乐
  # 系统设置
  当< 断开蓝牙连接
  当< 连接蓝牙
  # 视频
  当< 打开我的视频
  当< 播放本地视频
  |video_name|
  |MOV格式     |
  那么< 验证视频播放名称一致
  |chk_name|
  |MOV格式     |
  那么< 验证视频是否播放
  |chk_is_playing|
  |true          |
  当< 打开视频搜索
  当< 输入视频搜索关键字
  |keyword|
  |熊出没    |
  当< 从搜索结果中播放指定视频
  |video_name|
  |熊出没    |
  当< 清空视频搜索框并验证
  当< 从播放记录中播放指定视频
  |video_name|
  |熊出没     |
  当< 搜索热门搜索视频
  |o_result|
  |o_video_name|
  当< 搜索搜索记录视频
  |o_result|
  |o_video_name1|
  当< 打开我的发现
  当< 随机播放发现视频
  |o_result|
  |o_video_name|
  当< 打开爱奇艺
  当< 随机播放爱奇艺视频
  |o_result|
  |o_video_name|
  当< 获取爱奇艺观看记录
  |o_result|
  |o_play_his|
  当< 获取我的视频播放记录
  |o_result|
  |o_play_his1|
  那么< 验证视频搜索结果
  |search_word|
  |魔兽         |
  那么< 验证正在倒车
  那么< 验证退出倒车



