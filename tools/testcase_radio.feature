# language: zh-CN

  @radioTest
功能: IPDA收音机的相关功能验证

    背景: IPDA每日最新系统回归验证基本功能
        当< 打开收音机应用

      @radio_special_test @part1
    场景: 播放FM收音机节目并验证节目的正确性
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
          |fm_no|
          |97.5 |
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |97.5     |
 @part1
    场景: 切换上一首，然后下一首后 验证收音机恢复到原来节目
        当< 打开FM_AM选择界面
        当< 随机播放FM节目
          |o_result|
          |o_fm_no|
        当< 切换上一台
        那么< 验证播放的FM编号不一致
          |chk_fm_no|
          |o_fm_no    |
        当< 切换下一台
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |o_fm_no     |
      @previewTest @part1
    场景: 预览所有电台并选中一个收听，验证当前播放的为选中的电台
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
          |fm_no|
          |97.5 |
        当< 预览电台并随机收听
          |o_result|
          |o_fm_no |
        那么< 验证两个对象值
          |param1|option|param2|
          |97.5|!=|o_fm_no|
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP RADIO Route|

        @favTest @part1
    场景: 收藏FM电台并验证收藏记录，取消收藏
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
          |fm_no|
          |97.5 |
        当< 收藏或取消收藏电台
        当< 打开FM_AM选择界面
        那么< 验证FM是否被收藏
          |chk_fm_no|chk_is_faved|
          |97.5     |true        |
        当< 收藏或取消收藏电台
        当< 打开FM_AM选择界面
        那么< 验证FM是否被收藏
          |chk_fm_no|chk_is_faved|
          |97.5     |false        |
    @playFavedTest @part1
    场景: 播放已经收藏的电台,验证是否播放指定的电台和播放状态
#      收藏电台
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
          |fm_no|
          |97.5 |
        当< 收藏或取消收藏电台
