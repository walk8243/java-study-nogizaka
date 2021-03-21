# java-study-nogizaka

JAVAの勉強用の乃木坂アプリケーション

## Get Started

このリポジトリはサブモジュールを含むため、以下ように `--recursive` を付けてクローンしてください。

```.sh
$ git clone --recursive git@github.com:walk8243/java-study-nogizaka.git
```

アプリケーションの起動は以下のコマンドで行います。
なお、アプリケーションはDocker Composeで環境構築されています。

```.sh
$ make up
```

実行中のアプリケーションのログは以下のコマンドで確認します。

```.sh
$ make logs
```
