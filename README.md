### iOS/WatchOS
* ManualSplash ... 手動スプラッシュ
  * iOSのスプラッシュ画面は、LaunchScreenで設定できるが、表示中に裏でロード（WebAPIでログインとか情報取得）したい場合、手製で画面を作成することになる。
* LocalLocalize ... アプリ内で言語指定するローカライズ
  * 最近はOSが、アプリごとに言語設定を分けてくれているのだけど、「アプリ内あるいはサービスでユーザー言語設定を管理したい」という要件のために、アプリ内で指定できる手段を探した。
  * 画像については、ファイル名で分けるしかないのだろうか。
* MyTime ... AppleWatchとiOSとの連携
  * AppleWatchとiPhone間の通信を試す。iPhoneからはWatchのアクティブ状態を期待してはいけないが、Watchから送った時は、iPhoneはすぐに目覚めて受け取るらしい。
  * 確かにiPhoneの電源が切れたら連携が取れなくなって、そのときは通信エラーになるだろう。

### Android
* 

### bucket list やりたいことリスト
* [ ] SwiftUIで、全画面モーダル
* [ ] SwiftUIで、ボトムナビメニュー
* [ ] AppleWatchでちょっと違う時計()
* [ ] 自分のアイコン画像作成
* [ ] 端末カメラによる画像スキャン

### What want to know 知りたいこと
* [ ] プッシュ通知関連と、単体テストする環境があるか
