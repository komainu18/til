### iOS/WatchOS
* ManualSplash ... 手動スプラッシュ
  * iOSのスプラッシュ画面は、LaunchScreenで設定できるが、表示中に裏でロード（WebAPIでログインとか情報取得）したい場合、手製で画面を作成することになる。
* LocalLocalize ... アプリ内で言語指定するローカライズ
  * 最近はOSが、アプリごとに言語設定を分けてくれているのだけど、「アプリ内あるいはサービスでユーザー言語設定を管理したい」という要件のために、アプリ内で指定できる手段を探した。
  * 画像については、ファイル名で分けるしかないのだろうか。
* MyTime ... AppleWatchとiOSとの連携
  * AppleWatchとiPhone間の通信を試す。iPhoneからはWatchのアクティブ状態を期待してはいけないが、Watchから送った時は、iPhoneはすぐに目覚めて受け取るらしい。
  * 確かにiPhoneの電源が切れたら連携が取れなくなって、そのときは通信エラーになるだろう。
* TACSample ... TCAアーキテクチャでサンプルプログラムを作ってみたもの
  * 郵便番号入力からWebAPIを用いて、結果が来たらデータを変換して表示を更新する
  * ネットワーク異常系までは書いていない
  
### Android
* 結局、JetpackComposeの方がいい？
  * もう現在のバージョンが、プロジェクト新規作成すると空のActivityがJetpackComposeになっていた。xmlとどちらかを選ぶ、とかない。

#### PostFromSwitch ... NintendoSwitchと接続して、画像ファイルを端末にダウンロード
* WebViewでindex.htmlを読ませて、画像URLをリスト保持する。
* DownloadManagerはなぜか起動しなかったので、素直にInputStreamでダウンロードした。
* `WifiNetworkSuggestion`で接続できたが、P2Pは`WifiNetworkSpecifier`を使ったほうがいいらしいので置き換える
* `connectivityManager.unregisterNetworkCallback(this)`で解除できるらしい？
* HashTag
  * 追加・編集・削除
  * タグ名、使用回数、紐付きそうなID
* TCAはSwiftUIだったか。JetpackComposeはStateとViewModelを素直に用いていく、何アーキテクチャとすればいいのか。
  * 「ハッハー！ViewModelは使わない方がいい」と海外の人は言っているが、DIどうするんだ。なぜかContextをinjectがうまくいかない。むしろ「そんなところでContextに依存させるなよ」ってことか。
  * -> `koin`から`hilt`に変えたらできた。詳しい原因は覚えていない。

### bucket list やりたいことリスト
* [ ] SwiftUIで、全画面モーダル
* [ ] SwiftUIで、ボトムナビメニュー
* [ ] AppleWatchでちょっと違う時計()
* [ ] 自分のアイコン画像作成
* [ ] 端末カメラによる画像スキャン
* [ ] Switchで𝕏連携が終わるので、もっと楽に連携する手段構築
* [ ] iOSで写真参照制限した場合、それを選ぶ画面、用意されてないのか…用意したい

### What want to know 知りたいこと
* [ ] プッシュ通知関連と、単体テストする環境があるか
