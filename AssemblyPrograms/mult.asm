// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

    @bitmask
    M=1    // bitmask = 0000000000000001 = 1, just double to get next bitmask, subtract 32768 jmp loop if 0

(LOOP)
    @R1
    D=M
    

//          0010 = 2 R0
//          0101 = 5 R1
//          0010
//         0000
//        0010
//       0000
//       0001010 = 10

// one option is to bit mask for every bit in R1
// each shift multiply by 2