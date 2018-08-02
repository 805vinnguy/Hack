# Xor Gate

```
/** Xor Gate: out = (a And Not(b)) Or (Not(a) And b))   */

CHIP Xor {
    IN a, b;
    OUT out;

    Parts:
    Not (in = a, out = nota);
    Not (in = b, out = notb);
    And (a = a, b = notb, out = a And notb);
    And (a = nota, b = b, out = nota And b);
    Or (a = a And notb, b = nota And b, out = out);
}
```

### Interface

```
IN a, b;
OUT out;
```

### Implementation

```
Parts:
...
```