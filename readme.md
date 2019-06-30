# auto_connect_any_wifi
## connect_any_ssid.sh
自動でwifiにつないで認証を行うやつ。  

研究室のwifiが存在していればそちらに優先してつなぐ。  
研究室のwifiがなかったら大学のwifiに繋ぐ。  
そしてそのときに自動で学生認証もやるよ。  

研究室のwifi, 大学のwifiは`PRIMARY_SSID`, `SECONDRY_SSID`で変数にしてあるので  
各位よしなに登録してね。  
wifiスキャンするやつとか諸々はmacos組み込みのものを使っているのでunixでやりたい人は各種書き換えてください。  

書き換えたものをpullrequestしてもいいんだよ・ワ・  

ぼくはtouchbarに現在接続中のSSIDを表示するものを設置しているんだけど,  
そいつをタップしたら自動でこのshell scriptが走るようになってるよ。  

## touchbar_ssid.sh
先述したtouchbarに現在接続しているssidを表示するやつだよ。  
実態はただ現在接続しているwifiのssidを取ってきて整形して表示しているだけだよ。  

