## アプリケーション名

**トレコミグラフ**
由来は「トレイン＋混み（コミュニティ）＋グラフ」です。鉄道の混み具合をグラフで見えるアプリです。投稿とコメントを通して作り上げつアプリなので、「コミ」には「混み」のほか「コミュニティ」の意味も含ませています。

## アプリケーション概要

西武新宿線の混雑状況を投稿・共有することができる投稿型アプリケーションです。<br>
TOP画面での駅と方面を絞って混雑度を検索<br>
![torekomi3](https://user-images.githubusercontent.com/64535376/121823869-e618eb00-cce2-11eb-8c6d-55338b12ab96.gif)<br>
投稿画面<br>
![torekomi4](https://user-images.githubusercontent.com/64535376/121823874-f0d38000-cce2-11eb-869b-9864e07b1555.gif)

## プロジェクト概要

共同開発を経験してみたい未経験エンジニアが集まってハッカソンを実施。
4〜6 名で構成された Ruby、PHP、Python のチームがおり、それぞれがアプリ開発してレビューし合う、というプロジェクトです。
このアプリケーションは Ruby を中心に学習した 5 名の未経験エンジニアによって開発されました。

## URL

https://torecomigraph.herokuapp.com

## テスト用アカウント

ID: hackathonruby@gmail.com
Pass: ruby1111

## 利用方法

ユーザーはログインして、「方面」「駅名」「日付」「時間帯（1 時間単位）」「混雑具合（5 段階）」「コメント（任意）」を投稿が可能。アプリは投稿データをもとに、TOP 画面でグラフを作成します。グラフにすることで混雑の見える化を図っています。また、TOP 画面では全ユーザーの最近の投稿一覧を見ることができ、投稿情報を共有することができます。駅ごとの混雑度の検索をかけ、その駅の時間帯ごとの混雑度を見ることが可能です。

## 目指した課題解決

- 通勤通学時間帯の混雑具合以外に、日中のイベントなどで混雑しているのかを投稿やグラフから確認できるように目指しました。過去にイベントがあった時間帯前後の混雑具合を検索すれば、結果を得られる仕組みです。
- グラフで混雑具合をわかりやすく表現しました

## ローカルでの動作方法（Usage）

docker を使用しているため、docker をインストールしてください。
その後、下記コマンドでローカルで動作させることができます。

```
$ git clone https://github.com/yosnak13/hackathon_ruby_team
$ docker-compose build
$ docker-compose exec web rails db:create
$ docker-compose up
```

## 開発環境

Ruby 2.6.5  
Rails 5.2.5  
Docker version 20.10.6

## 作成者

yosnak13: https://github.com/yosnak13  
Kazuya-Sakashita: https://github.com/Kazuya-Sakashita  
hiroshi-00: https://github.com/hiroshi-00  
moonlight4617: https://github.com/moonlight4617  
geta-mac: https://github.com/geta-mac
