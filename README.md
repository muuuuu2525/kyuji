# 旧字体を変換する

![test](https://github.com/muuuuu2525/kyuji/actions/workflows/test.yml/badge.svg)

* 標準入力からテキストを読み込んで、旧字体を新字体に変換して出力するコマンドです。

## 概要

* 標準入力から文章を行ごとに読み込み、含まれている旧字体（例：國、學）を新字体（例：国、学）に置換して標準出力に出力します。  #*d

## 必要な環境

* Python 3.7+
* Linux (tested on Ubuntu 20.04/22.04)

## 使用方法

* 標準入力からテキストを渡します。

```bash
$ echo "國立大學" | ./kyuji.py

## インストール
*リポジトリをクローンしてください。

git clone https://github.com/muuuuu2525/kyuji.git

##ライセンス
*このソフトウェアは、BSD 3条項ライセンスの下で公開されています。
*© 2025 Manamu Asano



