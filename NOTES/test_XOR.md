# Test Script for XOR Gate

### Xor.tst

```
load Xor.hdl;
set a 0, set b 0, eval;
set a 0, set b 1, eval;
set a 1, set b 0, eval;
set a 1, set b 1, eval;
```
### Test Script

+ a series of commands to the simulator

### Test Script with Output File Xor.out

```
output-file Xor.out,
output-list a b out;
load Xor.hdl;
set a 0, set b 0, eval, output;
set a 0, set b 1, eval, output;
set a 1, set b 0, eval, output;
set a 1, set b 1, eval, output;
```

### Test Script with Output File Xor.out and Compare File Xor.cmp

```
output-file Xor.out,
compare-to Xor.cmp,
output-list a b out;
load Xor.hdl;
set a 0, set b 0, eval, output;
set a 0, set b 1, eval, output;
set a 1, set b 0, eval, output;
set a 1, set b 1, eval, output;
```

### Behavioral Simulation

+ the chip logic can be implemented in any high level language
+ enables high level planning and testing of a hardware architecture before writing any HDL code
+ supply the output as the "official" compare file for HDL code simulations
