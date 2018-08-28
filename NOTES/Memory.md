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
