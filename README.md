# 旧字体を変換する

![test](https://github.com/muuuuu2525/kyuji/actions/workflows/test.yml/badge.svg)

* 標準入力からテキストを読み込んで、旧字体を新字体に変換して出力するコマンドです。

## 概要

* 標準入力から文章を行ごとに読み込み、含まれている旧字体（例：國、學）を新字体（例：国、学）に置換して標準出力に出力します。

## 必要な環境

* Python 3.8+
* Linux (22.04/24.04 でテスト済み)
* Windows / macOS では未検証
* 入力は UTF-8 を前提としています

## インストール
* リポジトリをクローンし、実行権限を与えてください。
```bash
git clone https://github.com/muuuuu2525/kyuji.git
cd kyuji
chmod +x kyuji
```

## 使用方法

* 標準入力からテキストを渡します。
* 実行例とその出力は以下のとおりです。

```bash
$ echo "國立大學" | ./kyuji
国立大学
```

* ファイルの内容を変換することもできます。
```bash
$ cat old.txt | ./kyuji
（例）國立大學 → 国立大学
```

## 終了ステータス

- 0: 正常終了
- 1: 予期しないエラー

## テスト

以下のコマンドでテストを実行できます。

```bash
./test.sh

```

## ライセンス
* このソフトウェアは、3条項BSDライセンスの下で公開されています。
* © 2025 Manamu Asano