#      选择收藏的电台播放
        当< 切换下一台
        当< 打开FM_AM选择界面
        当< 播放已经收藏的电台
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |97.5     |
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
        当< 收藏或取消收藏电台

    @searchRadioTest @part1
    场景: 输入输入框内容并清空，验证输入框内容是否清空
        当< 打开搜索界面
        当< 输入电台搜索关键字
          |key_word|
          |南京      |
        当< 清空电台搜索框
        那么< 验证电台搜索框内容
          |chk_key_word|
          |搜索        |
      @searchcancelTest @part1
    场景: 打开电台搜索并取消，回到radio主界面，验证是否回到主界面
        当< 打开搜索界面
        当< 取消电台搜索
        那么< 验证当前为收音机主界面
    @searchAndPlayTest @part1
    场景: 收听搜索的电台，并验证播放状态和电台标题
        当< 打开搜索界面
        当< 输入电台搜索关键字
          |key_word|
          |南京      |
        当< 随机播放搜索电台
          |o_result|
          |o_fm_no |
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |o_fm_no     |
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
      @radioQTTest @part1
    场景: 随机播放蜻蜓FM并验证标题和节目是否一致
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
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP MEDIA Route|
    @qtLatestTest @part1
    场景: 随机播放蜻蜓FM并验证最近收听记录
        当< 打开蜻蜓FM
        当< 随机播放蜻蜓FM栏目
          |o_result|
          |o_title |
        当< 随机播放蜻蜓FM节目
          |o_result|
          |o_name |
        当< 打开蜻蜓FM
        那么< 验证最近收听含有节目
          |chk_qt_name|
          |o_name     |
      @qtFavedTest @part2
    场景: 收藏蜻蜓FM并验证我的收藏存在收藏记录
        当< 打开蜻蜓FM
        当< 随机播放蜻蜓FM栏目
          |o_result|
          |o_title |
        当< 随机播放蜻蜓FM节目
          |o_result|
          |o_name |
        当< 收藏或取消蜻蜓FM电台
        当< 打开蜻蜓FM
        那么< 验证蜻蜓FM是否被收藏
          |chk_qt_title|chk_is_faved|
          |o_title     |true        |
        当< 收藏或取消蜻蜓FM电台
        那么< 验证蜻蜓FM是否被收藏
          |chk_qt_title|chk_is_faved|
          |o_title     |false        |

         @part2
    场景: 播放收藏的fm并验证播放标题是否正确
        当< 打开蜻蜓FM
        当< 随机播放蜻蜓FM栏目
          |o_result|
          |o_title |
        当< 随机播放蜻蜓FM节目
          |o_result|
          |o_name |
        当< 收藏或取消蜻蜓FM电台
        当< 播放收藏的蜻蜓FM
          |o_result|
          |o_title_faved|
        那么< 验证播放蜻蜓FM标题一致
          |chk_qt_title|
          |o_title     |
        那么< 验证播放蜻蜓FM标题一致
          |chk_qt_title|
          |o_title_faved     |
        当< 收藏或取消蜻蜓FM电台

      @qtNestTest @part2
    场景: 播放蜻蜓FM的下一曲，验证栏目名称不变，节目名称改变
        当< 打开蜻蜓FM
        当< 随机播放蜻蜓FM栏目
          |o_result|
          |o_title |
        当< 随机播放蜻蜓FM节目
          |o_result|
          |o_name |
        当< 切换下一台
        那么< 验证播放蜻蜓FM标题一致
          |chk_qt_title|
          |o_title     |
        那么< 验证播放FM节目不一致
          |chk_name|
          |o_name    |

        @playAndPauseTest @part2
    场景: 播放和暂停，验证FM播放状态是否正确
        当< 打开FM_AM选择界面
        当< 随机播放FM节目
          |o_result|
          |o_fm_no|
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
        当< 播放或暂停FM电台
        那么< 验证电台是否播放
          |chk_is_playing|
          |false         |
        当< 播放或暂停FM电台
        那么< 验证电台是否播放
          |chk_is_playing|
          |true         |

          @fm2audio2fmTest @part2
    场景: FM切换到音乐再返回FM，验证FM的电台号和播放状态，放音通道
        当< 打开FM_AM选择界面
        当< 随机播放FM节目
          |o_result|
          |o_fm_no|
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
        当< 回到系统主界面
        当< 打开音乐应用
        当< 点击我的音乐库
        当< 播放本地指定音乐
          |music_name|
          |小城故事        |
        那么< 验证音乐名称一致
          |chk_music_name|
          |小城故事            |
        当< 回到系统主界面
        当< 打开收音机应用
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |o_fm_no  |
        那么< 验证放音通道一致
          |chk_tinymix|
          |ASP RADIO Route|
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |

    @weitiaoTest @part2
    场景: 调整收音机微调，验证FM电台变化
        当< 打开FM_AM选择界面
        当< 随机播放FM节目
          |o_result|
          |o_fm_no|
        那么< 验证播放的FM编号一致
          |chk_fm_no|
          |o_fm_no  |
        当< 调整收音机微调
        那么< 验证播放的FM编号不一致
          |chk_fm_no|
          |o_fm_no  |
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
      @tgsqTest @part2
    场景: 收音机听歌识曲功能验证
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
          |fm_no|
          |89.7 |
        当< 点击听歌识曲
        那么< 验证听歌识曲正确

        @radioAudio @part2
    场景: radio->audio
      当< 打开FM_AM选择界面
      当< 播放指定FM节目
          |fm_no|
          |97.5 |
      那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
      当< 回到系统主界面
      当< 打开音乐应用
      当< 点击我的音乐库
      当< 播放本地指定音乐
         |music_name|
         |小城故事        |

    @ide_audio_radio @part2
    场景: 同一首歌听歌识别曲两遍后，验证播放状态和歌曲名字
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
            |fm_no|
            |97.5 |
        那么< 验证电台是否播放
          |chk_is_playing|
          |true          |
        当< 点击听歌识曲并播放
          |o_result|
          |o_name|
        当< 延时
          |sleep_time|
          |3         |
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_name|
        当< 从听歌识曲返回收音机
        当< 点击听歌识曲并播放
          |o_result|
          |o_name1|
        当< 延时
          |sleep_time|
          |3         |
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_name|
        那么< 验证音乐名称一致
          |chk_music_name|
          |o_name1|

      @his_played_test @part2
    场景: 随机选择网络回听节目，并验证节目名称
        当< 打开FM_AM选择界面
        当< 播放指定FM节目
            |fm_no|
            |97.5 |
        当< 打开电台节目列表
        当< 随机播放网络回听节目
            |o_result|
            |o_name  |
        那么< 验证播放FM节目一致
            |chk_name|
            |o_name    |
        那么< 验证电台是否播放
            |chk_is_playing|
            |true          |
        @radio_reboot_test
    场景: 关机再开机，收音机后台播放
      当< 打开FM_AM选择界面
      当< 随机播放FM节目
          |o_result|
          |o_fm_no|
      当< 重启设备
      当< 延时
          |sleep_time|
          |30        |
      那么< 验证放音通道一致测试
          |chk_tinymix|
          |ASP RADIO Route|


