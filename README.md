# NTUEE Digital Circuit Lab 24FALL

##### author: B10901176 蔡弘祥, B10901163 張顥譽, B1090179 鄭承瑞

## Lab 1 亂數產生器

 - [Problem](./Lab1/doc/Lab1_lecture.pdf)
 - [Tutorial](./Lab1/README.md)

### Functions

- Basic
  1. 隨機產生0~15的亂數
  2. 以七段顯示器顯示
  3. 數字跳動頻率逐漸變慢
  4. 最後停在一個數字上
   
- Bonus
  1. 跳動中途擷取亂數
  2. 記憶前次亂數結果

## Lab 2 RSA256 解密機

 - [Problem](./Lab2/doc/Lab2_lecture.pdf)
 - [Tutorial](./Lab2/README.md)

### Functions

- Basic
  1. 進行RSA256解密

## Lab 3 數位錄音機

 - [Problem](./Lab3/doc/Lab3_lecture.pdf)
 - [Tutorial](./Lab3/README.md)

### Functions

- Basic
  1. 可錄音、播放
  2. 播放時可以暫停、停止
  3. 取樣值為16-bit signed，可錄製時間達32秒
  4. 需支援快速播放(2, 3, 4, 5, 6, 7, 8 倍速)以及慢速播放(1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8 倍速)
  5. 慢速播放時要包含零次內插與一次內插兩種模式

## Some Github Commands

* Remember to save and git add, git commit before doing further operations

1. upload

    ```shell
    git add .
    git commit -m "your comments"
    git push
    ```

2. download

    ```shell
    git checkout <branch>
    git fetch
    git merge
    ```

3. new branch

    ```shell
    git checkout -b <branch>
    ```

4. switch branch

    ```shell
    git checkout <branch>
    ```

5. delete a local branch

    ```shell
    git branch -d <branch> # for merged branches
    git branch -D <branch> # force deleting
    ```

6. delete a remote branch

    ```shell
    git push origin --delete <remote branch>
    ```

7. merge branch

    ```shell
    git merge <branch to be merged>
    ```