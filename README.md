# 相対誤差コマンド

![test](https://github.com/ReotoKoya/robosys2025/actions/workflows/test.yml/badge.svg)

## 概要
- 任意の真値と実測値に対する相対誤差を求めるコマンドです.
  相対誤差は小数点第2位以下の四捨五入した%形式で出力します.


## 必要なソフトウェア
- Python
  - テスト済みバーージョン: 3.7 ~ 3.13


## 準備
- 以下のコマンドをホームディレクトリに上から順に実行してください.
 
  ```
  $ git clone https://github.com/ReotoKoya/robosys2025.git
  $ cd robosys2025
  $ chmod +x rel_er
  ```

## 使用方法
- 真値, 実測値の順に入力してください.
- 複数のデータを入力することもできます. \
  入力されたデータ順に改行で区切って相対誤差を出力します. 　
- 入力するコマンドは以下の通りです.

  ```
  $ echo <"真値 実測値"> | ./rel_er
  ```

### 実行例
- 真値に10, 実測値に10.5 を入力した時の実行例

  ``` 
  $ echo "10 10.5" | ./rel_er
  5.00%
  ```

- 真値10と実測値10.5, 真値10と実測値11の複数データを入力した時の実行例

  ```
  $ echo  -e "10 10.5\n10 11" | ./rel_er
  5.00%
  10.00%
  ```
- 予め真値と実測値の数値ペアが複数記述されているテキストデータを入力した時の実行例

  ```
  data.txtの中身(左の縦列が真値, 右の縦列が実測値)  
  10 9
  10 9.5
  10 10
  10 10.5
  ```
  
  ```
  $ ./rel_er < data.txt
  10.00% 
  5.00%
  0.00%
  5.00%
  ```

　
### エラー処理について
- エラーの時は, 何も出力せずに終了ステータスで通知します.

  - 真値に0を入力した場合, 終了ステータスは１になります.

  ``` 
  $ echo "0 1" | ./rel_er 
  $ echo $?
  1
  ```
 
  - 入力した一行当たりのデータ数が２個でない, 空行, データ数の不足などがあれば, \
    終了ステータスは2になります.

  ```
  $ echo -e "10 10.5\n10" | ./rel_er
  $ echo $?
  2
  ```

  - 文字などの数値以外を入力した場合, 終了ステータスは３になります.

  ```
  $ echo "a 10" | ./rel_er
  $ echo $?
  3 
  ```

## テスト環境
- Ubuntu 22.04 LTS on Windows
- GitHub Actions

## 著作権 ・ライセンス
- このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可されます．
- @ 2025 Reoto Koya

## 参考資料
- [第 6 回 : ソフトウェアのテスト](https://ryuichiueda.github.io/slides_marp/robosys2025/lesson6.html)
- [第 7 回 : GitHub でのテスト](https://ryuichiueda.github.io/slides_marp/robosys2025/lesson7.html)
- [Pythonのappend()でリストに要素を追加する](https://www.headboost.jp/python-append/)
- [Pythonのf文字列（f-strings）とは？わかりやすく解説します！](https://it-infomation.com/python-f-strings/)
