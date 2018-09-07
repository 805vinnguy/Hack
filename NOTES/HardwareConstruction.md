# Hardware Construction

## Players

+ System Architects
    + Decides which chips are needed
    + For each chip, creates
        + A chip API
        + A test script
        + A compare file
+ Developers
    + Builds chips based on resources given from System Architects

+ Once you build a gate you can use it.
+ Hack chipset API provided on site.
+ Multi-bit busses are indexed right to left.
    + If A is a 16-bit bus, then A[0] is the right-most bit(lsb) and A[15] is the left-most bit(msb).
+ for this particular hdl, can have multiple chip outputs.
    + CHIPNAME (a = a, b = b, out = out, out[15] = ng, ...);

## NAND Gate

        HIGH VOLT
            |
            |
         resistor
            |
            |______________out
            |
        ____|
 A__|   |
    |   |___
            |
        ____|
 B__|   |
    |   |___
            |
            |
            V
           GND