sleepi2-utils
==========

slee-Pi 2 を操作するためのツール類を提供します。

## 提供ファイル
次のファイルがパッケージに含まれています。

### /usr/sbin/sleepi2alarm  
RTC のアラームを操作するスクリプトです。  
/sys/class/rtc/${RTC_DEVICE}/wakealarm にアクセスします。  
RTC_DEVICE の値は /etc/default/sleepi2 に記述します。

* --get, -g  
  アラーム時刻を取得します。  
  未設定の場合は空の文字列を返します。  

* --set, -s \<STRING\>  
  アラーム時刻を設定します。  
  翌月同日の前日までが指定可能です。  

  \<STRING\> : 時刻を指定します。

  指定可能な文字列のフォーマットは GNU date コマンドに準拠しています。  
  次に例を示します。

  - 2017/03/17 19:00:00 に設定する場合
    ```
    sleepi2alarm --set "2017/03/17 19:00:00"
    ```
    日時を指定してアラームを設定できます。  
    時刻のみの指定も可能です。

  - 五分後に設定する場合  
    ``` bash
    sleepi2alarm --set "*5min"
    ```
    相対値を指定してアラームを設定できます。  
    year, month, day, hour, min, sec での指定が可能です。  

* --clear, -c  
  アラーム設定を解除します。

* --help, -h
  ヘルプを表示します。

* --version, -v
  バージョンを表示します。

### /usr/sbin/sleepi2ctl  
slee-Pi 2 を操作するための実行ファイルです。  
使用可能なオプションを次に示します。

* --get, -g PARAMETER  
  指定したパラメータの値を取得します。  

  パラメータには次のいずれかを指定します。

  - extin-count  
    外部入力のカウント値を表示します。  
    単位は [秒] です。  
    最大値は 255 です。

  - extin-powerdown  
    外部入力による強制電源断の設定を表示します。  

    0 : 外部入力による強制電源断が無効です。
    1 : 外部入力による強制電源断が有効です。

  - extin-trigger  
    外部入力の起動トリガの設定を表示します。  

    0 : エッジ検出で起動します。  
    1 : レベル検出で起動します。

  - extout  
    外部出力の状態を表示します。  

    0 : 外部出力はオフです。  
    1 : 外部出力はオンです。

  - restart  
    システムが無応答と判定された場合の動作設定を表示します。  

    0 : 電源断を行います。  
    1 : 電源の再投入を行います。

  - ri-trigger  
    RI 信号の起動トリガの設定を表示します。  

    0 : エッジ検出で起動します。  
    1 : レベル検出で起動します。

  - sleep    
    無応答と判定された場合のスリープ動作の設定を表示します。  

    0 : 再起動動作の設定に従います。  
    1 : ウォッチドッグ動作を停止して電源断します。

  - switch-count  
    プッシュスイッチが押下された時間のカウント値を表示します。  
    単位は [秒] です。  
    最大値は 255 です。

  - timeout  
    システムの応答を検知するタイムアウト値を表示します。  
    単位は [秒] です。
    最大値は 255 です。

    0 : 応答を検知しません。  
    1..255 : 設定値を超えても応答を検知できない場合は無応答と判定されます。

  - voltage  
    電源電圧の値を表示します。  
    単位は [mV] です。

  - wakeup-delay  
    スリープ有効時にウォッチドッグタイマが動作を開始するまでの遅延時間を表示します。  
    単位は [秒] です。  

    0 : スリープ復帰後にウォッチドッグタイマは動作を開始します。  
    1..255 : スリープ復帰後にウォッチドッグタイマは設定値が経過してから動作を開始します。

  - wakeup-flag  
    起動ステータスレジスタのフラグを表示します。  

    poweron : 電源接続が起動要因です。  
    watchdog : ウォッチドッグタイマのタイムアウトによる再起動が起動要因です。  
    alarm : リアルタイムクロックのアラーム発生が起動要因です。  
    switch : プッシュスイッチの押下が起動要因です。  
    extin : 外部入力の検出が起動要因です。  
    ri : RI 信号の検出が起動要因です。

  - wakeup-status  
    起動ステータスレジスタの値を表示します。

* --set, -s PARAMETER \<VALUE\>  
  指定したパラメータに値を設定します。  
  パラメータには次のいずれかを指定します。

  - extin-powerdown \<0,1\>  
    外部入力による強制電源断を設定します。  

    0 : 外部入力による強制電源断が無効です。  
    1 : 外部入力による強制電源断が有効です。

  - extin-trigger \<0,1\>  
    外部入力の起動トリガを設定します。  

    0 : エッジ検出で起動します。  
    1 : レベル検出で起動します。

  - extout \<0,1\>  
    外部出力を設定します。  

    0 : 外部出力はオフです。  
    1 : 外部出力はオンです。

  - ri-trigger \<0,1\>  
    RI 信号の起動トリガを設定します。  

    0 : エッジ検出で起動します。  
    1 : レベル検出で起動します。

  - sleep \<0,1\>  
    無応答と判定された場合のスリープ動作を設定します。  

    0 : 再起動動作の設定に従います。  
    1 : ウォッチドッグ動作を停止して電源断します。

  - restart \<0,1\>  
    システムが無応答と判定された場合の動作を設定します。  

    0 : 電源断を行います。  
    1 : 電源の再投入を行います。

  - timeout \<0..255\>  
    システムの応答を検知するタイムアウト値を表示します。  
    単位は [秒] です。  

    0 : 応答を検知しません。  
    1..255 : 設定値を超えても応答を検知できない場合は無応答と判定されます。

  - wakeup-delay \<0..255\>  
    スリープ有効時にウォッチドッグタイマが動作を開始するまでの遅延時間を設定します。  
    単位は [秒] です。  

    0 : スリープ復帰後にウォッチドッグタイマは動作を開始します。  
    1..255 : スリープ復帰後にウォッチドッグタイマは設定値が経過してから動作を開始します。

