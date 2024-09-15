# NTUEE Digital Circuit Lab 24FALL

##### author: B10901176 蔡弘祥, B10901163 張顥譽, B1090179 鄭承瑞

## Lab 1 亂數產生器

### Before Running

```shell
cd Lab1/sim
source tool.sh
```

### How To Run Simulation

1. open `src/Top.sv` and modify `SEED`
    ```verilog
    // src/Top.sv
    parameter SEED = 16'b1000_0000_0000_0000; // it cannot be 0
    ```

2. run the following commands in the terminal
    ```shell
    cd Lab1/sim/
    source run.sh
    nWave &
    ```

3. open nWave and open the file `sim/Lab1_test.fsdb`
4. select desired signals

### How To Check Registers' Type

```shell
cd Lab1/src
dv -no_gui
read_sverilog Top.sv
```

### Signal Explanation

| Signal  | Explanation |
|---------|-------------|
| i_clk   | clock       |
| i_rst_n | reset       |
| i_start | start the machine |
| i_stop  | freeze the result |
| i_show  | show the last result |
| o_random_out | output |


## Lab 2 RSA 解碼器

## Lab 3 簡單的錄音機

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
    git branch -D <branch> # force merging
    ```

6. delete a remote branch

    ```shell
    git push origin --delete <remote branch>
    ```

7. merge branch

    ```shell
    git merge <branch to be merged>
    ```