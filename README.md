# 素因数分解コマンド

## 目次
- 1. 概要
- 2. 必要なソフトウェア
- 3. 準備
- 4. 使用方法
- 5. テスト環境
- 6. GitHub Acitons の結果
- 7. 著作権 ・ライセンス
- 8. 参考文献

## 概要
- 入力した正の整数を素因数分解し, 素数の積で表す. 
  見やすさのために素数の積はスペースで区切って昇順に並べ, 出力する. 


## 必要なソフトウェア
- Python
  - テスト済みバーージョン: 3.7 ~ 3.13


## 準備
- 以下のコマンドをホームディレクトリに上から順に実行してください.
 
  ```
  $ git clone https://github.com/ReotoKoya/robosys2025.git
  $ cd robosys2025
  $ chmod +x as_f
  ```

## 使用方法
- 正の整数を入力してください.
- 二つ以上の正の整数を入力しても実行できます. 　
- 入力するコマンドは以下の通りです.

  ```
  $ echo <正の整数> | ./as_f
  ```

### 実行例
- 100を入力した時の実行例

  ``` 
  $ echo 100 | ./as_f
  2 2 5 5
  ```

- 10 と20 を入力した時の実行例

  ```
  $ echo 10 20 | ./as_f
  2 5
  2 2 5
  ```
　
### 注意
- 0や１などの素数でない数字や文字列, 負の整数, 小数を入力した場合は空白( スペース ) を出力します.
 
  - 空白 ( スペース ) を出力する例

  ``` 
  $ echo 0 | ./as_f
  
  $
  ``` 

  ```
  $ echo abc | ./as_f
  
  $
  ```

## テスト環境
- Ubuntu 22.04 LTS on Windows


## GitHub Actions の結果
![test](https://github.com/ReotoKoya/robosys2025/actions/workflows/test.yml/badge.svg)


## 著作権 ・ライセンス
- このソフトウェアパッケージは, 3条項BSDライセンスの下, 再頒布および使用が許可されます．
- @ 2025 Reoto Koya

## 参考資料
- [ 第 6 回 : ソフトウェアのテスト]  https://ryuichiueda.github.io/slides_marp/robosys2025/lesson6.html#1
