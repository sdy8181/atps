# language: zh-CN

  @audioTest
功能: IPDA音乐的相关功能验证

    背景: IPDA每日最新系统回归验证基本功能
      当< 打开音乐应用

      @play_local_music
    场景: 播放本地指定音乐
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐名称一致
          |chk_music_name|
          |小城故事            |
        那么< 验证歌手名字一致
          |chk_artist|
          |邓丽君        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
    @netAudioTest
    场景: 搜索网络音乐并指定演唱者播放
        当< 打开音乐搜索
        当< 根据关键字搜索网络音乐
          |key_word|
          |世界第一等   |
        当< 根据歌手播放搜索结果
          |artist|
          |张杰    |
        那么< 验证音乐名称一致
          |chk_music_name|
          |世界第一等         |
        那么< 验证歌手名字一致
          |chk_artist|
          |张杰        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
     @net_music_test
    场景: 搜索网络音乐并指定音乐播放
        当< 打开音乐搜索
        当< 根据关键字搜索网络音乐
          |key_word|
          |刘德华     |
        当< 根据音乐播放搜索结果
          |music_name|
          |一起走过的日子   |
        那么< 验证音乐名称一致
          |chk_music_name|
          |一起走过的日子       |
        那么< 验证歌手名字一致
          |chk_artist|
          |刘德华       |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |

       @prevAfter5sTest
    场景: 播放5s后切换上一首音乐，音乐从头播放,不会切歌
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        当< 延时
          |sleep_time|
          |5         |
        当< 切换上一首音乐
        那么< 验证音乐名称一致
          |chk_music_name|
          |小城故事            |
    @prev_in_5s_Test
    场景: 播放5s内切换上一首音乐，音乐切歌到上一首
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        当< 切换上一首音乐
        那么< 验证音乐名称不一致
          |chk_music_name|
          |小城故事            |
    @pauseAndPlayTest
    场景: 暂停和播放音乐，验证播放状态是否正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        当< 播放或暂停音乐
        那么< 验证音乐是否播放
          |is_playing|
          |false      |
        当< 播放或暂停音乐
        那么< 验证音乐是否播放
          |is_playing|
          |true      |


    场景: 切换下一首音乐，验证音乐切换成功
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        当< 切换下一首音乐
        那么< 验证音乐名称不一致
          |chk_music_name|
          |小城故事            |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
    @clearTest
    场景: 清空音乐搜索框并取消回到主界面
        当< 打开音乐搜索
        当< 根据关键字搜索网络音乐
          |key_word|
          |无心睡眠    |
        那么< 验证音乐搜索框内容
          |chk_key_word|
          |无心睡眠        |
        当< 清空音乐搜索框
        那么< 验证音乐搜索框内容
          |chk_key_word|
          |搜索        |
        当< 取消音乐搜索
        那么< 验证当前为音乐主界面

      @smart_music_test
    场景: 打开并播放今日歌单中的歌曲，校验歌曲正常播放
        当< 打开今日歌单
        当< 随机播放今日歌单
          |o_result|
          |o_ret   |
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_ret         |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |

      @tata
    场景: 校验听ta的歌的歌手是否一致
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |离开         |
        当< 打开音乐列表
        那么< 验证听ta的歌是否一致
          |chk_artist|
          |野孩子       |
      @netMusicTest
    场景: 随机播放网络音乐，验证网络音乐播放正常，放音通道正确
        当< 打开酷我音乐
        当< 随机播放网络音乐
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

    场景: 播放FLAC格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |大地        |
        那么< 验证音乐名称一致
          |chk_music_name|
          |大地         |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @APE_musci_test
      场景: 播放APE格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |叶振棠-万里长城永不倒|
        那么< 验证音乐名称一致
          |chk_music_name|
          |叶振棠-万里长城永不倒|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
      @oggTest
      场景: 播放OGG格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |信仰_张信哲_new_ogg|
        那么< 验证音乐名称一致
          |chk_music_name|
          |信仰_张信哲_new_ogg|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
      @wavTest
      场景: 播放WAV格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |Alone     |
        那么< 验证音乐名称一致
          |chk_music_name|
          |Alone         |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
      @awbTest
      场景: 播放AWB格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |爱的供养_杨幂_awb|
        那么< 验证音乐名称一致
          |chk_music_name|
          |爱的供养_杨幂_awb|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @mp3128kpsTest
      场景: 播放MP3128kps格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |3D低频火花|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |3D低频火花|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
      @mp3320kpsTest
      场景: 播放MP3320kps格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |吉拉拉|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |吉拉拉|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @amrTest
      场景: 播放AMR格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |独角戏amr|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |独角戏amr|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @wmaTest
      场景: 播放WMA格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |那一天|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |那一天|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @m4aTest
      场景: 播放M4A格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |信仰_张信哲_new_m4a|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |信仰_张信哲_new_m4a|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @accTest
      场景: 播放ACC格式的音乐，验证音乐放音通道正常
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |one_time_aac|
#        验证音乐名称，防止无法播放跳过
        那么< 验证音乐名称一致
          |chk_music_name|
          |one_time_aac|
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @usb_cnt_Test
      场景: 验证U盘音乐数量
        当< 点击我的音乐库
        那么< 验证U盘音乐数量
          |chk_usb_cnt|
          |3          |
      @usb_play_Test
      场景: 播放U盘音乐,验证放音通道一致
        当< 点击我的音乐库
        当< 播放U盘音乐
        那么< 验证当前为U盘音乐
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @usb_next_Test
      场景: 播放U盘音乐下一首，验证下一首为U盘音乐
        当< 点击我的音乐库
        当< 播放U盘音乐
        当< 切换下一首音乐
        那么< 验证当前为U盘音乐

      @usb_prev_Test
      场景: 播放U盘音乐上一首，验证上一首为U盘音乐
        当< 点击我的音乐库
        当< 播放U盘音乐
        当< 切换上一首音乐
        那么< 验证当前为U盘音乐

        @prev_next_test
      场景: 播放音乐下一首再切换上一首，验证音乐回到之前音乐
        当< 获取当前音乐名称
          |o_result|
          |o_name|
        当< 切换下一首音乐
        当< 切换上一首音乐
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_name        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |

          @audio_voice_test
    场景: 播放音乐过程中，唤醒IVOKA，ivoka还在播报中 验证音乐播放状态
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        当< 播放音频文件
          |voice_file|
          |你好语音助理.m4a|
        那么< 验证音乐是否播放
          |is_playing|
          |false     |

    @today_bluetooth_today_test
    场景: 网络音乐切换到蓝牙音乐再切换到网络音乐--音乐界面错误
        当< 打开今日歌单
        当< 随机播放今日歌单
          |o_result|
          |o_ret   |
        当< 手机播放QQ音乐
        当< 点击我的音乐库
        当< 播放蓝牙音乐
        当< 延时
          |sleep_time|
          |30         |
        那么< 验证音乐名称不一致
          |chk_music_name|
          |o_ret|
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 打开今日歌单
        当< 随机播放今日歌单
          |o_result|
          |o_ret   |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_ret|
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

    @back_car_test @ingore
    场景: 倒车下音乐静音，倒车结束，音乐恢复，播放状态为播放
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 获取MEDIA音量
          |o_result|
          |o_volume|
        当< 开始倒车
        当< 延时
          |sleep_time|
          |25         |
        那么< 验证MEDIA音量一致
          |chk_volume|
          |0              |
        当< 结束倒车
        那么< 验证MEDIA音量一致
          |chk_volume|
          |o_volume   |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |

      @net_audio_skip_test
    场景: 播放网络音乐时，经常歌曲没有播放完就自动跳歌
            验证歌曲即将结束的时候(10s)歌曲名称是否为当前音乐名称
        当< 打开今日歌单
        当< 随机播放今日歌单
          |o_result|
          |o_ret   |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 等待音乐播放即将结束
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_ret|

    场景: 播放U盘音乐,拔出U盘，再插上U盘
        当< 点击我的音乐库
        当< 播放U盘音乐
        那么< 验证当前为U盘音乐
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        当< 拔出U盘
        那么< 验证U盘已拔出
        当< 插上U盘
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

      @bluetooth_music_test
    场景: 播放蓝牙音乐
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐名称一致
          |chk_music_name|
          |小城故事            |
        当< 手机播放QQ音乐
        当< 点击我的音乐库
        当< 播放蓝牙音乐
        当< 延时
          |sleep_time|
          |5         |
        那么< 验证音乐名称不一致
          |chk_music_name|
          |小城故事            |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

    @dail_in_playing_music_test
    场景: 播放音乐过程中拨打电话，挂断电话回到音乐播放界面并继续播放，同时验证放音通道
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事       |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 手机拨打号码
          |phone_no|
          |10086   |
        当< 延时
          |sleep_time|
          |10         |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP BTPHONE Route|
        当< 手机挂断电话
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|

    场景: 播放相似歌曲，验证相似歌曲正常播放
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事       |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 打开音乐列表
        当< 随机播放相似歌曲
          |o_result|
          |o_name  |
        那么< 验证音乐名称不一致
          |chk_music_name|
          |小城故事        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
    场景: 播放听ta的歌曲，验证歌曲正常播放
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事       |
        那么< 验证音乐是否播放
          |is_playing|
          |true     |
        当< 打开音乐列表
        当< 随机播放听TA的歌
          |o_result|
          |o_name  |
        那么< 验证音乐名称不一致
          |chk_music_name|
          |小城故事        |
        那么< 验证音乐是否播放
          |is_playing|
          |true      |

    @fav_music_test
    场景: 收藏U盘音乐，并验证我的收藏记录
        当< 点击我的音乐库
        当< 播放U盘音乐
        那么< 验证当前为U盘音乐
        那么< 验证音乐是否播放
          |is_playing|
          |true      |
        当< 获取当前音乐名称
          |o_result|
          |o_name|
        当< 点击音乐收藏或取消收藏
        当< 延时
          |sleep_time|
          |3         |
        当< 点击我的音乐库
        那么< 验证我的收藏记录
          |name|is_faved|
          |o_name|true  |
        当< 点击音乐收藏或取消收藏














