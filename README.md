# NTUEE Digital Circuit Lab 24FALL

##### author: B10901176 蔡弘祥, B10901163 張顥譽, B1090179 鄭承瑞

## Important Links

 - [Quartus Project](https://drive.google.com/drive/folders/1OktEoPV2jMeLqUy1SiT1-zwpx0gXxLmx?usp=sharing)
 - [Tutorial Playlist](https://www.youtube.com/playlist?list=PLP9ciln8xBIb9-tJLALe52f9hO5jF7NEm)
 - [Lab 3 Documentary](https://youtu.be/LfaZXk93TVM?si=xt3CV7MuYrcmKlDo)
 - [Final Documentary](https://youtu.be/1tR94tOqX50?si=pVh7EZTTQjXuG8Md)

## Lab 1 亂數產生器

 - [Problem](./Lab1/doc/Lab1_lecture.pdf)
 - [Report](./Lab1/doc/team04_lab1_report.pdf)
 - [Tutorial Doc](./Lab1/README.md)
 - [Tutorial Video](https://youtu.be/d8w0doN23KI)
 - [Demo Video](https://youtube.com/shorts/18ylWNKHyas?feature=share)

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
 - [Report](./Lab2/doc/team04_lab2_report.pdf)
 - [Tutorial Doc](./Lab2/README.md)
 - [Tutorial Video](https://youtu.be/MsHFpBeLLhE)
 - [Demo Video](https://youtube.com/shorts/qKg8rVshnjM?feature=share)

### Functions

- Basic
  1. 進行RSA256解密

## Lab 3 數位錄音機

 - [Problem](./Lab3/doc/Lab3_lecture.pdf)
 - [Report](./Lab3/doc/team04_lab3_report.pdf)
 - [Tutorial Doc](./Lab3/README.md)
 - [Tutorial Video 1](https://youtu.be/lxQ1CqLxdgA)
 - [Tutorial Video 2](https://youtu.be/XZyHApFdQvU)
 - [Demo Video](https://youtube.com/shorts/vMJCUgTGA44?feature=share)
 - [Documentary](https://youtu.be/LfaZXk93TVM?si=xt3CV7MuYrcmKlDo)

### Functions

- Basic
  1. 可錄音、播放
  2. 播放時可以暫停、停止
  3. 取樣值為16-bit signed，可錄製時間達32秒
  4. 需支援快速播放(2, 3, 4, 5, 6, 7, 8 倍速)以及慢速播放(1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8 倍速)
  5. 慢速播放時要包含零次內插與一次內插兩種模式

- Bonus
  1. 可將錄音/播放時間顯示在七段顯示器上

## Final P2P賽車遊戲

 - [Report](./Final/doc/team04_final_report.pdf)
 - [Presentation Slide](./Final/doc/team04_final_presentation.pdf)
 - [Intro Doc](./Final/README.md)
 - [Demo Video](https://youtu.be/5cRheklZcRc)
 - [Documentary](https://youtu.be/1tR94tOqX50?si=pVh7EZTTQjXuG8Md)

### Features

  1. 2-Player Competition
  2. Wheels and paddles as control
  3. Vibration feedback
  4. Different friction constants for different tracks
  5. 2D elastic collision

## Other DCLAB Links/Repo

 - [Official Youtube Channel](https://www.youtube.com/@dclabntuee8993)
 - [Materials](https://github.com/Terminatorjjjjj/NTUEE-DCLAB-Materials.git)
 - [2017 Spring, victoresque, Lab 1, Lab 2, Lab 3](https://github.com/victoresque/DCLab.git)
 - [2017 Spring, victoresque, Final](https://github.com/victoresque/FPGA-Renderer.git)
 - [2020 Fall, ChienKaiMa, All](https://github.com/ChienKaiMa/2020Fall-NTUEE-DCLAB.git)
 - [2020 Fall, ChienKaiMa, Final](https://github.com/ChienKaiMa/HDR-Imaging-with-FPGA.git)
 - [2021 Fall, DCLAB08, Final](https://github.com/DCLAB08/Real-Time-Image-Video-Dehazing.git)
 - [2024 Spring, dereklin1205, All](https://github.com/dereklin1205/NTUEE_DCLAB.git)
 - [2024 Fall, gary920209, Lab 1, Lab 2, Lab 3](https://github.com/gary920209/Digital_Design_Lab.git)
 - [2024 Fall, gary920209, Final](https://github.com/gary920209/music_interactive_games.git)

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

8. bring back deleted files
   
   ```shell
   git checkout <PREVIUS COMMIT> -- .
   git add .
   git commit -m "Restore all deleted files"
   ```