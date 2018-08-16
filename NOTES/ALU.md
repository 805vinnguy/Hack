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

+ to zero x and y with zx and zy, use And16 with !zx
+ to not x and y with nx and ny, use Not16
+ can simulate if statement possibly by using mux to select between options whether something is 0 or 1.
    + calculate both x + y and x & y and put into intermediate pins and mux between the two based on f select.
    + same principle with nx, compute both options and use nx as select input.
    + same principle with no as well.
    + probably will not need to do anything for out column since if the rules are followed with opcode, will get appropriate answer
+ operations done consecutively so must use output of the previous instead of original input pin.
