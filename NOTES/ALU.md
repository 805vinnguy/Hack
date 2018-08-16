# ALU Operation

| pre-setting the x input  | pre-setting the y input  | selecting between computing + or &  | post-setting the output  | resulting ALU output  |
|:-:|:-:|:-:|:-:|:-:|

| zx                | nx                 | zy                | ny                 | f  | no  | out  |
|:-:                |:-:                 |:-:                |:-:                 |:-: |:-:  |:-:   |
| if zx then x = 0  | if nx then x = !x  | if zy then y = 0  | if ny then y = !y  | if f then out = x + y else out = x & y  | if no then out = !out  | out(x,y) =  |
|         1         |          0         |        1          |          0         | 1 | 0 | 0   |
|         1         |          1         |        1          |          1         | 1 | 1 | 1   |
|         1         |          1         |        1          |          0         | 1 | 0 | -1  |
|         0         |          0         |        1          |          1         | 0 | 0 | x   |
|         1         |          1         |        0          |          0         | 0 | 0 | y   |
|         0         |          0         |        1          |          1         | 0 | 1 | !x  |
|         1         |          1         |        0          |          0         | 0 | 1 | !y  |
|         0         |          0         |        1          |          1         | 1 | 1 | -x  |
|         1         |          1         |        0          |          0         | 1 | 1 | -y  |
|         0         |          1         |        1          |          1         | 1 | 1 | x+1 |
|         1         |          1         |        0          |          1         | 1 | 1 | y+1 |
|         0         |          0         |        1          |          1         | 1 | 0 | x-1 |
|         1         |          1         |        0          |          0         | 1 | 0 | y-1 |
|         0         |          0         |        0          |          0         | 1 | 0 | x+y |
|         0         |          1         |        0          |          0         | 1 | 1 | x-y |
|         0         |          0         |        0          |          1         | 1 | 1 | y-x |
|         0         |          0         |        0          |          0         | 0 | 0 | x&y |
|         0         |          1         |        0          |          1         | 0 | 1 | x or y |

> "Simplicity is the ulitmate sophistication." - Leonardo da Vinci

### Thoughts

+ to zero x and y with zx and zy, use And16
+ to not x and y with nx and ny, use Not16