* --help, -h
  ヘルプを表示します。

* --version, -v
  バージョンを表示します。

### /etc/default/sleepi2   
slee-Pi 2 の設定を行うためのファイルです。  
設定可能な項目を次に示します。

* RTC_DEVICE  
  slee-Pi 2 のリアルタイムクロックモジュール部のデバイス名を記述します。  
  デフォルトは rtc0 です。

* HCTOSYS  
  リアルタイムクロックからシステムへ時刻を同期する動作の設定です。  
  デフォルトは yes です。  

  yes : 起動時に時刻を同期します。  
  no : 起動時に時刻を同期しません。  

* SYSTOHC  
  システムからリアルタイムクロックへ時刻を同期する動作の設定です。  
  デフォルトは yes です。  

  yes : 終了時に時刻を同期します。  
  no : 終了時に時刻を同期しません。  

* I2C_ADDRESS  
  slee-Pi 2 のパワーマネジメントモジュール部の I2C アドレスを指定します。  
  デフォルトは 0x69 です。

* HEARTBEAT_TIMEOUT  
  システムの応答がない場合に電源を再投入するまでの時間です。  
  単位は [秒] です。  
  無効にするには 0 を指定します。  
  デフォルトは 60 です。

* RETRY_BOOT  
  起動に失敗してシステムの応答がない場合に電源の再投入を行う設定です。  
  有効にするには 1 を指定します。  
  無効にするには 0 を指定します。  
  デフォルトは 1 です。

* SHUTDOWN_DELAY  
  システムのシャットダウンが完了してから電源断までの時間です。  
  単位は [秒] です。  
  無効にするには 0 を指定します。  
  デフォルトは 10 です。

* WAKEUP_DELAY  
  システムの起動時にウォッチドッグタイマが動作を開始するまでの時間です。  
  単位は [秒] です。  
  無効にするには 0 を指定します。  
  デフォルトは 90 です。

* EXTIN_FORCED_SHUTDOWN  
  外部入力が 10 秒以上検出された場合に強制電源断を行う設定です。  
  有効にするには 1 を指定します。  
  無効にするには 0 を指定します。  
  デフォルトは 0 です。

* EXTIN_LEVEL_TRIGGER  
  外部入力による起動トリガをレベル検出で行う設定です。  
  レベル検出に行うには 1 を指定します。  
  エッジ検出で行うには 0 を指定します。  
  デフォルトは 0 です。

* RI_LEVEL_TRIGGER  
  RI 信号による起動トリガをレベル検出で行う設定です。  
  レベル検出に行うには 1 を指定します。  
  エッジ検出で行うには 0 を指定します。  
  デフォルトは 0 です。

### /usr/lib/sleepi2-utils/systohc.sh  
システムからリアルタイムクロックへ時刻を同期するスクリプトファイルです。

### /usr/lib/sleepi2-utils/hctosys.sh  
リアルタイムクロックからシステムへ時刻を同期するスクリプトファイルです。

### /usr/lib/sleepi2-utils/heartbeat.sh  
ソフトウェアハートビート動作を行うスクリプトファイルです。

### /usr/lib/sleepi2-utils/timeoutpid.sh  
コマンド実行時にタイムアウト動作を行うスクリプトファイルです。

### /usr/lib/sleepi2-utils/start.sh  
slee-Pi 2 の起動設定を行うスクリプトファイルです。

### /usr/lib/sleepi2-utils/stop.sh  
slee-Pi 2 の停止設定を行うスクリプトファイルです。

### /usr/lib/sleepi2-utils/restart.sh  
slee-Pi 2 の再起動設定を行うスクリプトファイルです。

### /usr/share/bash-completion/completions/sleepi2alarm
sleepi2alarm のコマンド補完を行うための設定ファイルです。

### /usr/share/bash-completion/completions/sleepi2ctl
sleepi2ctl のコマンド補完を行うための設定ファイルです。

### /usr/share/doc/sleepi2-utils/copyright  
ソースの著作権とライセンスを記載したファイルです。

### /usr/share/doc/sleepi2-utils/changelog.gz  
パッケージの変更履歴を記録したファイルです。

### /lib/udev/rules.d/85-sleepi2-utils.rules  
slee-Pi 2 のデバイスを定義した設定ファイルです。

### /lib/systemd/system/sleepi2-systohc.service  
システムからリアルタイムクロックへ時刻を同期するサービスです。

### /lib/systemd/system/sleepi2-hctosys.service  
リアルタイムクロックからシステムへ時刻を同期するサービスです。

### /lib/systemd/system/sleepi2-heartbeat.service  
ソフトウェアハートビートを実行するサービスです。

### /lib/systemd/system/sleepi2-start.service  
slee-Pi 2 の起動設定を行うサービスです。

### /lib/systemd/system/sleepi2-stop.service  
slee-Pi 2 の終了設定を行うサービスです。

### /lib/systemd/system/sleepi2-restart.service  
slee-Pi 2 の再起動設定を行うサービスです。
