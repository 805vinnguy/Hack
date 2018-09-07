# Memory

### Sequential Logic

+ As long as our clock cycle is not too fast, as long as we take, give ourselves enough time between consecutive time units, we can ignore everything that happened at the beginning of the cycle. And as long as by the end of time unit, all of the signals reach their true and final and consistent state, we're all done.

+ time t
+ out[t] = function(in[t-1])

### Combinatorial Logic

+ time t
+ out[t] = function(in[t])

### 1 bit register

1-bit register
```
if load(t-1) then out(t) = in(t-1)
else out(t) = out(t-1)
```

> mux(in, out, load) --> DFF --> out

### Memory Units

RAM

+ stores data on which our programs operate
+ stores instructions which are the building blocks of the programs themselves
+ **RAM abstraction** is a sequence of *n* addressable registers 0 to *n*-1
    + *At any given point, only one register in RAM may be selected.*
+ *k* = width of address input = log2(n)
+ **optional to change** : *w* = word width (has no impact on RAM logic)
    + for the Hack computer, it is default 16 bit
+ RAM is a sequential chip with clocked behavior (depends on clock input)
+ to **read register *i***, set *address* = *i*
    + *out* emits the state of register *i*
+ to **write *v* into register *i***, set *address* = *i*, set *in* = *v*, set *load* = 1
    + the state of register *i* becomes *v* and from the next cycle onward, *out* emits *v*
+ why RAM?
    + Because irrespective of the RAM size, every register can be accessed at the same time -- instantaneously!

|chip  |n    |k  |
|:-:   |:-:  |:-:|
|RAM8  |8    |3  |
|RAM64 |64   |6  |
|RAM512|512  |9  |
|RAM4K |4096 |12 |
|RAM16K|16384|14 |



> RAM (in, address, load) --> out

Register

+ to **read** the register, just probe the *out* pin of the register
    + *out* emits the register's state

+ to **write** register value to *v*, set *in* = *v* and *load* = 1
    + the register's state will become *v* and from the next cycle onward, *out* emits *v*

### PC

+ keep track of which instruction should be fetched and executed next
+ contains the address of this instruction
+ **reset** : fetch the first instruction, PC = 0
+ **next** : fetch the next instruction, PC++
+ **goto** : fetch instruction *n*, PC = *n*

> PC register --> possible register *in*'s --> Mux8Way16 --> register *in* --> load PC register --> out

|reset|load|inc|operation|mux input  |
|:-:  |:-: |:-:|:-:      |:-:        |
|0    |0   |0  |nothing  |PC(out)    |
|0    |0   |1  |inc      |PC+1(out+1)|
|0    |1   |0  |load     |in         |
|0    |1   |1  |load     |in         |
|1    |0   |0  |reset    |0          |
|1    |0   |1  |reset    |0          |
|1    |1   |0  |reset    |0          |
|1    |1   |1  |reset    |0          |
